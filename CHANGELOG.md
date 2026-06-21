# CHANGELOG — Sistema de Plantillas CORIOTLAB

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
