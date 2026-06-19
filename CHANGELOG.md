# CHANGELOG — Sistema de Plantillas CORIOTLAB

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
