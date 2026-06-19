# CORIOTLAB — Sistema de Plantillas de Documentos

Sistema de plantillas LaTeX para la generación de documentos oficiales
del Laboratorio CORIOTLAB (Control, Robótica e IoT) del ITM.

---

## Descripción

Este sistema provee plantillas XeLaTeX con identidad visual completa
del laboratorio CORIOTLAB, incluyendo membretes, colores institucionales,
tipografías oficiales y bloques modulares de contenido reutilizables.

Cada plantilla aplica automáticamente el membrete de fondo correspondiente
(azul, celeste, gris o magenta) y genera documentos listos para imprimir
o compartir en PDF.

---

## Requisitos

| Herramienta | Descripción | Obligatorio |
|-------------|-------------|-------------|
| **XeLaTeX** | Compilador LaTeX con soporte de fuentes del sistema | Sí |
| **MiKTeX** (Windows) o **MacTeX** / **TeX Live** (Mac/Linux) | Distribución TeX | Sí |
| **Fuentes Google Fonts** | Inter, MuseoModerno, Space Mono | Sí |
| PowerShell 5.1+ | Para scripts en Windows | Opcional |
| bash / curl / unzip | Para scripts en Mac/Linux | Opcional |

---

## Instalación paso a paso

### Windows

**1. Instalar MiKTeX**

Descarga el instalador desde [miktex.org/download](https://miktex.org/download)
y selecciona la opción **"Install missing packages on-the-fly: Yes"**.

**2. Instalar fuentes (automático)**

```powershell
cd INFORMES
.\setup_coriotlab.ps1
```

**3. Instalar fuentes (manual)**

Si el script falla, descarga manualmente desde Google Fonts:

| Fuente | Enlace |
|--------|--------|
| Inter | https://fonts.google.com/specimen/Inter |
| Museo Moderno | https://fonts.google.com/specimen/Museo+Moderno |
| Space Mono | https://fonts.google.com/specimen/Space+Mono |

Extrae cada ZIP y coloca los archivos TTF en:

```
fonts/Inter/static/
fonts/MuseoModerno/static/
fonts/SpaceMono/
```

### macOS / Linux

```bash
cd INFORMES
bash setup_coriotlab.sh
```

En macOS también puedes instalar MacTeX con:

```bash
brew install --cask mactex-no-gui
```

En Ubuntu/Debian:

```bash
sudo apt install texlive-xetex texlive-lang-spanish
```

---

## Estructura de carpetas

```
INFORMES/
├── fonts/
│   ├── Inter/static/          ← Fuente cuerpo de texto
│   ├── MuseoModerno/static/   ← Fuente títulos
│   └── SpaceMono/             ← Fuente código y técnico
├── membretes/                 ← Imágenes PNG de fondo por color
│   ├── membrete_azul.png      ← Azul ITM (#102D69)
│   ├── membrete_celeste.png   ← Azul Digital (#56ACDE)
│   ├── membrete_gris.png      ← Gris Pizarra (#2F2F2F)
│   └── membrete_magenta.png   ← Magenta (#C14894)
├── plantilla_base/
│   ├── coriotlab_colors.tex   ← Paleta de colores oficial
│   └── coriotlab_base.tex     ← Plantilla maestra con todos los bloques
├── informes/
│   ├── actividades/           ← Informe de actividades mensual
│   ├── tecnicos/              ← Informe técnico
│   ├── cuentas_cobro/         ← Cuenta de cobro
│   ├── memorandos/            ← Memorando interno
│   └── propuestas/            ← Propuesta de proyecto
├── output/                    ← PDFs generados (subcarpeta por tipo)
├── assets/imagenes/           ← Imágenes e ilustraciones propias
├── setup_coriotlab.ps1        ← Setup Windows
├── setup_coriotlab.sh         ← Setup Mac/Linux
├── compile.ps1                ← Compilador Windows
└── compile.sh                 ← Compilador Mac/Linux
```

---

## Tipos de documento

| Tipo | Archivo | Membrete | Color |
|------|---------|----------|-------|
| Informe de Actividades | `informes/actividades/informe_actividades.tex` | `membrete_azul.png` | Azul ITM |
| Informe Técnico | `informes/tecnicos/informe_tecnico.tex` | `membrete_azul.png` | Azul ITM |
| Cuenta de Cobro | `informes/cuentas_cobro/cuenta_cobro.tex` | `membrete_magenta.png` | Magenta |
| Memorando | `informes/memorandos/memorando.tex` | `membrete_gris.png` | Gris Pizarra |
| Propuesta de Proyecto | `informes/propuestas/propuesta_proyecto.tex` | `membrete_azul.png` | Azul ITM |

> El membrete `membrete_celeste.png` (Azul Digital / IoT) está disponible
> para asignarlo a documentos específicos del área de IoT editando
> `\ArchivoMembrete` y `\ColorPrincipal` en la zona de configuración.

---

## Cómo crear un documento nuevo

1. Abre el archivo `.tex` del tipo que necesitas.
2. Edita **únicamente la Zona de Configuración** delimitada por:

```
% ▼▼▼ ZONA DE CONFIGURACIÓN — editar antes de compilar ▼▼▼
...
% ▲▲▲ FIN DE ZONA DE CONFIGURACIÓN ▲▲▲
```

3. Ajusta los campos:
   - `\TituloDocumento` → Título real del documento
   - `\NumeroInforme` → Número correlativo
   - `\NombreProyecto` y `\CodigoProyecto`
   - `\AutorNombre`, `\AutorCargo`, `\AutorEmail`
   - `\DestinatarioNombre`, `\DestinatarioCargo`, `\DestinatarioEntidad`
   - `\ResumenEjecutivo`

4. En el cuerpo, completa el contenido en los bloques activos.
5. Para activar un bloque comentado, elimina los `%` de inicio de línea.

---

## Cómo compilar

### Compilación manual (desde la carpeta del documento)

```bash
cd informes/actividades
xelatex -interaction=nonstopmode informe_actividades.tex
xelatex -interaction=nonstopmode informe_actividades.tex
```

> Se ejecuta **dos veces** para que la Tabla de Contenido quede correcta.

### Compilación con script

**Windows:**

```powershell
.\compile.ps1 actividades
.\compile.ps1 tecnicos
.\compile.ps1 cuentas_cobro
.\compile.ps1 memorandos
.\compile.ps1 propuestas
.\compile.ps1 todos
```

**Mac/Linux:**

```bash
bash compile.sh actividades
bash compile.sh todos
```

Los PDFs se generan en `output/[tipo]/`.

---

## Fuentes oficiales

| Fuente | Uso en documentos | Google Fonts |
|--------|-------------------|-------------|
| **Museo Moderno** | Títulos, secciones, portada | [Ver fuente](https://fonts.google.com/specimen/Museo+Moderno) |
| **Space Mono** | Código, términos técnicos, metadatos | [Ver fuente](https://fonts.google.com/specimen/Space+Mono) |
| **Inter** | Cuerpo de texto corrido | [Ver fuente](https://fonts.google.com/specimen/Inter) |

---

## Paleta de colores

| Nombre | HEX | Uso |
|--------|-----|-----|
| Azul ITM | `#102D69` | Control — color principal institucional |
| Magenta | `#C14894` | Robótica — cuentas de cobro |
| Azul Digital | `#56ACDE` | IoT — documentos del área digital |
| Gris Pizarra | `#2F2F2F` | Neutro — memorandos y documentos formales |

---

## Solución de problemas comunes

**Error "Font not found"**
→ Las fuentes no están en `fonts/`. Ejecuta el script de setup o instálalas manualmente.

**Error "File not found: ../../membretes/..."**
→ Asegúrate de compilar **desde la carpeta del documento** (ej: `informes/actividades/`),
no desde la raíz `INFORMES/`.

**El PDF no muestra el membrete de fondo**
→ Verifica que el archivo PNG existe en `membretes/` con el nombre exacto
especificado en `\ArchivoMembrete`.

**La tabla de contenido muestra páginas incorrectas**
→ Compila **dos veces**. La primera pasada genera el `.toc`, la segunda lo incorpora.

---

## Créditos

**Diseño de marca CORIOTLAB**
Ronald De Los Ríos Q. — Comunicador
ron.delosrios@gmail.com

**Sistema de plantillas LaTeX**
CORIOTLAB — Laboratorio de Control, Robótica e IoT
Instituto Tecnológico Metropolitano — ITM
www.coriotlab.co · info@coriotlab.co

---

*Versión del sistema: 1.0 — Junio 2025*
*Brand Book: versión 17 de julio de 2025*
