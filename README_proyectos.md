# Estructura de Proyectos CORIOTLAB

## Organización recomendada

La estructura correcta separa las **plantillas** del **trabajo real**:

```
C:\CORIOTLAB\
├── INFORMES\          ← sistema de plantillas (NUNCA editar para trabajo real)
└── PROYECTOS\         ← trabajo real (crear manualmente)
    └── _TEMPLATE\     ← carpeta modelo para nuevo proyecto
        ├── informes\
        │   ├── actividades\
        │   └── tecnicos\
        ├── presentaciones\
        └── README_proyecto.md
```

## Crear la estructura PROYECTOS (hacer manualmente una vez)

```powershell
# Ejecutar en PowerShell como usuario normal:
New-Item -ItemType Directory -Force "C:\CORIOTLAB\PROYECTOS\_TEMPLATE\informes\actividades"
New-Item -ItemType Directory -Force "C:\CORIOTLAB\PROYECTOS\_TEMPLATE\informes\tecnicos"
New-Item -ItemType Directory -Force "C:\CORIOTLAB\PROYECTOS\_TEMPLATE\presentaciones"
```

## Cómo iniciar un nuevo proyecto

1. **Copiar** la carpeta `C:\CORIOTLAB\PROYECTOS\_TEMPLATE\`
2. **Renombrar** la copia con el nombre del proyecto, por ejemplo:
   `C:\CORIOTLAB\PROYECTOS\monitoreo-ambiental-2025\`
3. **Copiar** el .tex correspondiente desde las plantillas:
   ```powershell
   # Ejemplo para informe de actividades:
   Copy-Item "C:\CORIOTLAB\INFORMES\informes\actividades\informe_actividades.tex" `
             "C:\CORIOTLAB\PROYECTOS\monitoreo-ambiental-2025\informes\actividades\"
   ```
4. **Editar** SOLO la Zona de Configuracion al inicio del .tex
   (campos delimitados entre `%% ═══ ZONA DE CONFIGURACIÓN ═══`)
5. **Activar/desactivar** variantes o bloques opcionales (comentar/descomentar)
6. **Compilar** dos veces con XeLaTeX:
   ```powershell
   cd "C:\CORIOTLAB\PROYECTOS\monitoreo-ambiental-2025\informes\actividades"
   xelatex -interaction=nonstopmode informe_actividades.tex
   xelatex -interaction=nonstopmode informe_actividades.tex
   ```
7. PDF generado en la misma carpeta. Copiar a `output\` si se desea archivar.

## Regla de oro

> **Nunca modificar los .tex en `C:\CORIOTLAB\INFORMES\`** para trabajo real.
> Esa carpeta es el sistema de plantillas. Solo tocarla para mejorar las plantillas.
