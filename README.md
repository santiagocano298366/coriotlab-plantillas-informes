<div align="center">

# CORIOTLAB · Sistema de Plantillas de Documentos

**Laboratorio de Control, Robótica e Internet de las Cosas**  
Instituto Tecnológico Metropolitano — ITM, Medellín, Colombia

---

[![XeLaTeX](https://img.shields.io/badge/XeLaTeX-requerido-2C6EAA?style=flat-square&logo=latex&logoColor=white)](https://miktex.org/)
[![MiKTeX](https://img.shields.io/badge/MiKTeX-26.5+-0078D4?style=flat-square&logo=windows&logoColor=white)](https://miktex.org/download)
[![Versión](https://img.shields.io/badge/versión-2.0-102D69?style=flat-square)](CHANGELOG.md)
[![Word](https://img.shields.io/badge/Word-.docx-2B579A?style=flat-square&logo=microsoftword&logoColor=white)](formatos/word/)
[![PowerPoint](https://img.shields.io/badge/PowerPoint-.pptx-B7472A?style=flat-square&logo=microsoftpowerpoint&logoColor=white)](formatos/pptx/)
[![Licencia](https://img.shields.io/badge/uso-CORIOTLAB%20ITM-C14894?style=flat-square)](mailto:lscritm4@gmail.com)

</div>

---

Plantillas oficiales de documentos con **identidad visual completa** del Laboratorio CORIOTLAB. Tres formatos — LaTeX/PDF, Word y PowerPoint — listos para usar en informes de actividades, informes técnicos y presentaciones institucionales.

---

## Plantillas disponibles

| # | Documento | Formatos | Para qué |
|---|---|---|---|
| 1 | **Informe de Actividades** | `.tex` + `.pdf` + `.docx` | Reportes periódicos internos (semanal / quincenal / mensual) |
| 2 | **Informe Técnico** | `.tex` + `.pdf` | Entregas formales a clientes o directivos, nivel consultoría |
| 3 | **Presentación** | `.pptx` | Exposiciones académicas y reuniones institucionales |

> Ver el PDF de referencia de cada plantilla antes de usar: [`plantilla_actividades.pdf`](plantillas/actividades/plantilla_actividades.pdf) · [`plantilla_tecnico.pdf`](plantillas/tecnicos/plantilla_tecnico.pdf)

---

## Inicio rápido

### Paso 1 — Instalar fuentes (una sola vez por computador)

Abra PowerShell en la carpeta raíz del repositorio y ejecute:

```powershell
.\setup_coriotlab.ps1
```

Instala automáticamente **Inter**, **MuseoModerno** y **Space Mono** en su perfil de Windows. Necesario tanto para LaTeX como para Word/PowerPoint.

### Paso 2 — Copiar la plantilla a su proyecto

```powershell
# Ejemplo: informe técnico
Copy-Item "plantillas\tecnicos\plantilla_tecnico.tex" "C:\MiProyecto\IT-2026-001_MiProyecto.tex"
```

**No edite los archivos originales del repositorio.** Trabaje siempre sobre una copia.

### Paso 3 — Editar y compilar

Abra el `.tex` copiado, complete la **Zona de Configuración** al inicio del archivo (primeras ~20 líneas), llene el contenido, y compile con doble pasada:

```powershell
xelatex -interaction=nonstopmode MI_INFORME.tex
xelatex -interaction=nonstopmode MI_INFORME.tex
```

> **¿Por qué doble pasada?** La primera genera el índice y referencias cruzadas; la segunda los incorpora correctamente al PDF.

---

## Plantilla 1 — Informe de Actividades

**Archivos:**
- LaTeX: [`plantillas/actividades/plantilla_actividades.tex`](plantillas/actividades/plantilla_actividades.tex)
- PDF de referencia: [`plantilla_actividades.pdf`](plantillas/actividades/plantilla_actividades.pdf)
- Word: [`formatos/word/informe_actividades.docx`](formatos/word/informe_actividades.docx)

**Campos a configurar:**

```latex
\newcommand{\TipoPeriodo}{Semanal}           % Semanal | Quincenal | Mensual
\newcommand{\DocNumero}{IA-2026-001}         % IA-AAAA-NNN
\newcommand{\DocTitulo}{Título del informe}
\newcommand{\DocProyecto}{Nombre del proyecto}
\newcommand{\DocAutor}{Nombre completo}
\newcommand{\DocCargo}{Cargo — CORIOTLAB}
\newcommand{\DocPeriodo}{16 al 20 de junio de 2026}
\newcommand{\DocFecha}{20 de junio de 2026}
\newcommand{\DocVersion}{1.0}
```

**Estructura del documento:**

| Sección | Contenido |
|---|---|
| Portada | Tipo, código, título, proyecto y metadatos |
| Registro de Actividades | Tabla con N°, actividad, descripción, fecha, horas y estado |
| Observaciones | Texto libre + caja de nota opcional |
| Próximos Pasos | Lista de acciones planificadas |
| Firma | Nombre y cargo del autor |

**Estados de actividad disponibles:**

| Comando LaTeX | Color | Cuándo usarlo |
|---|---|---|
| `\EstadoCompletado` | Verde | Actividad 100% finalizada |
| `\EstadoEnCurso` | Azul | En progreso |
| `\EstadoPendiente` | Gris | Planificada, no iniciada |
| `\EstadoBloqueado` | Magenta | Detenida por causa externa |

**Variante B — Guía Técnica:** el mismo archivo incluye una segunda variante comentada para documentar procedimientos paso a paso. Descomente el bloque `%% === VARIANTE B` para activarla.

---

## Plantilla 2 — Informe Técnico

**Archivos:**
- LaTeX: [`plantillas/tecnicos/plantilla_tecnico.tex`](plantillas/tecnicos/plantilla_tecnico.tex)
- PDF de referencia: [`plantilla_tecnico.pdf`](plantillas/tecnicos/plantilla_tecnico.pdf)

**Campos a configurar:**

```latex
\newcommand{\DocNumero}{IT-2026-001}
\newcommand{\DocTitulo}{Título completo del informe}
\newcommand{\DocSubtitulo}{Subtítulo o alcance técnico}
\newcommand{\DocProyecto}{Nombre del proyecto}
\newcommand{\DocCodigo}{CORIOT-2026-[SIGLAS]-001}
\newcommand{\DocCliente}{Nombre del cliente o entidad}
\newcommand{\DocPeriodo}{Enero — Junio 2026}
\newcommand{\DocFecha}{30 de junio de 2026}
\newcommand{\DocAutor}{Nombre del autor}
\newcommand{\DocCargoAutor}{Cargo — CORIOTLAB}
\newcommand{\DocRevisor}{Nombre del revisor}
\newcommand{\DocCargoRevisor}{Cargo del revisor}
```

**Estructura fija (siempre presente):**

| Página | Contenido |
|---|---|
| 1 | Portada con metadatos + Resumen Ejecutivo |
| 2 | Control de Versiones |
| 3 | Tabla de Contenido (generada automáticamente) |
| 4+ | Introducción · Objetivos · Conclusiones |
| Última | Firmas y Aprobación |

**Secciones opcionales** (descomente el bloque correspondiente):

| Bloque | Sección | Cuándo activar |
|---|---|---|
| `OPT-A` | Marco Teórico | Investigación o innovación |
| `OPT-B` | Metodología | Proyectos con fases definidas |
| `OPT-C` | Desarrollo Técnico + Código | Software o hardware |
| `OPT-D` | Resultados con indicadores | Cuando hay métricas o KPIs |
| `OPT-E` | Recomendaciones | Entregas consultivas |
| `OPT-F` | Referencias Bibliográficas | Informes académicos |
| `OPT-G` | Anexos | Material complementario extenso |

---

## Plantilla 3 — Presentación

**Archivo:** [`formatos/pptx/PLANTILLA DIAPOSITIVAS.pptx`](formatos/pptx/PLANTILLA%20DIAPOSITIVAS.pptx)

Ábralo en Microsoft PowerPoint, guárdelo con un nombre nuevo y reemplace los textos de cada diapositiva.

**Diapositivas incluidas:**

| # | Tipo | Descripción |
|---|---|---|
| 1 | Portada | Fondo AzulITM, título y datos del autor |
| 2 | Agenda | Lista de temas con encabezado institucional |
| 3 | Separador de sección | Fondo AzulITM con título de sección |
| 4 | Contenido estándar | Título + cuerpo o lista de puntos |
| 5 | Dos columnas | Comparación o temas en paralelo |
| 6 | Código | Fondo oscuro con bloque en Space Mono |
| 7 | Resultados | Tabla o gráfico con indicadores |
| 8 | Cierre | Fondo AzulITM con datos de contacto |

---

## Uso avanzado — Ruta del membrete

El membrete se aplica automáticamente usando la ruta configurada en el `.tex`. La ruta **por defecto es relativa** desde `plantillas/actividades/` o `plantillas/tecnicos/`:

```latex
{../../membretes/membrete_azul.png}
```

Si copia el `.tex` a una carpeta de proyecto distinta, **use una ruta absoluta**:

```latex
{C:/CORIOTLAB/INFORMES/membretes/membrete_azul.png}
```

**Variantes del membrete disponibles:**

| Archivo | Color | HEX | Cuándo usar |
|---|---|---|---|
| `membrete_azul.png` | AzulITM | `#102D69` | Documentos estándar (por defecto) |
| `membrete_celeste.png` | AzulDigital | `#56ACDE` | Proyectos IoT o conectividad |
| `membrete_gris.png` | GrisPizarra | `#2F2F2F` | Documentos formales o neutros |
| `membrete_magenta.png` | Magenta | `#C14894` | Proyectos de robótica |

---

## Compilación con script

Desde la raíz del repositorio, usando el script automático:

```powershell
.\compile.ps1 actividades    # Informe de Actividades
.\compile.ps1 tecnicos       # Informe Técnico
.\compile.ps1 todos          # Ambos documentos
```

El PDF queda en la misma carpeta que el `.tex`. El script ejecuta la doble pasada automáticamente.

---

## Identidad visual

### Paleta de colores

| Token | HEX | RGB | Uso |
|---|---|---|---|
| `AzulITM` | `#102D69` | 16, 45, 105 | Institucional — títulos, portadas, tablas |
| `Magenta` | `#C14894` | 193, 72, 148 | Robótica — alertas, estado Bloqueado |
| `AzulDigital` | `#56ACDE` | 86, 172, 222 | IoT — acentos, links, estado En curso |
| `GrisPizarra` | `#2F2F2F` | 47, 47, 47 | Texto principal del cuerpo |
| `GrisClaro` | `#F5F5F5` | 245, 245, 245 | Filas alternas, fondos de código |
| `GrisMedio` | `#888888` | 136, 136, 136 | Metadatos, etiquetas |
| `GrisLinea` | `#DDDDDD` | 221, 221, 221 | Bordes, separadores |
| `VerdeTarea` | `#1A6B3C` | 26, 107, 60 | Estado Completado |

### Tipografías

| Fuente | Uso | Nombre Windows |
|---|---|---|
| **MuseoModerno** | Títulos, secciones, portada | `MuseoModerno` |
| **Inter** | Cuerpo de texto, tablas | `Inter` |
| **Space Mono** | Código fuente, identificadores | `Space Mono` |

---

## Requisitos del sistema

| Componente | Requisito | Notas |
|---|---|---|
| **Sistema operativo** | Windows 10 / 11 | Scripts PowerShell |
| **Compilador LaTeX** | XeLaTeX (incluido en MiKTeX) | Nunca usar pdfLaTeX |
| **Distribución LaTeX** | MiKTeX 26.5+ | [miktex.org/download](https://miktex.org/download) |
| **Fuentes** | Inter · MuseoModerno · Space Mono | Instalar con `setup_coriotlab.ps1` |
| **Word / PowerPoint** | Microsoft Office 2016+ | Solo para formatos .docx / .pptx |

> **Nota:** XeLaTeX es **obligatorio**. Es el único compilador que carga las fuentes del sistema Windows. pdfLaTeX y LuaLaTeX no son compatibles con esta configuración.

---

## Estructura del repositorio

```
coriotlab-plantillas-informes/
│
├── plantillas/                          ← Plantillas LaTeX
│   ├── actividades/
│   │   ├── plantilla_actividades.tex    ← copiar y editar
│   │   └── plantilla_actividades.pdf    ← vista previa
│   └── tecnicos/
│       ├── plantilla_tecnico.tex
│       └── plantilla_tecnico.pdf
│
├── formatos/                            ← Plantillas Word y PowerPoint
│   ├── word/
│   │   └── informe_actividades.docx
│   └── pptx/
│       └── PLANTILLA DIAPOSITIVAS.pptx
│
├── membretes/                           ← Membretes PNG (4 variantes de color)
│   ├── membrete_azul.png
│   ├── membrete_celeste.png
│   ├── membrete_gris.png
│   └── membrete_magenta.png
│
├── docs/
│   └── MANUAL_USUARIO.md               ← Guía completa paso a paso
│
├── compile.ps1                          ← Compilar LaTeX (doble pasada automática)
├── setup_coriotlab.ps1                  ← Instalar fuentes en Windows
└── CHANGELOG.md                         ← Historial de versiones
```

---

## Solución de problemas frecuentes

<details>
<summary><strong>Error: "Font cannot be found"</strong></summary>

Las fuentes no están instaladas en Windows. Ejecute desde la raíz del repositorio:

```powershell
.\setup_coriotlab.ps1
```

Luego cierre y reabra PowerShell antes de compilar.

</details>

<details>
<summary><strong>El PDF se genera pero con exit code 1</strong></summary>

MiKTeX muestra la advertencia `"So far, you have not checked for updates"` que devuelve exit code 1 aunque el PDF sea correcto. Abra el PDF — si existe, la compilación fue exitosa. Para eliminar la advertencia: abra **MiKTeX Console → Check for updates**.

</details>

<details>
<summary><strong>El membrete no aparece en el PDF</strong></summary>

La ruta relativa `../../membretes/membrete_azul.png` solo funciona cuando el `.tex` está en `plantillas/actividades/` o `plantillas/tecnicos/`. Si lo movió a otra carpeta, cambie la ruta por la absoluta:

```latex
{C:/CORIOTLAB/INFORMES/membretes/membrete_azul.png}
```

</details>

<details>
<summary><strong>La primera compilación tarda mucho</strong></summary>

MiKTeX está descargando paquetes LaTeX faltantes. Ocurre solo la primera vez. Espere hasta que termine — las compilaciones siguientes serán rápidas.

</details>

---

## Manual de usuario completo

Para instrucciones detalladas sobre cada plantilla, flujo de trabajo completo y solución avanzada de problemas, consulte el **[Manual de Usuario](docs/MANUAL_USUARIO.md)**.

---

<div align="center">

**Laboratorio CORIOTLAB — Instituto Tecnológico Metropolitano**  
Medellín, Colombia · [lscritm4@gmail.com](mailto:lscritm4@gmail.com)

</div>
