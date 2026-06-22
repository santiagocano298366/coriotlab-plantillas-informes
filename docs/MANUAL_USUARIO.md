# Manual de Usuario — CORIOTLAB Sistema de Plantillas

**Versión:** 1.4 · **Laboratorio:** CORIOTLAB — ITM · **Contacto:** lscritm4@gmail.com

---

## Contenido

1. [¿Qué es este sistema?](#1-qué-es-este-sistema)
2. [Requisitos del sistema](#2-requisitos-del-sistema)
3. [Instalación inicial](#3-instalación-inicial)
4. [Estructura de archivos](#4-estructura-de-archivos)
5. [Informe de Actividades](#5-informe-de-actividades)
   - [5.1 Versión LaTeX / PDF](#51-versión-latex--pdf)
   - [5.2 Versión Word (.docx)](#52-versión-word-docx)
6. [Informe Técnico](#6-informe-técnico)
7. [Plantilla de Diapositivas (.pptx)](#7-plantilla-de-diapositivas-pptx)
8. [Compilación LaTeX](#8-compilación-latex)
9. [Identidad visual CORIOTLAB](#9-identidad-visual-coriotlab)
10. [Flujo de trabajo completo](#10-flujo-de-trabajo-completo)
11. [Solución de problemas](#11-solución-de-problemas)

---

## 1. ¿Qué es este sistema?

Este repositorio contiene las **plantillas oficiales de documentos** del Laboratorio CORIOTLAB (Control, Robótica e Internet de las Cosas) del Instituto Tecnológico Metropolitano — ITM, Medellín, Colombia.

Las plantillas garantizan que todos los documentos producidos por el laboratorio respeten la identidad visual institucional: tipografía, paleta de colores, membrete y estructura de secciones.

### Documentos disponibles

| Documento | Formato | Uso recomendado |
|---|---|---|
| **Informe de Actividades** | LaTeX/PDF + Word | Reportes internos periódicos (semanal, quincenal, mensual) |
| **Informe Técnico** | LaTeX/PDF | Documentos externos de consultoría o entrega formal |
| **Presentación** | PowerPoint (.pptx) | Diapositivas para exposiciones y reuniones |

> **Regla de oro:** nunca edite los archivos dentro de este repositorio para trabajo real. Copie la plantilla a su carpeta de proyecto y edítela allí.

---

## 2. Requisitos del sistema

### Para plantillas LaTeX (Informe de Actividades e Informe Técnico)

| Requisito | Versión mínima | Dónde obtener |
|---|---|---|
| **Windows** | 10 / 11 | — |
| **MiKTeX** | 26.5+ | [miktex.org/download](https://miktex.org/download) |
| **XeLaTeX** | Incluido en MiKTeX | Incluido automáticamente |
| **Fuentes** | Inter · MuseoModerno · Space Mono | Incluidas en `fonts/` del repo |

> **Importante:** el compilador **obligatorio** es XeLaTeX. No use pdfLaTeX ni LuaLaTeX — las fuentes del sistema no se cargan correctamente con esos compiladores.

### Para la plantilla Word

| Requisito | Versión mínima |
|---|---|
| **Microsoft Word** | 2016 o superior |
| **Fuentes instaladas** | Inter · MuseoModerno · Space Mono |

### Para la plantilla PowerPoint

| Requisito | Versión mínima |
|---|---|
| **Microsoft PowerPoint** | 2016 o superior |
| **Fuentes instaladas** | MuseoModerno · Inter |

---

## 3. Instalación inicial

Esta sección se realiza **una sola vez** por computador.

### Paso 1 — Instalar MiKTeX

1. Descargue el instalador desde [miktex.org/download](https://miktex.org/download)
2. Ejecute el instalador como **usuario normal** (no como administrador)
3. Cuando pregunte, elija **"Install missing packages on the fly: Yes"**
4. Complete la instalación con los valores por defecto

### Paso 2 — Instalar las fuentes tipográficas

Abra **PowerShell** en la carpeta raíz del repositorio y ejecute:

```powershell
.\setup_coriotlab.ps1
```

Este script instala automáticamente las tres fuentes del sistema CORIOTLAB en su perfil de Windows (`%LOCALAPPDATA%\Microsoft\Windows\Fonts\`):

- **Inter** — cuerpo de texto
- **MuseoModerno** — títulos y encabezados
- **Space Mono** — código fuente y datos técnicos

> **Verificación:** abra Word o PowerPoint, vaya a Inicio → Fuente, y busque "MuseoModerno". Si aparece en la lista, la instalación fue exitosa.

### Paso 3 — Verificar XeLaTeX

En PowerShell, ejecute:

```powershell
xelatex --version
```

Debe aparecer un mensaje con la versión de XeLaTeX. Si aparece un error, verifique que MiKTeX esté correctamente instalado.

---

## 4. Estructura de archivos

```
CORIOTLAB-plantillas-informes/
│
├── plantillas/                  ← Plantillas LaTeX + PDF compilado
│   ├── actividades/
│   │   ├── plantilla_actividades.tex   ← Editar aquí los campos
│   │   └── plantilla_actividades.pdf   ← Vista previa del resultado
│   └── tecnicos/
│       ├── plantilla_tecnico.tex
│       └── plantilla_tecnico.pdf
│
├── formatos/                    ← Plantillas en otros formatos
│   ├── word/
│   │   └── informe_actividades.docx
│   └── pptx/
│       └── PLANTILLA DIAPOSITIVAS.pptx
│
├── membretes/                   ← Imágenes PNG del membrete por color
│   ├── membrete_azul.png        (AzulITM #102D69 — el estándar)
│   ├── membrete_celeste.png     (AzulDigital #56ACDE)
│   ├── membrete_gris.png        (GrisPizarra #2F2F2F)
│   └── membrete_magenta.png     (Magenta #C14894)
│
├── fonts/                       ← Fuentes TTF (instalar con setup_coriotlab.ps1)
│
├── compile.ps1                  ← Script de compilación LaTeX (Windows)
├── setup_coriotlab.ps1          ← Instalador de fuentes (ejecutar una vez)
├── README.md                    ← Descripción del repositorio
└── docs/
    └── MANUAL_USUARIO.md        ← Este manual
```

---

## 5. Informe de Actividades

Documento de **reporte interno periódico**. Permite registrar actividades realizadas, su estado, observaciones del período y próximos pasos. Disponible en dos formatos.

---

### 5.1 Versión LaTeX / PDF

**Archivo:** `plantillas/actividades/plantilla_actividades.tex`

#### Zona de Configuración

Al abrir el archivo `.tex`, los primeros campos que verá son la **Zona de Configuración**. Son los **únicos que debe editar** para personalizar el informe:

```latex
\newcommand{\TipoPeriodo}{Semanal}
\newcommand{\DocNumero}{IA-2025-001}
\newcommand{\DocTitulo}{[Título del informe o proyecto]}
\newcommand{\DocProyecto}{[Nombre del proyecto]}
\newcommand{\DocAutor}{[Nombre completo del autor]}
\newcommand{\DocCargo}{[Cargo — CORIOTLAB]}
\newcommand{\DocPeriodo}{[Período: ej. 16 al 20 de junio de 2025]}
\newcommand{\DocFecha}{[DD de mes de AAAA]}
\newcommand{\DocVersion}{1.0}
```

#### Descripción de cada campo

| Campo | Valores aceptados | Ejemplo |
|---|---|---|
| `\TipoPeriodo` | `Semanal` · `Quincenal` · `Mensual` | `Semanal` |
| `\DocNumero` | Código correlativo `IA-AAAA-NNN` | `IA-2025-007` |
| `\DocTitulo` | Nombre del informe o proyecto | `Integración de módulo MQTT` |
| `\DocProyecto` | Nombre oficial del proyecto | `Sistema IoT Campus ITM` |
| `\DocAutor` | Nombre completo | `Santiago Cano Molina` |
| `\DocCargo` | Cargo en el laboratorio | `Investigador — CORIOTLAB` |
| `\DocPeriodo` | Rango de fechas del período | `16 al 20 de junio de 2025` |
| `\DocFecha` | Fecha de emisión del informe | `20 de junio de 2025` |
| `\DocVersion` | Versión del documento | `1.0` · `1.1` · `2.0` |

#### Estructura del documento (Variante A — Periódico)

El informe generado tiene tres secciones fijas:

**Sección 1 — Registro de Actividades**

Tabla con columnas: N°, Actividad, Descripción, Fecha, Hrs, Estado.

Cada fila representa una actividad. Edite el contenido dentro de `\begin{longtable}...\end{longtable}`:

```latex
\rowcolor{white}
1 &
[Nombre corto de la actividad] &
[Descripción detallada — máx. 150 caracteres.] &
[DD/MM] & [H] & \EstadoCompletado \\
```

Los estados disponibles son:

| Comando | Color | Cuándo usarlo |
|---|---|---|
| `\EstadoCompletado` | Verde | Actividad 100% finalizada |
| `\EstadoEnCurso` | Azul | En progreso, no terminada |
| `\EstadoPendiente` | Gris | Planificada, no iniciada |
| `\EstadoBloqueado` | Magenta | Detenida por causa externa |

Para agregar filas, copie el bloque de una fila existente y cambie el contenido. Alterne `\rowcolor{white}` y `\rowcolor{GrisClaro}` entre filas.

**Sección 2 — Observaciones**

Texto libre con situaciones relevantes del período. Incluye una caja de nota opcional:

```latex
\begin{tcolorbox}[cajaNota, title=Nota, top=4pt, bottom=4pt]
  [Texto de la nota...]
\end{tcolorbox}
```

**Sección 3 — Próximos Pasos**

Lista de acciones planificadas. Edite los ítems en:

```latex
\begin{itemize}[label={\color{AzulITM}\textbf{>}}, leftmargin=1.8em, ...]
  \item [Acción a realizar...]
  \item [Responsable y fecha límite...]
  \item [Recurso necesario...]
\end{itemize}
```

#### Variante B — Guía / Tutorial

El mismo archivo incluye una segunda variante comentada para documentar procedimientos técnicos paso a paso (instalaciones, configuraciones, tutoriales). Para activarla:

1. Comente el bloque de Variante A (desde `\section{Registro de Actividades}` hasta `\FirmaSimple`)
2. Descomente el bloque `%% === VARIANTE B: GUÍA TÉCNICA ===`

La Variante B incluye: Objetivo · Requisitos previos · Pasos numerados con código · Cajas de nota y alerta · Conclusión.

---

### 5.2 Versión Word (.docx)

**Archivo:** `formatos/word/informe_actividades.docx`

Esta versión es ideal para entregas inmediatas o cuando no se dispone de un entorno LaTeX configurado.

#### Cómo usar la plantilla Word

1. **Descargue** el archivo `informe_actividades.docx` a su carpeta de proyecto
2. **Abra** el archivo en Microsoft Word
3. **No modifique** el membrete, encabezado, ni el pie de página — son parte del diseño institucional
4. **Reemplace** cada campo marcado entre `[corchetes]` con la información real:

| Campo a reemplazar | Descripción |
|---|---|
| `[Tipo de informe]` | Semanal / Quincenal / Mensual |
| `[IA-AAAA-NNN]` | Código correlativo |
| `[Título del informe]` | Nombre del proyecto o período |
| `[Nombre del proyecto]` | Nombre oficial |
| `[Nombre completo]` | Autor del informe |
| `[Cargo]` | Cargo en CORIOTLAB |
| `[Período]` | Rango de fechas |
| `[Fecha]` | Fecha de emisión |

5. **Complete la tabla** de Registro de Actividades con sus datos reales
6. **Guarde con un nombre nuevo** (ej. `IA-2025-007_Sistema_IoT.docx`) — nunca sobreescriba la plantilla original

---

## 6. Informe Técnico

Documento de **nivel consultoría**, para entregas formales a clientes, directivos o entes externos. Incluye portada profesional, resumen ejecutivo, control de versiones, índice y secciones técnicas.

**Archivo:** `plantillas/tecnicos/plantilla_tecnico.tex`

#### Zona de Configuración

```latex
\newcommand{\DocNumero}{IT-2025-001}
\newcommand{\DocTitulo}{[Título completo del informe técnico]}
\newcommand{\DocSubtitulo}{[Subtítulo: enfoque técnico o alcance]}
\newcommand{\DocProyecto}{[Nombre oficial del proyecto]}
\newcommand{\DocCodigo}{CORIOT-2025-[SIGLAS]-001}
\newcommand{\DocCliente}{[Nombre del cliente o entidad destinataria]}
\newcommand{\DocPeriodo}{[Mes inicial] — [Mes final] [AAAA]}
\newcommand{\DocLugar}{Medellín, Colombia}
\newcommand{\DocVersion}{1.0}
\newcommand{\DocFecha}{[DD de mes de AAAA]}
\newcommand{\DocConfidencialidad}{Uso interno — \mbox{CORIOTLAB}}
\newcommand{\DocAutor}{[Nombre completo del autor]}
\newcommand{\DocCargoAutor}{[Cargo — CORIOTLAB]}
\newcommand{\DocRevisor}{[Nombre del revisor]}
\newcommand{\DocCargoRevisor}{[Cargo del revisor — CORIOTLAB]}
\newcommand{\DocEntidad}{CORIOTLAB — ITM}
```

#### Campos adicionales del Informe Técnico

| Campo | Descripción |
|---|---|
| `\DocNumero` | Código correlativo `IT-AAAA-NNN` |
| `\DocSubtitulo` | Frase corta que describe el alcance técnico |
| `\DocCodigo` | Código interno del proyecto (`CORIOT-AAAA-[SIGLAS]-NNN`) |
| `\DocCliente` | Entidad o persona que recibe el informe |
| `\DocConfidencialidad` | Nivel: `Uso interno`, `Confidencial`, `Público` |
| `\DocRevisor` | Nombre de quien aprueba o revisa el documento |
| `\DocCargoRevisor` | Cargo del revisor |

#### Estructura del documento

El informe técnico tiene secciones **fijas** y secciones **opcionales**.

**Secciones fijas** (siempre presentes):

| Página | Contenido |
|---|---|
| 1 | Portada con metadatos y Resumen Ejecutivo |
| 2 | Control de Versiones |
| 3 | Índice (generado automáticamente) |
| 4+ | 1. Introducción · 2. Objetivos · 3. Conclusiones |
| Última | Firmas y Aprobación |

**Secciones opcionales** (comentadas, activar según necesidad):

| Bloque | Sección | Cuándo usarlo |
|---|---|---|
| `OPT-A` | Marco Teórico | Proyectos de investigación o innovación |
| `OPT-B` | Metodología | Proyectos con enfoque de procesos definidos |
| `OPT-C` | Desarrollo Técnico + Código | Proyectos de desarrollo de software o hardware |
| `OPT-D` | Resultados con indicadores | Cuando existen métricas o KPIs |
| `OPT-E` | Recomendaciones | Entregas consultivas |
| `OPT-F` | Referencias Bibliográficas | Informes académicos o de investigación |
| `OPT-G` | Anexos | Material complementario extenso |

#### Activar una sección opcional

Busque el bloque que necesita, por ejemplo:

```latex
%% ── OPT-C: Desarrollo Técnico + Código ───────────────────────────
%\section{Desarrollo Técnico}
%\subsection{[Componente o módulo 1]}
%[Descripción...]
```

Seleccione todo el bloque y elimine los `%` del inicio de cada línea (en la mayoría de editores: seleccionar + `Ctrl+/` o `Ctrl+Shift+U`).

#### Resumen Ejecutivo (portada)

El resumen ejecutivo aparece en la portada dentro de una caja destacada. Reemplace el texto guía con 5-8 oraciones dirigidas a directivos o clientes sin formación técnica:

```latex
\begin{tcolorbox}[cajaResumen, width=\linewidth]
  [Sintetice aquí: contexto del proyecto, problema abordado,
  metodología empleada, principales resultados y conclusión central.]
\end{tcolorbox}
```

#### Control de Versiones

Edite la tabla en la página 2 para registrar cada revisión del documento:

```latex
1.0 & [DD/MM/AAAA] & [Nombre del autor] & Versión inicial del documento. \\
1.1 & [DD/MM/AAAA] & [Nombre del autor] & [Descripción del cambio.] \\
```

---

## 7. Plantilla de Diapositivas (.pptx)

**Archivo:** `formatos/pptx/PLANTILLA DIAPOSITIVAS.pptx`

Esta plantilla de PowerPoint contiene el diseño visual oficial de CORIOTLAB adaptado para presentaciones académicas y profesionales.

#### Cómo usar la plantilla

1. **Descargue** el archivo a su carpeta de proyecto
2. **Abra** en Microsoft PowerPoint
3. **Guarde inmediatamente con un nombre nuevo** para no modificar la plantilla original
4. **Active los patrones de diapositiva** para ver las variantes disponibles: `Vista → Patrón de diapositivas`

#### Diapositivas incluidas

| # | Tipo | Descripción |
|---|---|---|
| 1 | **Portada** | Fondo AzulITM completo, título centrado, subtítulo y autor |
| 2 | **Agenda** | Lista numerada de temas con encabezado AzulITM |
| 3 | **Separador de sección** | Fondo AzulITM con título de sección en blanco |
| 4 | **Contenido estándar** | Título + cuerpo de texto o lista de puntos |
| 5 | **Dos columnas** | Comparación o dos temas en paralelo |
| 6 | **Diapositiva de código** | Fondo oscuro con bloque de código en Space Mono |
| 7 | **Resultados** | Tabla o gráfico con indicadores |
| 8 | **Cierre** | Fondo AzulITM con mensaje de cierre y datos de contacto |

#### Buenas prácticas para presentaciones CORIOTLAB

- **Máximo 7 líneas** de texto por diapositiva
- Use el símbolo `>` como viñeta (ya configurado en los patrones)
- Los colores permitidos son solo los de la paleta institucional (ver [Sección 9](#9-identidad-visual-coriotlab))
- No cambie las fuentes — MuseoModerno para títulos, Inter para cuerpo
- Las imágenes técnicas (diagramas, capturas) van dentro de los marcos designados

---

## 8. Compilación LaTeX

### Método 1 — Script automático (recomendado)

Desde la **carpeta raíz del repositorio**, en PowerShell:

```powershell
.\compile.ps1 actividades      # Compila el Informe de Actividades
.\compile.ps1 tecnicos         # Compila el Informe Técnico
.\compile.ps1 todos            # Compila ambos documentos
```

El PDF resultante queda en la misma carpeta que el `.tex`.

### Método 2 — Compilación directa

Si el script falla (puede ocurrir con algunos caracteres en el mensaje de error), compile directamente desde PowerShell con **doble pasada**:

```powershell
# Desde la carpeta que contiene el .tex:
cd C:\CORIOTLAB\INFORMES\plantillas\actividades

xelatex -interaction=nonstopmode plantilla_actividades.tex
xelatex -interaction=nonstopmode plantilla_actividades.tex
```

> **¿Por qué doble pasada?** La primera pasada genera el índice, referencias cruzadas y numeración de páginas. La segunda los incorpora correctamente al documento. Siempre compile dos veces.

### Compilar desde su carpeta de proyecto

Cuando trabaje con una copia del `.tex` en su proyecto, adapte las rutas:

```powershell
cd C:\CORIOTLAB\PROYECTOS\MI_PROYECTO\informes

xelatex -interaction=nonstopmode mi_informe_actividades.tex
xelatex -interaction=nonstopmode mi_informe_actividades.tex
```

> **Atención con las rutas del membrete:** la línea `\includegraphics[...]{../../membretes/membrete_azul.png}` en el `.tex` usa una ruta relativa que asume que el archivo está dos niveles por debajo de la carpeta `membretes/`. Si cambia la profundidad de su carpeta de proyecto, actualice la ruta.

### Advertencias normales (no son errores)

Las siguientes advertencias aparecen en la compilación pero **no afectan el PDF**:

| Advertencia | Causa | Acción |
|---|---|---|
| `"So far, you have not checked for updates as a MiKTeX user"` | MiKTeX no ha verificado actualizaciones | Ignorar · El PDF se genera correctamente |
| `"Misplaced \noalign"` | Tablas con colores en encabezados | Ignorar · No es fatal |
| `"Rerun to get cross-references right"` | Falta la segunda pasada | Compilar una segunda vez |

---

## 9. Identidad visual CORIOTLAB

### Paleta de colores

| Token LaTeX | HEX | RGB | Uso |
|---|---|---|---|
| `AzulITM` | `#102D69` | 16, 45, 105 | Color institucional principal — títulos, portadas, encabezados de tabla |
| `Magenta` | `#C14894` | 193, 72, 148 | Robótica — alertas, estado Bloqueado, acentos |
| `AzulDigital` | `#56ACDE` | 86, 172, 222 | IoT — acentos, links, estado En curso, líneas decorativas |
| `GrisPizarra` | `#2F2F2F` | 47, 47, 47 | Texto principal del cuerpo |
| `GrisClaro` | `#F5F5F5` | 245, 245, 245 | Filas alternas de tablas, fondos de código |
| `GrisMedio` | `#888888` | 136, 136, 136 | Metadatos, etiquetas, pies de página |
| `GrisLinea` | `#DDDDDD` | 221, 221, 221 | Bordes de tabla, separadores |
| `VerdeTarea` | `#1A6B3C` | 26, 107, 60 | Estado Completado (solo en informe de actividades) |

### Tipografías

| Fuente | Uso | Carácter |
|---|---|---|
| **MuseoModerno** | Títulos, secciones, etiquetas de portada | Moderna, geométrica, impacto visual alto |
| **Inter** | Cuerpo de texto, tablas, metadatos | Altamente legible en pantalla e impresión |
| **Space Mono** | Código fuente, identificadores técnicos | Monoespaciada, claridad en código |

### Membretes

Existen cuatro variantes del membrete institucional. En LaTeX, el membrete se aplica automáticamente a todas las páginas. Para cambiar la variante, edite la línea en el `.tex`:

```latex
% Ruta del membrete (cambiar el color según necesidad):
\includegraphics[...]{../../membretes/membrete_azul.png}
%                                     ───────────────
%                    Opciones: membrete_azul.png
%                               membrete_celeste.png
%                               membrete_gris.png
%                               membrete_magenta.png
```

| Variante | Cuándo usar |
|---|---|
| `membrete_azul.png` | Documentos estándar CORIOTLAB (por defecto) |
| `membrete_celeste.png` | Documentos IoT o proyectos de conectividad |
| `membrete_gris.png` | Documentos formales o de bajo perfil visual |
| `membrete_magenta.png` | Documentos de robótica o proyectos especiales |

### Elementos gráficos de marca

- El símbolo **`<`** (menor que) es el ícono principal de CORIOTLAB — representa código, datos y control
- El símbolo **`>`** se usa como viñeta en listas y como separador decorativo
- Los cuadrados/píxeles remiten al isotipo CORIOT y al mundo digital
- Las diagonales sugieren dinamismo y flujo de datos

---

## 10. Flujo de trabajo completo

A continuación, el proceso recomendado para producir un documento desde cero.

### Paso 1 — Cree una carpeta para su proyecto

```
C:\CORIOTLAB\PROYECTOS\
└── 2025-06_Sistema_MQTT\
    └── informes\
```

### Paso 2 — Copie la plantilla correspondiente

```powershell
# Para un informe de actividades:
Copy-Item "C:\CORIOTLAB\INFORMES\plantillas\actividades\plantilla_actividades.tex" `
          "C:\CORIOTLAB\PROYECTOS\2025-06_Sistema_MQTT\informes\"

# Renombre el archivo con un nombre descriptivo:
Rename-Item "...\informes\plantilla_actividades.tex" "IA-2025-007_MQTT.tex"
```

### Paso 3 — Edite la Zona de Configuración

Abra el `.tex` con cualquier editor de texto (Notepad++, VS Code, TeXworks) y modifique únicamente los campos entre los delimitadores `%% ═══`:

```latex
%% ═══════════════════════════════════
\newcommand{\DocTitulo}{Sistema de control MQTT para sensores IoT}
\newcommand{\DocAutor}{Santiago Cano Molina}
\newcommand{\DocPeriodo}{16 al 20 de junio de 2025}
...
%% ═══════════════════════════════════
```

### Paso 4 — Complete el contenido

Edite la tabla de actividades, observaciones y próximos pasos con la información real del período. Reemplace todos los textos entre `[corchetes]`.

### Paso 5 — Compile el PDF

```powershell
cd "C:\CORIOTLAB\PROYECTOS\2025-06_Sistema_MQTT\informes"
xelatex -interaction=nonstopmode IA-2025-007_MQTT.tex
xelatex -interaction=nonstopmode IA-2025-007_MQTT.tex
```

### Paso 6 — Revise y entregue

Abra el PDF generado y verifique que:
- El membrete aparece en todas las páginas
- Los datos de la portada son correctos
- La tabla de actividades está completa y los estados son los correctos
- La firma tiene el nombre y cargo actualizados

---

## 11. Solución de problemas

### "Font cannot be found" al compilar

**Causa:** Las fuentes no están instaladas en el perfil de Windows.

**Solución:**
```powershell
# Desde la carpeta raíz del repositorio:
.\setup_coriotlab.ps1
```
Luego cierre y reabra PowerShell antes de volver a compilar.

---

### "Argument has an extra }" en itemize

**Causa:** Babel español convierte `>` en un carácter activo (shorthand para «»). Ocurre cuando falta la opción `es-noshorthands`.

**Solución:** Verifique que la línea de babel en el `.tex` sea exactamente:
```latex
\usepackage[spanish, es-nodecimaldot, es-noshorthands]{babel}
```

---

### El PDF se genera pero con exit code 1

**Causa:** MiKTeX muestra la advertencia `"So far, you have not checked for updates"` que devuelve código 1 aunque el PDF sea correcto.

**Solución:** Ignore el exit code. Abra el PDF — si se generó correctamente, no hay problema. Para eliminar la advertencia, actualice MiKTeX: `MiKTeX Console → Check for updates`.

---

### La imagen del membrete no aparece

**Causa:** La ruta relativa `../../membretes/membrete_azul.png` no corresponde a la profundidad de carpeta actual.

**Solución:** Cuente los niveles de carpeta entre el `.tex` y la carpeta `membretes/`:
- Si el `.tex` está en `INFORMES/plantillas/actividades/` → la ruta correcta es `../../membretes/`
- Si el `.tex` está en `PROYECTOS/MI_PROYECTO/informes/` y los membretes están en `INFORMES/membretes/` → ajuste la ruta o copie los PNG al proyecto

---

### La compilación se cuelga o tarda demasiado

**Causa:** MiKTeX está descargando paquetes LaTeX que faltan (ocurre solo la primera vez).

**Solución:** Espere. La primera compilación puede tardar varios minutos. Las compilaciones posteriores serán rápidas.

---

### El PDF tiene páginas en blanco adicionales

**Causa:** El contenido excede la capacidad de la página y genera hojas extra.

**Solución:** Reduzca el texto en las secciones más largas, o ajuste el espaciado con:
```latex
\setlength{\parskip}{3pt}  % reducir de 5pt a 3pt
```

---

### Diferencia de colores entre pantalla e impresión

**Causa:** Los monitores y las impresoras usan espacios de color diferentes (RGB vs CMYK).

**Solución:** Los colores están definidos en RGB (HTML). Para impresión profesional de alta fidelidad, solicite al impresor que convierta a CMYK usando los valores de referencia en la [Sección 9](#9-identidad-visual-coriotlab).

---

*Manual elaborado por el Laboratorio CORIOTLAB — ITM. Para soporte: lscritm4@gmail.com*
