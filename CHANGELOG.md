# CHANGELOG — Sistema de Plantillas CORIOTLAB

## [2.0.0] — 2026-06-22

### Reestructuración mayor del repositorio

#### Estructura
- Directorio `plantillas/` reemplaza a `informes/` como ubicación de las plantillas canónicas
- Directorio `formatos/` consolida plantillas Word (.docx) y PowerPoint (.pptx)
- Manual unificado `docs/MANUAL_USUARIO.md` reemplaza los 4 manuales separados anteriores
- Eliminados: `informes/`, `plantilla_base/`, `prompts/` (arquitectura simplificada)
- Eliminados: `compile.sh`, `setup_coriotlab.sh` (solo Windows/PowerShell desde v1.0)
- Eliminado: `README_proyectos.md` (información integrada en MANUAL_USUARIO.md)

#### Correcciones de compilación LaTeX
- `plantilla_actividades.tex`: corregido `Overfull \hbox (23.9pt)` en tabla de actividades — anchos de columna ajustados de `0.6+3.2+5.8+1.4+0.8+2.5cm` a `0.6+3.0+5.2+1.3+0.7+2.5cm`
- `plantilla_tecnico.tex`: corregido `Overfull \hbox (7.49pt)` en tabla de control de versiones — columna Fecha ampliada de 2.6cm a 2.9cm
- `plantilla_tecnico.tex`: corregido `Overfull \hbox (2.14pt)` en tabla de firmas — columna separadora reducida de 0.8cm a 0.4cm
- Ambas plantillas compilan sin errores con `Exit: 0`

#### Documentación
- `docs/MANUAL_USUARIO.md`: manual completo con instalación, configuración de cada plantilla, compilación LaTeX, paleta de colores y solución de problemas
- `README.md`: actualizado para reflejar nueva estructura y apuntar al manual

#### Scripts
- `compile.ps1`: actualizado para apuntar a `plantillas/` como fuente principal; `todos` y `plantillas` son equivalentes

---

## [1.3.0] — 2026-06-21

### Cambiado
- Estilo de secciones en todos los templates LaTeX: eliminado `\titlerule` debajo
  de los títulos de sección para coincidir con la estructura del documento Word de referencia.
  Los títulos quedan como texto AzulITM bold con espaciado aumentado.
- Macro `\FirmaSimple` (actividades): reemplazado `\hline` de tabla por línea de color
  AzulITM (`\rule{7cm}{0.6pt}`), nombre en bold GrisPizarra, cargo/org/fecha en GrisMedio.
- Tabla de firmas (informe técnico): mismo cambio — líneas AzulITM en lugar de `\hline`.
- Aumentado el espaciado `\titlespacing*{\section}` de `{0pt}{1.8em}{0.6em}` a
  `{0pt}{2em}{0.8em}` para compensar la eliminación de la línea decorativa.

### Agregado
- Carpeta `formatos/word/` con `informe_actividades.docx` — plantilla Word oficial
  con la misma estructura de secciones que la versión LaTeX.
- Sección **Formatos disponibles** en README con tabla separada LaTeX / Word.
- Sección **Estructura del repositorio** en README con árbol de directorios.

### Eliminado
- Archivos `test_fonts.tex`, `test_fonts2.tex`, `test_abspath.tex`, `test_names.tex`
  (residuos de sesiones de debugging) de `informes/actividades/`.

---

## [1.2.0] — 2026-06-19

### Agregado
- Plantillas con texto guía y Fichas de Uso en `plantillas/`
- Manuales de usuario en `docs/` (MANUAL_SISTEMA, ACTIVIDADES, TECNICO, PRESENTACION)
- README rediseñado con índice visual, badges y tabla de formatos

---

## [1.0.0] — 2026-06-19

### Agregado
- Sistema completo de plantillas XeLaTeX con identidad CORIOTLAB
- Informe de Actividades interno (variantes: periódico y guía)
- Informe Técnico externo nivel consultoría con secciones opcionales
- Presentación Beamer con diseño propio sin membretes
- Scripts de compilación automática (compile.ps1 / compile.sh)
- Scripts de instalación de fuentes (setup_coriotlab.ps1 / .sh)
- Archivo CLAUDE.md con memoria permanente del proyecto
- Estructura PROYECTOS/ para separar plantillas de trabajo real
- Prompts versionados para generación con IA

### Decisiones técnicas
- XeLaTeX como compilador obligatorio (soporte de fuentes del sistema)
- Fuentes instaladas en Windows por nombre (no por Path relativo)
- babel español con es-noshorthands para compatibilidad con >
- Membretes PNG a 8% opacidad via TikZ + eso-pic
- Presentaciones con diseño Beamer propio, sin membretes PNG

### Fixes conocidos
- fontspec Path relativo no funciona en MiKTeX Windows → fuentes por nombre
- babel > conflict → es-noshorthands
- compile.ps1 encoding issue → compilar directamente con xelatex si falla

### Próximos pasos sugeridos
- [ ] Subir a repositorio GitHub privado
- [ ] Automatización con n8n: formulario → PDF automático
- [ ] API Anthropic: interfaz web para generación de documentos
- [ ] Pipeline CI/CD con GitHub Actions para compilación automática
