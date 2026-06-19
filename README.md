# CORIOTLAB — Sistema de Plantillas de Documentos

![XeLaTeX](https://img.shields.io/badge/XeLaTeX-requerido-2C6EAA?logo=latex&logoColor=white)
![MiKTeX](https://img.shields.io/badge/MiKTeX-26.5-0078D4?logo=windows&logoColor=white)
![Google Fonts](https://img.shields.io/badge/Fuentes-Google%20Fonts-EA4335?logo=google-fonts&logoColor=white)
![Versión](https://img.shields.io/badge/versión-1.0.0-102D69)
![Licencia](https://img.shields.io/badge/licencia-privada%20CORIOTLAB-C14894)

> **Sistema oficial de plantillas XeLaTeX con identidad visual completa del Laboratorio CORIOTLAB — ITM.**  
> Genera documentos PDF institucionales listos para entregar: informes internos, informes técnicos de consultoría y presentaciones académicas.

---

## Tabla de contenido

1. [¿Qué es esto?](#qué-es-esto)
2. [Qué incluye el repositorio](#qué-incluye-el-repositorio)
3. [Documentos disponibles](#documentos-disponibles)
4. [Requisitos del sistema](#requisitos-del-sistema)
5. [Instalación paso a paso](#instalación-paso-a-paso)
6. [Cómo crear un nuevo documento](#cómo-crear-un-nuevo-documento)
7. [Referencia de compilación](#referencia-de-compilación)
8. [Paleta de colores y tipografías](#paleta-de-colores-y-tipografías)
9. [Fixes y troubleshooting](#fixes-y-troubleshooting)
10. [Generación con IA (prompts/)](#generación-con-ia)
11. [Historial de versiones](#historial-de-versiones)
12. [Créditos](#créditos)

---

## ¿Qué es esto?

**CORIOTLAB** (Control, Robótica e Internet de las Cosas) es el laboratorio de investigación y desarrollo tecnológico del Instituto Tecnológico Metropolitano (ITM), Medellín, Colombia. Opera en las áreas de electrónica, automatización, inteligencia artificial y sistemas embebidos.

**El problema que resuelve este sistema:** Crear un documento oficial desde cero en LaTeX requiere horas de configuración de estilos, colores, fuentes y estructura. Este repositorio elimina ese trabajo: cada plantilla ya tiene el membrete institucional, la paleta de colores oficial, las tipografías aprobadas por el Brand Book y la estructura de secciones correcta. Solo hay que editar una zona de configuración de pocas líneas y compilar.

**Para quién es:**
- Investigadores y docentes de CORIOTLAB que generan informes periódicos
- Consultores que entregan documentos técnicos externos a clientes o entidades
- Presentadores en eventos académicos, congresos o reuniones institucionales

---

## Qué incluye el repositorio

```
coriotlab-plantillas-informes/
│
├── README.md                        ← Este archivo
├── CLAUDE.md                        ← Memoria técnica permanente del sistema
├── CHANGELOG.md                     ← Historial de cambios por versión
├── .gitignore                       ← Excluye auxiliares LaTeX y PDFs generados
│
├── compile.ps1                      ← Compilador principal (Windows/PowerShell)
├── compile.sh                       ← Compilador alternativo (Mac/Linux/bash)
├── setup_coriotlab.ps1              ← Instalador de fuentes (Windows)
├── setup_coriotlab.sh               ← Instalador de fuentes (Mac/Linux)
│
├── membretes/                       ← Imágenes PNG de fondo institucional
│   ├── membrete_azul.png            ← Color AzulITM #102D69 — uso general
│   ├── membrete_celeste.png         ← Color AzulDigital #56ACDE — área IoT
│   ├── membrete_gris.png            ← Color GrisPizarra #2F2F2F — documentos neutros
│   └── membrete_magenta.png         ← Color Magenta #C14894 — área Robótica
│
├── fonts/                           ← (NO en git) Fuentes TTF — instalar con setup_coriotlab.ps1
│   ├── Inter/static/
│   ├── MuseoModerno/static/
│   └── SpaceMono/
│
├── plantilla_base/
│   ├── coriotlab_colors.tex         ← Fuente única de verdad: paleta de colores oficial
│   └── coriotlab_base.tex           ← Plantilla maestra de referencia (no compilar directamente)
│
├── informes/
│   ├── actividades/
│   │   └── informe_actividades.tex  ← Informe interno (variantes periódico y guía)
│   ├── tecnicos/
│   │   └── informe_tecnico.tex      ← Informe externo nivel consultoría profesional
│   └── presentaciones/
│       └── presentacion.tex         ← Presentación Beamer con diseño propio
│
├── output/                          ← PDFs generados (no versionados, en .gitignore)
│   ├── actividades/
│   ├── tecnicos/
│   └── presentaciones/
│
└── prompts/                         ← Prompts para generar documentos con IA
    ├── 01_generar_informe_actividades.md
    ├── 02_generar_informe_tecnico.md
    └── 03_generar_presentacion.md
```

### Descripción de componentes clave

| Componente | Para qué sirve | Cuándo usarlo |
|---|---|---|
| `compile.ps1` | Compila uno o todos los documentos con doble pasada XeLaTeX y mueve el PDF a `output/` | En producción, en Windows |
| `setup_coriotlab.ps1` | Descarga e instala las fuentes TTF en `%LOCALAPPDATA%\Microsoft\Windows\Fonts\` | Solo la primera vez, o si cambia el sistema |
| `coriotlab_colors.tex` | Define los 7 colores oficiales con `\definecolor` | Es incluido automáticamente por cada plantilla |
| `coriotlab_base.tex` | Plantilla maestra con todos los bloques, para referencia | Consultar al desarrollar nuevas plantillas |
| `membretes/*.png` | Fondo institucional: logo en esquina + watermark tenue + pie de página con barra de color | Se carga automáticamente desde cada .tex |
| `prompts/*.md` | Instrucciones listas para pedirle a Claude u otra IA que genere el contenido | Cuando se quiere acelerar la redacción |

---

## Documentos disponibles

### 1. Informe de Actividades

| Campo | Valor |
|---|---|
| **Archivo** | `informes/actividades/informe_actividades.tex` |
| **Tipo** | Documento interno, uso periódico |
| **Membrete** | `membrete_azul.png` — AzulITM `#102D69` |
| **Audiencia** | Coordinador del lab, dirección interna |
| **Páginas típicas** | 2–4 páginas |

**Contiene dos variantes en un mismo archivo** — activar una, comentar la otra:

**Variante A — Periódico** (activa por defecto): Para reportes semanales, quincenales o mensuales de actividades del equipo. Incluye tabla de actividades con estados (`Completado / En curso / Pendiente / Bloqueado`), observaciones y próximos pasos.

**Variante B — Guía/Tutorial**: Para documentar procedimientos técnicos paso a paso. Incluye objetivo, requisitos, bloques de código con sintaxis resaltada, cajas de nota y alerta, y conclusión.

**Secciones fijas:**
- Portada con barra AzulITM, número de informe y tabla de metadatos
- Encabezado/pie de página con nombre del proyecto y número de página
- Tabla de firma al final

**Macros de estado disponibles:**
```latex
\EstadoCompletado   % Verde oscuro
\EstadoEnCurso      % Azul digital
\EstadoPendiente    % Naranja
\EstadoBloqueado    % Rojo
```

---

### 2. Informe Técnico

| Campo | Valor |
|---|---|
| **Archivo** | `informes/tecnicos/informe_tecnico.tex` |
| **Tipo** | Documento externo, nivel consultoría profesional |
| **Membrete** | `membrete_azul.png` — AzulITM `#102D69` + acento AzulDigital |
| **Audiencia** | Clientes, entidades financiadoras, revisores externos |
| **Páginas típicas** | 5–20 páginas |

**Secciones fijas (siempre presentes):**
- Portada completa: título, subtítulo, tabla de 8 campos de metadatos, resumen ejecutivo
- Control de versiones
- Tabla de contenido automática
- Introducción
- Objetivos (general + específicos)
- Conclusiones
- Tabla de firmas (elaborado por / revisado y aprobado por)

**Bloques opcionales** — descomentar según el tipo de proyecto:

| Bloque | Sección | Cuándo activarlo |
|---|---|---|
| `OPT-A` | Marco Teórico | Cuando hay fundamentos conceptuales que justificar |
| `OPT-B` | Metodología | Estudios, análisis de datos, experimentos |
| `OPT-C` | Desarrollo Técnico + Código | Implementaciones en Python o C++ |
| `OPT-D` | Resultados con indicadores | Proyectos con metas medibles |
| `OPT-E` | Recomendaciones | Consultoría, auditorías técnicas |
| `OPT-F` | Referencias bibliográficas | Documentos académicos o con citas |
| `OPT-G` | Anexos | Material complementario extenso |

---

### 3. Presentación Beamer

| Campo | Valor |
|---|---|
| **Archivo** | `informes/presentaciones/presentacion.tex` |
| **Tipo** | Presentación académica/profesional |
| **Diseño** | Completamente propio con TikZ — sin membretes PNG |
| **Audiencia** | Eventos académicos, reuniones de proyecto, congresos |
| **Diapositivas típicas** | 8–20 slides, aspecto 16:9 |

**8 tipos de diapositiva incluidos:**

| N° | Tipo | Descripción |
|---|---|---|
| 1 | **Portada** | Fondo AzulITM completo, logo, título, subtítulo, autor, entidad |
| 2 | **Agenda** | Lista numerada de secciones con barra decorativa AzulDigital |
| 3 | **Separador de sección** | Fondo AzulITM, `<` gigante en marca de agua, número de sección |
| 4 | **Contenido estándar** | Bullet list con símbolo `>`, caja de nota integrada |
| 5 | **Dos columnas** | Texto a la izquierda, placeholder de imagen/figura a la derecha |
| 6 | **Código** | Bloque de código Python/C++ con resaltado de sintaxis |
| 7 | **Resultados** | Tres cajas de indicadores + tabla de resultados con filas alternas |
| 8 | **Cierre** | Fondo AzulITM, logo, "¡Gracias!", slogan y datos de contacto |

---

## Requisitos del sistema

### Obligatorios

| Herramienta | Versión mínima | Propósito | Descarga |
|---|---|---|---|
| **MiKTeX** | 26+ | Distribución TeX que incluye XeLaTeX | [miktex.org/download](https://miktex.org/download) |
| **XeLaTeX** | incluido en MiKTeX | Compilador — ÚNICO compatible con fontspec para TTF | incluido en MiKTeX |
| **Inter** | cualquier static | Fuente cuerpo de texto | [Google Fonts](https://fonts.google.com/specimen/Inter) |
| **MuseoModerno** | cualquier static | Fuente títulos y encabezados | [Google Fonts](https://fonts.google.com/specimen/Museo+Moderno) |
| **Space Mono** | cualquier static | Fuente código y términos técnicos | [Google Fonts](https://fonts.google.com/specimen/Space+Mono) |

### Opcionales pero recomendados

| Herramienta | Propósito |
|---|---|
| **PowerShell 5.1+** | Ejecutar `compile.ps1` y `setup_coriotlab.ps1` |
| **Sumatra PDF** | Visor PDF liviano que no bloquea el archivo durante la compilación |
| **Visual Studio Code** + extensión LaTeX Workshop | Editor con resaltado de sintaxis y compilación integrada |
| **Git** | Control de versiones del proyecto |

> **Importante:** `pdfLaTeX` y `LuaLaTeX` NO son compatibles. Solo XeLaTeX puede cargar las fuentes TTF del sistema mediante `fontspec`.

---

## Instalación paso a paso

### Paso 1 — Clonar el repositorio

```powershell
git clone https://github.com/santiagocano298366/coriotlab-plantillas-informes.git
cd coriotlab-plantillas-informes
```

O descargar el ZIP desde GitHub y descomprimir en `C:\CORIOTLAB\INFORMES\`.

### Paso 2 — Instalar MiKTeX

1. Descargar el instalador desde [miktex.org/download](https://miktex.org/download)
2. Ejecutar como administrador
3. En la opción **"Install missing packages on-the-fly"** → seleccionar **Yes**
4. Completar la instalación (puede tomar 10–15 minutos)
5. Verificar: abrir PowerShell y ejecutar `xelatex --version`

### Paso 3 — Instalar las fuentes

```powershell
# Desde la carpeta del repositorio:
.\setup_coriotlab.ps1
```

El script descarga los TTF de Google Fonts y los instala en `%LOCALAPPDATA%\Microsoft\Windows\Fonts\` con las entradas de registro necesarias para que XeLaTeX los encuentre por nombre.

**Instalación manual (si el script falla):**

1. Descargar los ZIP desde Google Fonts:
   - [Inter](https://fonts.google.com/specimen/Inter) → descargar → extraer carpeta `static/`
   - [Museo Moderno](https://fonts.google.com/specimen/Museo+Moderno) → descargar → extraer
   - [Space Mono](https://fonts.google.com/specimen/Space+Mono) → descargar → extraer
2. Seleccionar todos los archivos `.ttf`
3. Clic derecho → **Instalar para todos los usuarios** (o solo para el usuario actual)

### Paso 4 — Verificar la instalación de fuentes

Abrir PowerShell y ejecutar:

```powershell
[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null
$fonts = (New-Object System.Drawing.Text.InstalledFontCollection).Families
$fonts | Where-Object { $_.Name -match "Inter|MuseoModerno|Space Mono" }
```

Deben aparecer las tres fuentes. Si falta alguna, volver al Paso 3.

### Paso 5 — Primera compilación de prueba

```powershell
cd informes\actividades
xelatex -interaction=nonstopmode informe_actividades.tex
xelatex -interaction=nonstopmode informe_actividades.tex
```

Si no hay errores fatales (solo advertencias de MiKTeX sobre updates, que son normales), se habrá generado `informe_actividades.pdf` en la misma carpeta.

---

## Cómo crear un nuevo documento

### Regla fundamental

> **Nunca editar los `.tex` dentro de `informes/` para trabajo real.**  
> Esas son las plantillas originales del sistema. Editarlas contamina la base.

### Flujo completo paso a paso

**1. Copiar la carpeta _TEMPLATE**

```powershell
Copy-Item -Recurse "C:\CORIOTLAB\PROYECTOS\_TEMPLATE" "C:\CORIOTLAB\PROYECTOS\NOMBRE_PROYECTO"
```

**2. Copiar la plantilla correspondiente**

```powershell
# Para informe de actividades:
Copy-Item "C:\CORIOTLAB\INFORMES\informes\actividades\informe_actividades.tex" `
          "C:\CORIOTLAB\PROYECTOS\NOMBRE_PROYECTO\informes\actividades\"

# Para informe técnico:
Copy-Item "C:\CORIOTLAB\INFORMES\informes\tecnicos\informe_tecnico.tex" `
          "C:\CORIOTLAB\PROYECTOS\NOMBRE_PROYECTO\informes\tecnicos\"

# Para presentación:
Copy-Item "C:\CORIOTLAB\INFORMES\informes\presentaciones\presentacion.tex" `
          "C:\CORIOTLAB\PROYECTOS\NOMBRE_PROYECTO\presentaciones\"
```

**3. Ajustar la ruta del membrete**

En el `.tex` copiado, buscar la línea que contiene `membrete_azul.png` y actualizar la ruta relativa:

```latex
% Si el .tex está en PROYECTOS/NOMBRE_PROYECTO/informes/actividades/:
{../../../../INFORMES/membretes/membrete_azul.png}

% Alternativa más robusta — usar ruta absoluta:
{C:/CORIOTLAB/INFORMES/membretes/membrete_azul.png}
```

**4. Editar la Zona de Configuración**

Al inicio de cada `.tex` hay una zona delimitada:

```latex
%% ═══════════════════════════════════════════════════════════════════
%% ZONA DE CONFIGURACIÓN — editar aquí antes de compilar
%% ═══════════════════════════════════════════════════════════════════
\newcommand{\DocTitulo}{Título de tu documento}
\newcommand{\DocNumero}{IA-2025-001}
\newcommand{\DocAutor}{Tu Nombre}
\newcommand{\DocCargo}{Tu cargo --- CORIOTLAB}
\newcommand{\DocProyecto}{Nombre del proyecto}
\newcommand{\DocPeriodo}{Semana del 16 al 20 de junio de 2025}
\newcommand{\DocFecha}{\today}
\newcommand{\DocVersion}{1.0}
%% ═══════════════════════════════════════════════════════════════════
```

**Solo modificar esta sección.** El resto del documento se actualiza automáticamente.

**5. Activar o desactivar bloques opcionales**

En el informe técnico, los bloques `OPT-A` a `OPT-G` están comentados por defecto. Para activar uno, buscar el bloque y quitar los `%`:

```latex
%% ── BLOQUE OPT-D: Resultados ─────────────────────────────────────
%\section{Resultados}
%\begin{longtable}{...}
```

→ quitar `%` de cada línea del bloque para activarlo.

**6. Compilar**

```powershell
cd "C:\CORIOTLAB\PROYECTOS\NOMBRE_PROYECTO\informes\actividades"
xelatex -interaction=nonstopmode informe_actividades.tex
xelatex -interaction=nonstopmode informe_actividades.tex
```

> La doble pasada es obligatoria: la primera genera el índice de secciones (`.toc`), la segunda lo incorpora correctamente en el PDF.

**7. Ubicar el PDF**

El PDF queda en la misma carpeta que el `.tex`. Copiarlo al destino final o a `output/[tipo]/`.

---

## Referencia de compilación

### Usando compile.ps1 (recomendado)

```powershell
# Desde C:\CORIOTLAB\INFORMES\

# Compilar solo el informe de actividades:
.\compile.ps1 actividades

# Compilar solo el informe técnico:
.\compile.ps1 tecnicos

# Compilar solo la presentación:
.\compile.ps1 presentaciones

# Compilar los tres documentos en secuencia:
.\compile.ps1 todos
```

El script hace automáticamente:
1. Doble pasada XeLaTeX con `-interaction=nonstopmode`
2. Copia el PDF generado a `output/[tipo]/`
3. Elimina todos los archivos auxiliares (`.aux`, `.log`, `.toc`, `.nav`, `.snm`, etc.)
4. Reporta el tamaño del PDF en KB

### Compilación manual (desde la carpeta del .tex)

```powershell
xelatex -interaction=nonstopmode informe_actividades.tex
xelatex -interaction=nonstopmode informe_actividades.tex
```

### Advertencias no fatales (ignorar)

| Mensaje | Causa | Acción |
|---|---|---|
| `"So far, you have not checked for updates as a MiKTeX user"` | MiKTeX retorna exit code 1 aunque el PDF sea correcto | Ignorar — el PDF se genera bien |
| `"Rerun to get cross-references right"` | Solo se hizo una pasada | Compilar una segunda vez |
| `"Misplaced \noalign"` | Uso de `\rowcolor` en encabezados de tabla | Ignorar — no afecta el resultado |

---

## Paleta de colores y tipografías

### Colores oficiales

| Nombre en LaTeX | HEX | CMYK (aprox.) | Uso principal |
|---|---|---|---|
| `AzulITM` | `#102D69` | C:85 M:58 Y:0 K:59 | Color institucional principal. Encabezados, portadas, barras decorativas. |
| `Magenta` | `#C14894` | C:0 M:63 Y:24 K:24 | Área de Robótica. Alertas, acentos de atención. |
| `AzulDigital` | `#56ACDE` | C:61 M:24 Y:0 K:13 | Área de IoT. Links, cajas informativas, acentos secundarios. |
| `GrisPizarra` | `#2F2F2F` | C:0 M:0 Y:0 K:82 | Texto principal de cuerpo. |
| `GrisClaro` | `#F2F2F2` | C:0 M:0 Y:0 K:5 | Filas alternas en tablas. |
| `GrisMedio` | `#AAAAAA` | C:0 M:0 Y:0 K:33 | Metadatos, pies de página, texto secundario. |
| `GrisLinea` | `#DDDDDD` | C:0 M:0 Y:0 K:13 | Bordes de tabla, líneas separadoras. |

### Tipografías

| Fuente | Nombre en LaTeX | Uso | Descarga |
|---|---|---|---|
| **MuseoModerno** | `\FuenteTitulo` | Títulos de sección, portadas, encabezados, logo CORIOTLAB | [Google Fonts](https://fonts.google.com/specimen/Museo+Moderno) |
| **Space Mono** | `\FuenteCodigo` | Bloques de código, términos técnicos, números de versión | [Google Fonts](https://fonts.google.com/specimen/Space+Mono) |
| **Inter** | `\setmainfont` (cuerpo) | Todo el texto corrido del documento | [Google Fonts](https://fonts.google.com/specimen/Inter) |

### Elementos gráficos de marca

- **`<` y `>`** → Bullets, íconos de sección, separadores. Representan el código fuente y el control de flujo.
- **Cuadrados/píxeles** → Conectan con el isotipo CORIOT. Aparecen como elementos decorativos en el logo.
- **Líneas diagonales** → Dinamismo y flujo de datos. En los membretes y portadas.

---

## Fixes y troubleshooting

### Fix 1 — "Font not found" o "cannot be found"

**Síntoma:** La compilación falla con error `Font Inter/MuseoModerno/Space Mono cannot be found`.

**Causa:** Las fuentes no están instaladas en el sistema, o el código intenta cargarlas con rutas relativas (`Path=../../fonts/...`) en lugar de por nombre de familia Windows.

**Solución:**
1. Ejecutar `.\setup_coriotlab.ps1` para instalar las fuentes en `%LOCALAPPDATA%\Microsoft\Windows\Fonts\`
2. Verificar que el `.tex` carga las fuentes así (sin `Path=`):
```latex
\setmainfont{Inter}
\newfontfamily\FuenteTitulo{MuseoModerno}
\newfontfamily\FuenteCodigo{Space Mono}
```

---

### Fix 2 — "Argument has an extra }" en itemize

**Síntoma:** Error en una lista `\begin{itemize}[label={\color{AzulITM}>}]`.

**Causa:** El paquete `babel` con idioma español activa el carácter `>` como shorthand tipográfico (`»`). Esto hace que `>` deje de ser un símbolo literal dentro de entornos LaTeX.

**Solución:** Asegurarse de que babel se carga con la opción `es-noshorthands`:
```latex
\usepackage[spanish, es-nodecimaldot, es-noshorthands]{babel}
```

---

### Fix 3 — "Paragraph ended before \lst@next" en Beamer

**Síntoma:** Error al compilar una presentación que contiene código con `lstlisting` dentro de un frame.

**Causa:** Los entornos verbatim en Beamer requieren que el frame sea declarado como `[fragile]`.

**Solución:**
```latex
% Incorrecto:
\begin{frame}{Frame con código}

% Correcto:
\begin{frame}[fragile]{Frame con código}
  \begin{lstlisting}[language=Python]
  ...
  \end{lstlisting}
\end{frame}
```

---

### Fix 4 — "Missing number, treated as zero" en Beamer

**Síntoma:** Error fatal en `\end{frame}` al usar `\begin{enumerate}[label=...]` dentro de una presentación.

**Causa:** El paquete `enumitem` tiene incompatibilidad conocida con Beamer. Al usar `[label=...]` dentro de un frame produce un error de parsing interno.

**Solución:** No cargar `enumitem` en presentaciones Beamer. Usar los templates nativos:
```latex
% En el preámbulo (reemplaza enumitem):
\setbeamertemplate{itemize item}   {\color{AzulITM}\textbf{>}}
\setbeamertemplate{enumerate item} {\color{AzulITM}\textbf{\insertenumlabel.}}

% Y usar listas sin opciones de label:
\begin{itemize}
  \item Elemento
\end{itemize}
```

---

### Fix 5 — "Missing number" con \fontsize grande en nodos TikZ (Beamer)

**Síntoma:** Error al intentar renderizar texto decorativo grande (>72pt) dentro de un nodo TikZ en un frame.

**Causa:** `\fontsize{200}{200}\selectfont` con tamaños muy grandes dentro de nodos TikZ puede fallar en MiKTeX.

**Solución:** Usar `\scalebox` en lugar de `\fontsize`:
```latex
% Incorrecto:
\node {\fontsize{200}{200}\selectfont\color{white}<};

% Correcto:
\node {\scalebox{16}{\color{white}\FuenteTitulo<}};
```

---

## Generación con IA

La carpeta `prompts/` contiene tres archivos Markdown con instrucciones detalladas para pedirle a Claude (u otra IA) que genere el contenido completo de un documento.

### Cómo usar los prompts

1. Abrir el archivo correspondiente en `prompts/`:
   - `01_generar_informe_actividades.md` — para informes de actividades
   - `02_generar_informe_tecnico.md` — para informes técnicos de consultoría
   - `03_generar_presentacion.md` — para presentaciones Beamer

2. Copiar el contenido completo del archivo.

3. Pegarlo en Claude (claude.ai o Claude Code) y responder las preguntas de contexto que aparecen al final del prompt (nombre del proyecto, período, actividades realizadas, etc.).

4. La IA devuelve el bloque LaTeX listo para reemplazar el contenido de la Zona de Configuración y las secciones del documento.

5. Compilar normalmente con `xelatex`.

### Qué genera cada prompt

| Prompt | Genera | Requiere |
|---|---|---|
| `01_generar_informe_actividades.md` | Lista de actividades con estados, observaciones y próximos pasos | Descripción del período y las tareas realizadas |
| `02_generar_informe_tecnico.md` | Introducción, objetivos, conclusiones y secciones OPT activas | Descripción del proyecto y sus resultados |
| `03_generar_presentacion.md` | Contenido de cada diapositiva (textos, bullet points, datos) | Tema, audiencia y puntos clave a comunicar |

---

## Historial de versiones

Ver [`CHANGELOG.md`](CHANGELOG.md) para el detalle de cada versión.

| Versión | Fecha | Cambio principal |
|---|---|---|
| 1.0.0 | Junio 2025 | Sistema inicial: 3 plantillas con identidad CORIOTLAB completa |

---

## Créditos

**Diseño de marca CORIOTLAB — Brand Book**  
Ronald De Los Ríos Q. — Comunicador Gráfico  
`ron.delosrios@gmail.com`

**Sistema de plantillas LaTeX v1.0**  
Santiago Cano — Investigador CORIOTLAB  
`santiagocano298366@correo.itm.edu.com`

**Laboratorio CORIOTLAB**  
Control, Robótica e Internet de las Cosas  
Instituto Tecnológico Metropolitano — ITM  
Medellín, Colombia  
2025–2026

---

*Este repositorio es de uso interno del Laboratorio CORIOTLAB. No redistribuir sin autorización.*
