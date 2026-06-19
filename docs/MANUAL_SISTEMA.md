# Manual del Sistema — CORIOTLAB Plantillas LaTeX

**Versión:** 1.2 | **Actualizado:** 2025-06-19

---

## ¿Qué es este sistema?

Sistema de plantillas LaTeX para generar documentos PDF institucionales del
**Laboratorio CORIOTLAB** (Control, Robótica e Internet de las Cosas — ITM,
Medellín). Produce documentos con identidad de marca coherente: tipografía,
colores, membrete y estructura fijos.

---

## Documentos disponibles

| Tipo | Plantilla | Uso |
|---|---|---|
| Informe de Actividades | `plantillas/actividades/plantilla_actividades.tex` | Reportes internos periódicos o guías técnicas |
| Informe Técnico | `plantillas/tecnicos/plantilla_tecnico.tex` | Documentación externa nivel consultoría |
| Presentación Beamer | `plantillas/presentaciones/plantilla_presentacion.tex` | Presentaciones académicas y profesionales |

---

## Requisitos del sistema

| Componente | Versión | Rol |
|---|---|---|
| MiKTeX | 26.5+ | Distribución LaTeX para Windows |
| XeLaTeX | incluido en MiKTeX | Compilador obligatorio (soporte fontspec) |
| Fuentes instaladas | — | Inter, MuseoModerno, Space Mono en `%LOCALAPPDATA%\Microsoft\Windows\Fonts\` |

> **Importante:** Las fuentes deben estar instaladas con el script
> `setup_coriotlab.ps1` antes de compilar por primera vez.

---

## Estructura de carpetas

```
C:\CORIOTLAB\INFORMES\
├── plantillas\
│   ├── actividades\    ← plantilla_actividades.tex  (editar aquí)
│   ├── tecnicos\       ← plantilla_tecnico.tex       (editar aquí)
│   └── presentaciones\ ← plantilla_presentacion.tex  (editar aquí)
├── docs\               ← manuales de usuario (este archivo)
├── informes\           ← plantillas de referencia (NO editar)
├── membretes\          ← PNG membretes (azul, celeste, gris, magenta)
├── fonts\              ← archivos TTF de fuentes
├── output\             ← PDFs compilados
├── compile.ps1         ← script de compilación
└── setup_coriotlab.ps1 ← instalador de fuentes
```

---

## Flujo de trabajo recomendado

### Para trabajo real en un proyecto

1. Copiar `C:\CORIOTLAB\PROYECTOS\_TEMPLATE\` → renombrar con el nombre del proyecto.
2. Copiar la plantilla correspondiente desde `plantillas/[tipo]/` a la carpeta del proyecto.
3. Ajustar la ruta del membrete (ver sección "Rutas relativas").
4. Editar **solo la Zona de Configuración** al inicio del `.tex`.
5. Compilar con XeLaTeX (doble pasada).

### Para pruebas o referencia rápida

Editar directamente la plantilla en `plantillas/[tipo]/` y compilar con:
```powershell
.\compile.ps1 plantilla-actividades
.\compile.ps1 plantilla-tecnico
.\compile.ps1 plantilla-presentacion
```

---

## Rutas relativas del membrete

La ruta al membrete PNG es **relativa** al archivo `.tex`. Según la ubicación:

| Ubicación del .tex | Ruta al membrete |
|---|---|
| `plantillas/actividades/` | `../../membretes/membrete_azul.png` |
| `plantillas/tecnicos/` | `../../membretes/membrete_azul.png` |
| `PROYECTOS/MI_PROYECTO/informes/actividades/` | `../../../../INFORMES/membretes/membrete_azul.png` |

**Alternativa universal:** ruta absoluta con barras normales:
```latex
{C:/CORIOTLAB/INFORMES/membretes/membrete_azul.png}
```

---

## Compilación

### Comando directo (recomendado para depuración)

```powershell
# Desde la carpeta del .tex:
cd C:\CORIOTLAB\INFORMES\plantillas\actividades
xelatex -interaction=nonstopmode plantilla_actividades.tex
xelatex -interaction=nonstopmode plantilla_actividades.tex
```

> La doble pasada es obligatoria para que el TOC, numeración de páginas
> y referencias cruzadas sean correctas.

### Script compile.ps1

```powershell
# Desde C:\CORIOTLAB\INFORMES\:
.\compile.ps1 actividades           # informe de actividades original
.\compile.ps1 plantilla-actividades # plantilla con texto guía
.\compile.ps1 todos                 # compila los 3 documentos originales
```

### Advertencias no fatales (ignorar)

- `"So far, you have not checked for updates as a MiKTeX user"` → MiKTeX sale con código 1 aunque el PDF sea correcto.
- `"Rerun to get cross-references right"` → indica que falta la segunda pasada.
- `"Misplaced \noalign"` → no fatal, el PDF se genera correctamente.

---

## Paleta de colores

| Nombre | HEX | Uso |
|---|---|---|
| `AzulITM` | `#102D69` | Color institucional — titulares, encabezados de tabla, portadas |
| `Magenta` | `#C14894` | Alertas, estados bloqueados, acento en presentaciones |
| `AzulDigital` | `#56ACDE` | Acentos, enlaces, estados "En curso", franjas decorativas |
| `GrisPizarra` | `#2F2F2F` | Texto principal del cuerpo |
| `GrisClaro` | `#F2F2F2` | Filas alternas en tablas, fondos de código |
| `GrisMedio` | `#AAAAAA` | Metadatos, pies de página, texto secundario |
| `GrisLinea` | `#DDDDDD` | Separadores y bordes de tabla |
| `VerdeTarea` | `#1A5C35` | Estado "Completado" (solo en informe de actividades) |

---

## Tipografías

| Fuente | Nombre en Windows | Uso |
|---|---|---|
| **MuseoModerno** | `MuseoModerno` | Títulos, secciones, encabezados de tabla |
| **Space Mono** | `Space Mono` | Código fuente, términos técnicos |
| **Inter** | `Inter` | Cuerpo de texto |

---

## Reglas críticas (no modificar)

1. **Compilador XeLaTeX siempre** — nunca pdfLaTeX ni LuaLaTeX.
2. **Fuentes por nombre de familia** — nunca usar `Path=` en `fontspec`.
3. **`es-noshorthands` en babel** — evita que `>` se vuelva activo.
4. **`[fragile]` en frames Beamer con código** — obligatorio con `lstlisting`.
5. **No usar `enumitem` en Beamer** — incompatibilidad conocida.

---

## Manuales específicos

- [MANUAL_ACTIVIDADES.md](MANUAL_ACTIVIDADES.md) — Informe de Actividades
- [MANUAL_TECNICO.md](MANUAL_TECNICO.md) — Informe Técnico
- [MANUAL_PRESENTACION.md](MANUAL_PRESENTACION.md) — Presentación Beamer
