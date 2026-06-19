# CORIOTLAB — Sistema de Plantillas de Documentos

## Contexto del proyecto

**CORIOTLAB** es el Laboratorio de Control, Robótica e Internet de las Cosas del Instituto Tecnológico Metropolitano (ITM), Medellín, Colombia. Desarrolla actividades de investigación, docencia y desarrollo tecnológico en electrónica, automatización, IA y comunicación de sistemas.

**Propósito de este repositorio:** Sistema de plantillas LaTeX para generar documentos PDF institucionales con identidad de marca CORIOTLAB (informes internos, informes técnicos externos, presentaciones).

**Responsable:** lscritm4@gmail.com

---

## Ruta del proyecto

```
C:\CORIOTLAB\INFORMES\
```

---

## Estructura de carpetas

```
C:\CORIOTLAB\
├── INFORMES\                        ← sistema de plantillas (NO editar para trabajo real)
│   ├── CLAUDE.md                    ← este archivo (memoria permanente)
│   ├── CHANGELOG.md
│   ├── .gitignore
│   ├── compile.ps1                  ← compilador Windows (PowerShell)
│   ├── setup_coriotlab.ps1          ← instalador de fuentes Windows
│   │
│   ├── membretes\                   ← PNG de membretes por color
│   │   ├── membrete_azul.png        → AzulITM #102D69
│   │   ├── membrete_celeste.png     → AzulDigital #56ACDE
│   │   ├── membrete_gris.png        → GrisPizarra #2F2F2F
│   │   └── membrete_magenta.png     → Magenta #C14894
│   │
│   ├── fonts\                       ← TTF fuentes (instaladas en Windows user fonts)
│   │   ├── Inter\static\
│   │   ├── MuseoModerno\static\
│   │   └── SpaceMono\
│   │
│   ├── plantilla_base\
│   │   ├── coriotlab_colors.tex     ← definiciones de color compartidas
│   │   └── coriotlab_base.tex       ← plantilla maestra de referencia (no compilar)
│   │
│   ├── informes\
│   │   ├── actividades\
│   │   │   └── informe_actividades.tex  ← interno (variantes: periódico / guía)
│   │   ├── tecnicos\
│   │   │   └── informe_tecnico.tex      ← externo, nivel consultoría
│   │   └── presentaciones\
│   │       └── presentacion.tex         ← Beamer, 8 diapositivas tipo
│   │
│   ├── output\                      ← PDFs compilados (en .gitignore)
│   │   ├── actividades\
│   │   ├── tecnicos\
│   │   └── presentaciones\
│   │
│   └── prompts\                     ← prompts para generación con IA
│       ├── 01_generar_informe_actividades.md
│       ├── 02_generar_informe_tecnico.md
│       └── 03_generar_presentacion.md
│
└── PROYECTOS\                       ← trabajo real con las plantillas
    └── _TEMPLATE\                   ← carpeta modelo para nuevo proyecto
        ├── informes\
        │   ├── actividades\
        │   └── tecnicos\
        ├── presentaciones\
        └── README_proyecto.md
```

---

## Fixes críticos — SIEMPRE aplicar

### Fix 1 — Fuentes por nombre (NO por Path)

**Problema:** `fontspec` con XeTeX en MiKTeX 26.5 Windows NO resuelve rutas relativas ni absolutas para TTF. El `Path=../../...` siempre falla con "font cannot be found".

**Solución:** Las fuentes DEBEN estar instaladas en `%LOCALAPPDATA%\Microsoft\Windows\Fonts\` y cargarse por nombre de familia Windows.

```latex
% CORRECTO — siempre así:
\setmainfont{Inter}
\newfontfamily\FuenteTitulo{MuseoModerno}
\newfontfamily\FuenteCodigo{Space Mono}

% INCORRECTO — nunca así:
\setmainfont{Inter}[Path=../../fonts/Inter/static/, Extension=.ttf, ...]
```

**Nombres exactos en Windows:**
- `Inter` → nombre de familia = `Inter`
- `MuseoModerno` → nombre de familia = `MuseoModerno` (sin espacio)
- `Space Mono` → nombre de familia = `Space Mono` (con espacio)

**Script de instalación ya aplicado:** `setup_coriotlab.ps1` instala los TTF en `%LOCALAPPDATA%\Microsoft\Windows\Fonts\` con entradas de registro en `HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts`.

### Fix 2 — Babel español con es-noshorthands

**Problema:** Con `\usepackage[spanish, es-nodecimaldot]{babel}`, el carácter `>` se vuelve shorthand activo (para `»`). Los labels de `\itemize` usan `>` como viñeta, causando "Argument has an extra }".

**Solución:**
```latex
% CORRECTO — siempre así:
\usepackage[spanish, es-nodecimaldot, es-noshorthands]{babel}
```

**Afecta a:** Cualquier .tex con `\begin{itemize}[label={\color{...}>}...]`.

### Fix 3 — Beamer: frames con lstlisting requieren [fragile]

En Beamer, cualquier frame que contenga contenido verbatim (`lstlisting`, `verbatim`) DEBE marcarse como `[fragile]`, o dará "Paragraph ended before \lst@next was complete":

```latex
\begin{frame}[fragile]{Título del frame con código}
  \begin{lstlisting}[language=Python]
  ...
  \end{lstlisting}
\end{frame}
```

### Fix 4 — Beamer: NO usar el paquete enumitem

El paquete `enumitem` tiene incompatibilidad conocida con Beamer. Al usar `[label=...]` en un `enumerate` dentro de un frame produce error fatal "Missing number, treated as zero" en `\end{frame}`.

**Solución:** En presentaciones Beamer usar únicamente los templates nativos:
```latex
\setbeamertemplate{itemize item}   {\color{AzulITM}\textbf{>}}
\setbeamertemplate{enumerate item} {\color{AzulITM}\textbf{\insertenumlabel.}}
% Y usar \begin{itemize} / \begin{enumerate} sin opciones [label=...]
```

### Fix 5 — Beamer: \fontsize grande en nodos TikZ

`\fontsize{200}{200}\selectfont` dentro de un nodo TikZ en Beamer puede causar "Missing number". Usar `\scalebox` en su lugar:
```latex
\node[opacity=0.15] at (current page.center)
  {\scalebox{16}{\color{white}\FuenteTitulo<}};
```

---

## Compilación

- **Compilador: XeLaTeX OBLIGATORIO.** Nunca pdfLaTeX ni LuaLaTeX (no soportan fontspec para TTF del sistema).
- **Doble pasada siempre** para que el TOC, las referencias cruzadas y `lastpage` sean correctos.
- **MiKTeX 26.5** instalado en el sistema.

### Comando directo

```powershell
# Desde la carpeta del .tex:
cd C:\CORIOTLAB\INFORMES\informes\actividades
xelatex -interaction=nonstopmode informe_actividades.tex
xelatex -interaction=nonstopmode informe_actividades.tex
```

### Script de compilación

```powershell
# Desde C:\CORIOTLAB\INFORMES\:
.\compile.ps1 actividades       # solo informe de actividades
.\compile.ps1 tecnicos          # solo informe técnico
.\compile.ps1 presentaciones    # solo presentación
.\compile.ps1 todos             # los 3 documentos
```

**Nota sobre compile.ps1:** Si falla con error de parsing/codificación, compilar directamente con `xelatex` desde PowerShell (el PS1 puede tener problemas con caracteres especiales en UTF-16 LE).

### Advertencias no fatales (no interrumpen la compilación)

- `"So far, you have not checked for updates as a MiKTeX user"` → MiKTeX retorna exit code 1 aunque el PDF sea correcto. Ignorar.
- `"Misplaced \noalign"` en tablas con `\rowcolor` en macros de encabezado → no fatal, el PDF se genera correctamente.
- `"Rerun to get cross-references right"` → indica que hace falta la segunda pasada.

---

## Documentos del sistema

### 1. Informe de Actividades (`informes/actividades/informe_actividades.tex`)
- **Tipo:** Documento interno, flexible
- **Color principal:** AzulITM `#102D69`
- **Membrete:** `membrete_azul.png` a 8% opacidad (todas las páginas)
- **Variantes** (en el mismo archivo — activar/comentar según necesidad):
  - **Variante A — Periódico:** Portada + tabla de actividades con estados (Completado/En curso/Pendiente/Bloqueado) + Observaciones + Próximos Pasos + Firma
  - **Variante B — Guía/Tutorial:** Portada + Objetivo + Requisitos + Pasos con código + cajas de nota/alerta + Conclusión + Firma

### 2. Informe Técnico (`informes/tecnicos/informe_tecnico.tex`)
- **Tipo:** Documento externo, nivel consultoría profesional
- **Color principal:** AzulITM `#102D69` + AzulDigital `#56ACDE` como acento
- **Membrete:** `membrete_azul.png` a 8% opacidad (todas las páginas)
- **Estructura fija:** Portada con metadatos + resumen ejecutivo + control de versiones + TOC + Introducción + Objetivos + Conclusiones + Tabla de firmas
- **Secciones opcionales** (comentadas, activar según proyecto):
  - OPT-A: Marco Teórico
  - OPT-B: Metodología
  - OPT-C: Desarrollo Técnico + Código (Python y C++)
  - OPT-D: Resultados con tabla de indicadores
  - OPT-E: Recomendaciones
  - OPT-F: Referencias bibliográficas
  - OPT-G: Anexos

### 3. Presentación Beamer (`informes/presentaciones/presentacion.tex`)
- **Tipo:** Presentación académica/profesional
- **Diseño:** Completamente propio basado en Brand Book. NO usa membretes PNG.
- **Tema:** `\usetheme{default}` con personalización total manual
- **Diapositivas incluidas:** Portada (fondo AzulITM) + Agenda + Separador de sección + Contenido estándar + Dos columnas + Código + Resultados + Cierre (fondo AzulITM)

---

## Brand Book — Reglas inamovibles

### Paleta de colores

```latex
\definecolor{AzulITM}     {HTML}{102D69}  % Control — color institucional
\definecolor{Magenta}     {HTML}{C14894}  % Robótica — señal visual del lab
\definecolor{AzulDigital} {HTML}{56ACDE}  % IoT — acento y links
\definecolor{GrisPizarra} {HTML}{2F2F2F}  % texto principal
\definecolor{GrisClaro}   {HTML}{F2F2F2}  % filas alternas de tablas
\definecolor{GrisMedio}   {HTML}{AAAAAA}  % metadatos, pies de página
\definecolor{GrisLinea}   {HTML}{DDDDDD}  % separadores, bordes de tabla
```

### Tipografías

| Fuente | Uso | Nombre Windows |
|---|---|---|
| **MuseoModerno** | Títulos, encabezados, secciones | `MuseoModerno` |
| **Space Mono** | Código, términos técnicos | `Space Mono` |
| **Inter** | Cuerpo de texto | `Inter` |

### Membretes

- 4 variantes: azul, celeste, gris, magenta
- Estructura: logo en esquina superior izquierda + watermark central tenue + pie de página con barra de color + logo blanco
- Uso: `\AddToShipoutPictureBG` con `eso-pic` + TikZ, opacidad 0.08
- Ruta: `../../membretes/membrete_[color].png` (relativa desde la carpeta del .tex)

### Presentaciones

- **Sin membretes PNG** — diseño propio con TikZ
- Logo en texto: `< CORIOTLAB` con FuenteTitulo + píxeles decorativos en AzulDigital y Magenta
- Portada y cierre: fondo AzulITM completo, franja inferior AzulDigital 8px
- Separadores de sección: fondo AzulITM + `<` gigante al 15% opacidad
- Bullets: `>` en AzulITM

### Elementos gráficos complementarios

- Líneas diagonales → dinamismo, flujo de datos
- Signos `<` y `>` → bullets, íconos, marcadores de código
- Cuadrados/píxeles → conectan con el isotipo CORIOT

---

## Convención de commits Git

```
feat:     nueva funcionalidad o documento
fix:      corrección de error de compilación o diseño
docs:     cambios en documentación (CLAUDE.md, README, prompts)
style:    cambios visuales/formato sin cambio funcional
refactor: reorganización de archivos sin cambio funcional
```

---

## Flujo de trabajo para nuevo documento

1. **NUNCA editar las plantillas en `INFORMES/` directamente** para trabajo real
2. Copiar la carpeta `C:\CORIOTLAB\PROYECTOS\_TEMPLATE\` y renombrarla con el nombre del proyecto
3. Copiar el `.tex` correspondiente desde `INFORMES/informes/[tipo]/` a la carpeta del proyecto
4. Editar **solo la Zona de Configuración** al inicio del .tex (campos delimitados con `%% ═══`)
5. Activar/desactivar variantes o secciones opcionales (comentar/descomentar bloques `%% ── BLOQUE OPT-X`)
6. Compilar con `xelatex` dos veces
7. PDF final: copiar manualmente a `output/[tipo]/` o usar `compile.ps1`

---

## Notas técnicas adicionales

- **compile.ps1** puede fallar con error de codificación si se abre/guarda en un editor que cambie el encoding a UTF-16 LE con caracteres tipográficos. Si falla, compilar directamente con `xelatex -interaction=nonstopmode archivo.tex`.
- **Remove-Item** puede estar bloqueado por hooks de seguridad de Claude Code. Para limpiar auxiliares usar: `Get-ChildItem -Path $dir -Filter "*.aux" | Remove-Item -Force` (con aprobación).
- **Archivos de prueba** `test_*.tex` en `informes/actividades/` son residuos de sesiones de debugging. Pueden eliminarse manualmente.
- **Presentación Beamer:** No usar `\fontsize{N}{N}\selectfont` con tamaños mayores a 72pt dentro de nodos TikZ en frames — puede causar "Missing number" en MiKTeX. Usar `\Huge`, `\LARGE` u otras fuentes predefinidas de Beamer.
