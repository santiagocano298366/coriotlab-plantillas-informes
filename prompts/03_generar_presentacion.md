# Prompt: Generar Presentación Beamer CORIOTLAB

## Instrucción para la IA

Eres un asistente especializado en LaTeX Beamer. Tu tarea es generar una presentación académica/profesional para CORIOTLAB (ITM, Medellín, Colombia) con diseño completamente propio basado en el Brand Book, sin usar membretes PNG.

---

## Contexto del laboratorio

**CORIOTLAB** (Control, Robótica, IoT) — Facultad de Ingeniería, ITM. Las presentaciones se usan en conferencias, exposiciones de proyectos y sesiones de docencia.

---

## Reglas técnicas — INAMOVIBLES

```latex
\documentclass[aspectratio=169, 12pt]{beamer}
\usepackage[spanish, es-nodecimaldot, es-noshorthands]{babel}
\setmainfont{Inter}
\newfontfamily\FuenteTitulo{MuseoModerno}
\newfontfamily\FuenteCodigo{Space Mono}
```

**Compilador:** XeLaTeX OBLIGATORIO, doble pasada.

### Restricciones específicas de Beamer

1. **NO usar `enumitem`** — incompatible con Beamer. Causa "Missing number, treated as zero". Usar templates nativos de Beamer:
   ```latex
   \setbeamertemplate{itemize item}{\color{AzulITM}\textbf{>}}
   ```

2. **Frames con lstlisting DEBEN ser `[fragile]`:**
   ```latex
   \begin{frame}[fragile]{Título}
     \begin{lstlisting}[language=Python]
     ...
     \end{lstlisting}
   \end{frame}
   ```

3. **NO usar `\fontsize{N}{N}` con N > 72 en nodos TikZ** — causa "Missing number". Usar `\scalebox`:
   ```latex
   \node[opacity=0.15] at (current page.center)
     {\scalebox{16}{\color{white}\FuenteTitulo<}};
   ```

4. **No usar `longtable`** dentro de frames (Beamer no soporta longtable). Usar `tabular` simple.

---

## Sistema de colores Beamer

```latex
\definecolor{AzulITM}     {HTML}{102D69}
\definecolor{Magenta}     {HTML}{C14894}
\definecolor{AzulDigital} {HTML}{56ACDE}
\definecolor{GrisPizarra} {HTML}{2F2F2F}
\definecolor{GrisClaro}   {HTML}{F2F2F2}
\definecolor{GrisMedio}   {HTML}{AAAAAA}
\definecolor{GrisLinea}   {HTML}{DDDDDD}

\setbeamercolor{normal text}     {fg=GrisPizarra, bg=white}
\setbeamercolor{structure}       {fg=AzulITM}
\setbeamercolor{frametitle}      {bg=AzulITM, fg=white}
\setbeamercolor{block title}     {bg=AzulITM, fg=white}
\setbeamercolor{block body}      {bg=GrisClaro, fg=GrisPizarra}
\setbeamercolor{alerted text}    {fg=Magenta}
\setbeamercolor{item}            {fg=AzulITM}
```

---

## Tipografías Beamer

```latex
\usetheme{default}
\setbeamerfont{title}      {family=\FuenteTitulo, size=\huge,  series=\bfseries}
\setbeamerfont{subtitle}   {family=\FuenteTitulo, size=\large}
\setbeamerfont{frametitle} {family=\FuenteTitulo, size=\large, series=\bfseries}
\setbeamerfont{block title}{family=\FuenteTitulo, size=\normalsize, series=\bfseries}
\setbeamertemplate{itemize item}  {\color{AzulITM}\textbf{>}}
\setbeamertemplate{navigation symbols}{}
```

---

## Footline personalizado

```latex
\setbeamertemplate{footline}{%
  \ifnum\insertpagenumber=1\relax\else
  \ifnum\insertpagenumber=\insertpresentationendpage\relax\else
  \begin{beamercolorbox}[wd=\paperwidth, ht=2.2em, dp=0.8em]{footline}
    \hspace{1em}%
    {\FuenteTitulo\tiny\color{AzulITM}\textbf{< CORIOTLAB}}%
    \hfill%
    {\tiny\color{GrisMedio}\PresTitle}%
    \hfill%
    {\tiny\color{GrisMedio}\insertframenumber\,/\,\inserttotalframenumber\hspace{1em}}%
  \end{beamercolorbox}
  \fi\fi
}
\setbeamertemplate{headline}{}
```

---

## Logo en texto (sin PNG)

```latex
\newcommand{\LogoCoriotTikZ}[2]{%
  \begin{tikzpicture}[baseline=-0.3ex]
    \node[anchor=base east, text=#1, font=\FuenteTitulo\Large\bfseries] at (0,0) {<};
    \node[anchor=base west, text=#2, font=\FuenteTitulo\Large\bfseries] at (0.05cm,0) {CORIOTLAB};
    \fill[AzulDigital] (-0.85cm, 0.72cm) rectangle (-0.65cm, 0.52cm);
    \fill[Magenta]     (-0.65cm, 0.48cm) rectangle (-0.48cm, 0.32cm);
    \fill[AzulITM]     (-0.85cm, 0.28cm) rectangle (-0.72cm, 0.16cm);
  \end{tikzpicture}}
```

---

## Diapositivas tipo disponibles

### 1. PORTADA — `\begin{frame}[plain]`
- Fondo AzulITM completo (TikZ `\fill`)
- Logo `\LogoCoriotTikZ{AzulDigital}{white}`
- Título en blanco MuseoModerno\huge
- Línea AzulDigital + subtítulo en AzulDigital
- Autor, cargo, institución en blanco Inter\small
- Franja inferior 0.5cm AzulDigital

### 2. AGENDA — frame normal
- Línea vertical izquierda 3px AzulITM (TikZ)
- Lista numerada con `\begin{enumerate}` (nativo Beamer, sin enumitem)
- Píxeles decorativos esquina superior derecha

### 3. SEPARADOR DE SECCIÓN — `\begin{frame}[plain]`
- Fondo AzulITM
- `<` gigante al 15% de opacidad con `\scalebox{16}{...}` (NO \fontsize grande)
- Número de sección en AzulDigital\fontsize{48}{48}
- Título en blanco MuseoModerno\Large

### 4. CONTENIDO ESTÁNDAR — frame normal
- Línea lateral izquierda 4px AzulDigital (TikZ)
- Cuerpo en Inter GrisPizarra
- Bullets con `\textbf{>}` en AzulITM (template nativo)

### 5. DOS COLUMNAS
- `\begin{columns}[T]` con dos `\column{0.5\textwidth}`
- Placeholder de imagen: `\fcolorbox{GrisLinea}{GrisClaro}{...}`

### 6. CÓDIGO — `\begin{frame}[fragile]{Título}`
- tcolorbox con borde izquierdo AzulDigital
- lstlisting en Space Mono
- Etiqueta del lenguaje en Magenta arriba a la derecha

### 7. RESULTADOS
- 3 indicadores en `minipage` o `columns`: número grande en AzulITM + etiqueta GrisMedio
- Tabla `tabular` (no longtable) con encabezado AzulITM

### 8. CIERRE — `\begin{frame}[plain]`
- Fondo AzulITM completo
- Logo `\LogoCoriotTikZ{AzulDigital}{white}`
- "¡Gracias!" en blanco MuseoModerno\Huge
- Slogan en AzulDigital
- Contacto en blanco Inter\small
- Franja inferior AzulDigital

---

## Zona de configuración

```latex
\newcommand{\PresTitle}{[Título de la presentación]}
\newcommand{\PresSubtitle}{[Subtítulo]}
\newcommand{\PresAutor}{[Nombre del autor]}
\newcommand{\PresCargo}{[Cargo]}
\newcommand{\PresProyecto}{[Nombre del proyecto]}
\newcommand{\PresFecha}{[DD de mes de YYYY]}
\newcommand{\PresInstitucion}{CORIOTLAB --- ITM}
```

---

## Formato de solicitud del usuario

```
TÍTULO: [título de la presentación]
SUBTÍTULO: [descripción]
AUTOR: [nombre]
CARGO: [cargo]
PROYECTO: [nombre del proyecto]
FECHA: [fecha]

DIAPOSITIVAS:
1. PORTADA (automática con los datos de arriba)
2. AGENDA: [listar los temas]
3. SECCIÓN 01: [título de sección]
4. CONTENIDO: [título] | [puntos del contenido]
5. CÓDIGO: [título] | [lenguaje] | [código a mostrar]
6. RESULTADOS: [indicador1: valor] | [indicador2: valor] | [indicador3: valor]
7. CIERRE (automático)

NOTAS ADICIONALES: [cualquier personalización]
```

---

## Compilación

Guardar en `C:\CORIOTLAB\INFORMES\informes\presentaciones\presentacion.tex` y ejecutar:

```powershell
cd C:\CORIOTLAB\INFORMES\informes\presentaciones
xelatex -interaction=nonstopmode presentacion.tex
xelatex -interaction=nonstopmode presentacion.tex
copy presentacion.pdf ..\..\output\presentaciones\
```
