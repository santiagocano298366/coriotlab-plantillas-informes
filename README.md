# CORIOTLAB — Sistema de Plantillas de Documentos

![XeLaTeX](https://img.shields.io/badge/XeLaTeX-requerido-2C6EAA?logo=latex&logoColor=white)
![MiKTeX](https://img.shields.io/badge/MiKTeX-26.5+-0078D4?logo=windows&logoColor=white)
![Versión](https://img.shields.io/badge/versión-1.4-102D69)
![Licencia](https://img.shields.io/badge/licencia-privada%20CORIOTLAB-C14894)

> Plantillas oficiales de documentos con identidad visual completa del
> **Laboratorio CORIOTLAB — Instituto Tecnológico Metropolitano (ITM), Medellín**.
> Disponible en tres formatos: **LaTeX/PDF**, **Word (.docx)** y **PowerPoint (.pptx)**.

---

## Inicio rápido

**1. Instalar fuentes** (solo la primera vez):
```powershell
.\setup_coriotlab.ps1
```

**2. Copiar la plantilla** a su carpeta de proyecto y editar la Zona de Configuración al inicio del `.tex`.

**3. Compilar** con doble pasada XeLaTeX:
```powershell
xelatex -interaction=nonstopmode mi_informe.tex
xelatex -interaction=nonstopmode mi_informe.tex
```

> El **[Manual de Usuario completo](docs/MANUAL_USUARIO.md)** cubre instalación, configuración de cada plantilla, compilación y solución de problemas.

---

## Plantillas disponibles

### LaTeX → PDF

| Documento | Plantilla | PDF de referencia |
|---|---|---|
| **Informe de Actividades** | [`plantillas/actividades/plantilla_actividades.tex`](plantillas/actividades/plantilla_actividades.tex) | [`plantilla_actividades.pdf`](plantillas/actividades/plantilla_actividades.pdf) |
| **Informe Técnico** | [`plantillas/tecnicos/plantilla_tecnico.tex`](plantillas/tecnicos/plantilla_tecnico.tex) | [`plantilla_tecnico.pdf`](plantillas/tecnicos/plantilla_tecnico.pdf) |

### Word y PowerPoint

| Documento | Archivo |
|---|---|
| **Informe de Actividades** | [`formatos/word/informe_actividades.docx`](formatos/word/informe_actividades.docx) |
| **Presentación** | [`formatos/pptx/PLANTILLA DIAPOSITIVAS.pptx`](formatos/pptx/PLANTILLA%20DIAPOSITIVAS.pptx) |

---

## Estructura del repositorio

```
├── plantillas/          ← Fuentes LaTeX + PDF compilado (copiar a su proyecto)
│   ├── actividades/
│   └── tecnicos/
├── formatos/            ← Plantillas Word y PowerPoint
│   ├── word/
│   └── pptx/
├── membretes/           ← PNG de membrete institucional (4 colores)
├── fonts/               ← Fuentes TTF (instalar con setup_coriotlab.ps1)
├── docs/
│   └── MANUAL_USUARIO.md   ← Manual completo de uso
├── compile.ps1          ← Compilador LaTeX (Windows PowerShell)
└── setup_coriotlab.ps1  ← Instalador de fuentes
```

---

## Paleta de colores

| Token | HEX | Uso |
|---|---|---|
| `AzulITM` | `#102D69` | Color institucional — títulos, portadas, tablas |
| `Magenta` | `#C14894` | Robótica — alertas, estado Bloqueado |
| `AzulDigital` | `#56ACDE` | IoT — acentos, enlaces, estado En curso |
| `GrisPizarra` | `#2F2F2F` | Texto principal |

## Tipografías

| Fuente | Uso |
|---|---|
| **MuseoModerno** | Títulos y encabezados |
| **Inter** | Cuerpo de texto |
| **Space Mono** | Código fuente |

---

## Requisitos

| Requisito | Detalle |
|---|---|
| **MiKTeX 26.5+** | Instalado en Windows — incluye XeLaTeX |
| **XeLaTeX** | Compilador obligatorio (nunca pdfLaTeX) |
| **Fuentes** | Instalar con `.\setup_coriotlab.ps1` |
| **Microsoft Office** | Solo para los formatos .docx y .pptx |

---

**Laboratorio CORIOTLAB — ITM** · lscritm4@gmail.com  
[github.com/santiagocano298366/coriotlab-plantillas-informes](https://github.com/santiagocano298366/coriotlab-plantillas-informes)
