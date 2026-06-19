# CORIOTLAB — Sistema de Plantillas de Documentos

![XeLaTeX](https://img.shields.io/badge/XeLaTeX-requerido-2C6EAA?logo=latex&logoColor=white)
![MiKTeX](https://img.shields.io/badge/MiKTeX-26.5+-0078D4?logo=windows&logoColor=white)
![Fuentes](https://img.shields.io/badge/Fuentes-Google%20Fonts-EA4335?logo=google-fonts&logoColor=white)
![Versión](https://img.shields.io/badge/versión-1.2-102D69)
![Licencia](https://img.shields.io/badge/licencia-privada%20CORIOTLAB-C14894)

> Sistema oficial de plantillas XeLaTeX con identidad visual completa del
> **Laboratorio CORIOTLAB — ITM**. Genera documentos PDF institucionales
> listos para entregar: informes internos, informes técnicos y presentaciones.

---

## Formatos disponibles

| Formato | Plantilla | Manual | PDF de muestra |
|---|---|---|---|
| Informe de Actividades | [`plantillas/actividades/plantilla_actividades.tex`](plantillas/actividades/plantilla_actividades.tex) | [Manual](docs/MANUAL_ACTIVIDADES.md) | `output/actividades/` |
| Informe Técnico | [`plantillas/tecnicos/plantilla_tecnico.tex`](plantillas/tecnicos/plantilla_tecnico.tex) | [Manual](docs/MANUAL_TECNICO.md) | `output/tecnicos/` |
| Presentación Beamer | [`plantillas/presentaciones/plantilla_presentacion.tex`](plantillas/presentaciones/plantilla_presentacion.tex) | [Manual](docs/MANUAL_PRESENTACION.md) | `output/presentaciones/` |

---

## Inicio rápido

```powershell
# 1. Instalar fuentes (solo la primera vez)
.\setup_coriotlab.ps1

# 2. Copiar la plantilla deseada a tu proyecto
Copy-Item plantillas\actividades\plantilla_actividades.tex `
          C:\CORIOTLAB\PROYECTOS\MI_PROYECTO\informes\actividades\

# 3. Editar solo la Zona de Configuración al inicio del .tex
#    (campos entre los delimitadores %% ═══)

# 4. Compilar (doble pasada obligatoria)
cd C:\CORIOTLAB\PROYECTOS\MI_PROYECTO\informes\actividades
xelatex -interaction=nonstopmode plantilla_actividades.tex
xelatex -interaction=nonstopmode plantilla_actividades.tex

# 5. El PDF queda en la misma carpeta del .tex
```

---

## Paleta de colores

| Token | HEX | Vista | Uso |
|---|---|---|---|
| `AzulITM` | `#102D69` | ![#102D69](https://placehold.co/14x14/102D69/102D69.png) | Institucional — titulares, portadas, encabezados de tabla |
| `Magenta` | `#C14894` | ![#C14894](https://placehold.co/14x14/C14894/C14894.png) | Alertas, bloqueados, acento en presentaciones |
| `AzulDigital` | `#56ACDE` | ![#56ACDE](https://placehold.co/14x14/56ACDE/56ACDE.png) | Acentos, enlaces, estado "En curso", franjas |
| `GrisPizarra` | `#2F2F2F` | ![#2F2F2F](https://placehold.co/14x14/2F2F2F/2F2F2F.png) | Texto principal |
| `GrisClaro` | `#F2F2F2` | ![#F2F2F2](https://placehold.co/14x14/F2F2F2/F2F2F2.png) | Filas alternas, fondos de código |
| `VerdeTarea` | `#1A5C35` | ![#1A5C35](https://placehold.co/14x14/1A5C35/1A5C35.png) | Estado "Completado" (actividades) |

---

## Tipografías

| Fuente | Nombre en Windows | Uso |
|---|---|---|
| **MuseoModerno** | `MuseoModerno` | Títulos, secciones, encabezados |
| **Space Mono** | `Space Mono` | Código fuente, términos técnicos |
| **Inter** | `Inter` | Cuerpo de texto |

---

## Documentación

| Documento | Contenido |
|---|---|
| [MANUAL_SISTEMA.md](docs/MANUAL_SISTEMA.md) | Estructura, compilación, rutas, reglas críticas |
| [MANUAL_ACTIVIDADES.md](docs/MANUAL_ACTIVIDADES.md) | Tabla de actividades, estados, variantes |
| [MANUAL_TECNICO.md](docs/MANUAL_TECNICO.md) | Secciones fijas y opcionales, control de versiones |
| [MANUAL_PRESENTACION.md](docs/MANUAL_PRESENTACION.md) | Diapositivas, reglas Beamer, agregar slides |
| [CHANGELOG.md](CHANGELOG.md) | Historial de versiones |

---

## Requisitos

- **MiKTeX 26.5+** instalado en Windows
- **XeLaTeX** (incluido en MiKTeX) — compilador obligatorio
- **Fuentes instaladas:** Inter, MuseoModerno, Space Mono
  ```powershell
  .\setup_coriotlab.ps1   # instala las fuentes en %LOCALAPPDATA%\Microsoft\Windows\Fonts\
  ```

---

## ¿Necesitas exportar a Word o Overleaf?

**Word (.docx):** Estas plantillas usan fuentes y diseño que no tienen
equivalente directo en Word. Para entregas que requieran `.docx`, copiar el
texto del PDF compilado y aplicar el Brand Book CORIOTLAB manualmente.

**Overleaf:** Las plantillas **no son compatibles** con Overleaf porque:
1. Overleaf no tiene acceso a las fuentes instaladas localmente.
2. Las rutas de membretes son relativas al sistema de archivos Windows.

Para uso en Overleaf sería necesario: subir los TTF como recursos del proyecto
y cambiar las rutas de `fontspec` a `Path=fonts/...`.

---

## Créditos

**Desarrollado por:** Laboratorio CORIOTLAB — Instituto Tecnológico Metropolitano (ITM)  
**Responsable:** lscritm4@gmail.com  
**Tecnologías:** XeLaTeX · Beamer · TikZ · tcolorbox · fontspec · Inter · MuseoModerno · Space Mono  
**Repositorio:** [github.com/santiagocano298366/coriotlab-plantillas-informes](https://github.com/santiagocano298366/coriotlab-plantillas-informes)
