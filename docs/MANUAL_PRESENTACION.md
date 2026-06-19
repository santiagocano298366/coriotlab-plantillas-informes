# Manual — Presentación Beamer

**Plantilla:** `plantillas/presentaciones/plantilla_presentacion.tex`
**Versión:** 1.2 | **Actualizado:** 2025-06-19

---

## ¿Para qué sirve?

Presentación académica y profesional en formato 16:9 basada en LaTeX Beamer
con diseño propio CORIOTLAB. Produce PDF con slides listos para proyectar o
compartir digitalmente.

> **Nota:** A diferencia de los informes, la presentación **no usa membretes PNG**.
> El diseño visual se construye enteramente con TikZ.

---

## Diapositivas incluidas

| N° | Tipo | Descripción |
|---|---|---|
| 1 | Portada | Fondo AzulITM, logo, título, autor. Automática. |
| 2 | Agenda | Lista numerada con barra lateral AzulITM |
| 3 | Separador de sección | Fondo AzulITM con `<` gigante al 15% opacidad |
| 4 | Contenido estándar | Barra lateral + lista de ítems + cajaNota opcional |
| 5 | Dos columnas | Texto izquierda + imagen/diagrama derecha |
| 6 | Código | `lstlisting` con resaltado sintáctico (requiere `[fragile]`) |
| 7 | Resultados | Indicadores en cajas + tabla comparativa |
| 8 | Cierre | Fondo AzulITM, logo, ¡Gracias!, contacto. Automático. |

---

## Zona de Configuración — campos explicados

```latex
\newcommand{\PresTitle}{...}       % Título (máx. 60 chars — aparece en footline)
\newcommand{\PresSubtitle}{...}    % Subtítulo (aparece en portada)
\newcommand{\PresAutor}{...}       % Nombre completo del presentador
\newcommand{\PresCargo}{...}       % "Investigador --- CORIOTLAB"
\newcommand{\PresProyecto}{...}    % Nombre del proyecto
\newcommand{\PresFecha}{...}       % "30 de junio de 2025"
\newcommand{\PresInstitucion}{CORIOTLAB --- ITM}
```

---

## Guía diapositiva por diapositiva

### Diapositiva 2 — Agenda

Reemplazar los 5 ítems de ejemplo. NO agregar `[label=...]` al `enumerate`.

```latex
\begin{enumerate}
  \item Contexto del proyecto
  \item Arquitectura del sistema
  \item Implementación
  \item Resultados
  \item Conclusiones
\end{enumerate}
```

### Diapositiva 3 — Separador de sección

Duplicar este frame para cada sección nueva. Cambiar el número y el título:

```latex
\begin{frame}[plain]
  \begin{tikzpicture}[remember picture, overlay]
    \fill[AzulITM] (current page.south west) rectangle (current page.north east);
    \node[opacity=0.15, anchor=center] at (current page.center)
      {\scalebox{16}{\color{white}\FuenteTitulo<}};
    \node[anchor=south west] at ([xshift=2.2cm, yshift=1.2cm] current page.south west)
      {\FuenteTitulo\Huge\color{AzulDigital}\textbf{02}};
    \node[anchor=south west] at ([xshift=2.2cm, yshift=3.2cm] current page.south west)
      {\FuenteTitulo\Large\color{white}\textbf{Arquitectura del Sistema}};
  \end{tikzpicture}
\end{frame}
```

### Diapositiva 4 — Contenido estándar

Reemplazar el título del frame y el texto de los ítems.
El `cajaNota` al final es opcional — eliminar si no hace falta.

```latex
\begin{frame}{Nombre del frame}
  ...
  \begin{itemize}
    \item \textbf{Concepto clave:} desarrollo en 1-2 líneas.
    \item \textbf{Otro concepto:} desarrollo en 1-2 líneas.
  \end{itemize}
  \begin{tcolorbox}[cajaNota, top=3pt, bottom=3pt]
    Nota relevante que el audiencia debe recordar.
  \end{tcolorbox}
\end{frame}
```

### Diapositiva 5 — Dos columnas

Ajustar anchos de columna (`0.52` / `0.44`) según contenido.
Para insertar imagen real, reemplazar el `fcolorbox` por:
```latex
\includegraphics[width=\textwidth]{nombre-imagen.png}
```

### Diapositiva 6 — Código

**Obligatorio:** el frame DEBE declararse `[fragile]`.
Cambiar `language=Python` por el lenguaje del código a mostrar.

```latex
\begin{frame}[fragile]{Título del frame de código}
  \begin{tcolorbox}[cajaCode, top=2pt, bottom=2pt]
\begin{lstlisting}[language=Python]
def mi_funcion():
    return 42
\end{lstlisting}
  \end{tcolorbox}
  {\small\color{GrisMedio}\itshape
    Descripción del código.}
\end{frame}
```

> **Regla crítica:** El `\begin{lstlisting}` no puede estar indentado
> dentro de `\begin{frame}[fragile]`. Debe quedar en la columna 0.

### Diapositiva 7 — Resultados

Los 3 `cajaIndicador` muestran las métricas principales.
La tabla muestra el detalle comparativo contra metas.

```latex
\begin{tcolorbox}[cajaIndicador]
  {\FuenteTitulo\LARGE\color{AzulITM}\textbf{98.7\%}}\\[4pt]
  {\small\color{GrisMedio}Disponibilidad}
\end{tcolorbox}
```

---

## Reglas de Beamer en este sistema

| Regla | Razón |
|---|---|
| Frames con `lstlisting` → `[fragile]` | Verbatim dentro de frame requiere fragile |
| No usar `enumitem` | Incompatibilidad conocida con Beamer → error fatal |
| No usar `[label=...]` en listas | Usar templates nativos de Beamer (`\setbeamertemplate`) |
| No usar `\fontsize{200}{200}` en TikZ | Causa "Missing number" — usar `\scalebox{N}{...}` |

---

## Agregar más diapositivas

1. Copiar el bloque del frame del tipo deseado (agenda, contenido, código, etc.).
2. Pegar después del último frame, antes de `\end{document}`.
3. Modificar el contenido.

Para agregar separadores adicionales: copiar el frame de Separador y cambiar
el número y título.

---

## Footline

El pie de cada slide muestra automáticamente:
- Izquierda: `< CORIOTLAB` en AzulITM
- Centro: `\PresTitle`
- Derecha: `N / Total`

Los frames `[plain]` (portada y cierre) no muestran footline.

---

## Compilar

```powershell
cd C:\CORIOTLAB\INFORMES\plantillas\presentaciones
xelatex -interaction=nonstopmode plantilla_presentacion.tex
xelatex -interaction=nonstopmode plantilla_presentacion.tex
```
