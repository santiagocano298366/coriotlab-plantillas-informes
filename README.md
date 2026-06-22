# CORIOTLAB — Sistema de Plantillas de Documentos

![XeLaTeX](https://img.shields.io/badge/XeLaTeX-requerido-2C6EAA?logo=latex&logoColor=white)
![MiKTeX](https://img.shields.io/badge/MiKTeX-26.5+-0078D4?logo=windows&logoColor=white)
![Versión](https://img.shields.io/badge/versión-1.4-102D69)
![Licencia](https://img.shields.io/badge/licencia-privada%20CORIOTLAB-C14894)

> Sistema oficial de plantillas de documentos con identidad visual completa del
> **Laboratorio CORIOTLAB — ITM**. Disponible en tres formatos: **LaTeX/PDF** (informes institucionales),
> **Word** (.docx para edición rápida) y **PowerPoint** (.pptx para presentaciones).

---

## Formatos disponibles

### LaTeX → PDF (informes)

Genera PDFs institucionales con membrete, tipografía y paleta de colores CORIOTLAB.
Requiere XeLaTeX (MiKTeX 26.5+) y fuentes instaladas en Windows.

| Documento | Plantilla LaTeX | PDF | Manual |
|---|---|---|---|
| **Informe de Actividades** | [`plantillas/actividades/plantilla_actividades.tex`](plantillas/actividades/plantilla_actividades.tex) | [`plantillas/actividades/plantilla_actividades.pdf`](plantillas/actividades/plantilla_actividades.pdf) | [Manual](docs/MANUAL_ACTIVIDADES.md) |
| **Informe Técnico** | [`plantillas/tecnicos/plantilla_tecnico.tex`](plantillas/tecnicos/plantilla_tecnico.tex) | [`plantillas/tecnicos/plantilla_tecnico.pdf`](plantillas/tecnicos/plantilla_tecnico.pdf) | [Manual](docs/MANUAL_TECNICO.md) |

### Word → .docx (edición rápida)

Para entregas inmediatas o cuando no se dispone de XeLaTeX.
Misma estructura de secciones que las plantillas LaTeX.

| Documento | Archivo Word |
|---|---|
| **Informe de Actividades** | [`formatos/word/informe_actividades.docx`](formatos/word/informe_actividades.docx) |

> Misma estructura de secciones que el LaTeX: Registro de Actividades → Observaciones → Próximos Pasos → Firma.

### PowerPoint → .pptx (presentaciones)

Plantilla oficial de diapositivas con identidad visual CORIOTLAB.

| Documento | Archivo |
|---|---|
| **Plantilla de Diapositivas** | [`formatos/pptx/PLANTILLA DIAPOSITIVAS.pptx`](formatos/pptx/PLANTILLA%20DIAPOSITIVAS.pptx) |

---

## Inicio rápido — LaTeX

```powershell
# 1. Instalar fuentes (solo la primera vez)
.\setup_coriotlab.ps1

# 2. Copiar la plantilla deseada a tu carpeta de proyecto
Copy-Item plantillas\actividades\plantilla_actividades.tex `
          C:\CORIOTLAB\PROYECTOS\MI_PROYECTO\informes\

# 3. Editar la Zona de Configuración al inicio del .tex
#    (campos entre los delimitadores %% ═══)

# 4. Compilar con doble pasada (obligatoria)
cd C:\CORIOTLAB\PROYECTOS\MI_PROYECTO\informes
xelatex -interaction=nonstopmode plantilla_actividades.tex
xelatex -interaction=nonstopmode plantilla_actividades.tex

# 5. El PDF queda en la misma carpeta
```

O usando el script de compilación del repositorio:

```powershell
.\compile.ps1 actividades      # Informe de Actividades
.\compile.ps1 tecnicos         # Informe Técnico
.\compile.ps1 todos            # Ambos documentos
```

---

## Inicio rápido — Word

1. Descargar [`formatos/word/informe_actividades.docx`](formatos/word/informe_actividades.docx)
2. Abrir en Microsoft Word
3. Reemplazar todos los campos entre `[corchetes]` con la información real
4. Guardar como nuevo archivo con el nombre del proyecto

---

## Estructura del repositorio

```
INFORMES/
├── plantillas/              ← Plantillas LaTeX + PDF (COPIAR, no editar aquí)
│   ├── actividades/         → plantilla_actividades.tex + .pdf
│   └── tecnicos/            → plantilla_tecnico.tex + .pdf
│
├── formatos/                ← Plantillas en otros formatos
│   ├── word/                → informe_actividades.docx
│   └── pptx/                → PLANTILLA DIAPOSITIVAS.pptx
│
├── informes/                ← Documentos de ejemplo con contenido IoT (referencia)
│   ├── actividades/
│   └── tecnicos/
│
├── membretes/               ← PNGs de membrete (azul, celeste, gris, magenta)
├── fonts/                   ← Fuentes TTF (Inter, MuseoModerno, Space Mono)
├── docs/                    ← Manuales de uso
├── compile.ps1              ← Script de compilación Windows
└── setup_coriotlab.ps1      ← Instalador de fuentes Windows
```

---

## Paleta de colores

| Token | HEX | Uso |
|---|---|---|
| `AzulITM` | `#102D69` | Institucional — títulos, portadas, encabezados de tabla |
| `Magenta` | `#C14894` | Alertas, estado Bloqueado, acentos en presentaciones |
| `AzulDigital` | `#56ACDE` | Acentos, enlaces, estado En curso, franjas |
| `GrisPizarra` | `#2F2F2F` | Texto principal de cuerpo |
| `GrisClaro` | `#F2F2F2` | Filas alternas de tablas, fondos de código |
| `VerdeTarea` | `#1A5C35` | Estado Completado (informe de actividades) |

---

## Tipografías

| Fuente | Nombre en Windows | Uso |
|---|---|---|
| **MuseoModerno** | `MuseoModerno` | Títulos, secciones, encabezados |
| **Space Mono** | `Space Mono` | Código fuente, términos técnicos |
| **Inter** | `Inter` | Cuerpo de texto |

Instalar ejecutando `.\setup_coriotlab.ps1` (una sola vez).

---

## Documentación completa

| Manual | Contenido |
|---|---|
| [MANUAL_SISTEMA.md](docs/MANUAL_SISTEMA.md) | Estructura general, compilación, rutas, reglas críticas |
| [MANUAL_ACTIVIDADES.md](docs/MANUAL_ACTIVIDADES.md) | Tabla de actividades, estados, variante Guía |
| [MANUAL_TECNICO.md](docs/MANUAL_TECNICO.md) | Secciones fijas y opcionales, control de versiones |
| [CHANGELOG.md](CHANGELOG.md) | Historial de versiones |

---

## Requisitos técnicos

| Requisito | Detalle |
|---|---|
| **MiKTeX 26.5+** | Instalado en Windows — incluye XeLaTeX |
| **XeLaTeX** | Compilador obligatorio (nunca pdfLaTeX ni LuaLaTeX) |
| **Fuentes** | Inter · MuseoModerno · Space Mono (instalar con `setup_coriotlab.ps1`) |
| **Microsoft Word** | Solo necesario para el formato `.docx` |

---

## Créditos

**Desarrollado por:** Laboratorio CORIOTLAB — Instituto Tecnológico Metropolitano (ITM)  
**Responsable:** lscritm4@gmail.com  
**Tecnologías:** XeLaTeX · Beamer · TikZ · tcolorbox · fontspec · Inter · MuseoModerno · Space Mono  
**Repositorio:** [github.com/santiagocano298366/coriotlab-plantillas-informes](https://github.com/santiagocano298366/coriotlab-plantillas-informes)
