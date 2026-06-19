# Manual — Informe Técnico

**Plantilla:** `plantillas/tecnicos/plantilla_tecnico.tex`
**Versión:** 1.2 | **Actualizado:** 2025-06-19

---

## ¿Para qué sirve?

Documento de nivel consultoría para reportar proyectos técnicos con rigor
formal: diseño, implementación, resultados y recomendaciones. Dirigido a
clientes, entidades externas, convocatorias o como informe interno formal
de cierre de proyecto.

---

## Estructura del documento

```
1. Portada           (automática desde config)
2. Control de versiones  (tabla editable)
3. Tabla de contenido    (automática)
4. Introducción          (fijo)
5. Objetivos             (fijo)
   5.1 Objetivo General
   5.2 Objetivos Específicos
── SECCIONES OPCIONALES (activar según proyecto) ──
   OPT-A: Marco Teórico
   OPT-B: Metodología
   OPT-C: Desarrollo Técnico + Código
   OPT-D: Resultados con indicadores
   OPT-E: Recomendaciones
   OPT-F: Referencias Bibliográficas
   OPT-G: Anexos
── FIN SECCIONES OPCIONALES ──
6. Conclusiones          (fijo)
7. Firmas y Aprobación   (automática desde config)
```

---

## Zona de Configuración — campos explicados

```latex
\newcommand{\DocTitulo}{...}           % Nombre completo del informe (máx. 100 chars)
\newcommand{\DocSubtitulo}{...}        % Subtítulo técnico o enfoque
\newcommand{\DocNumero}{IT-2025-[NNN]} % Formato: IT-AAAA-NNN
\newcommand{\DocProyecto}{...}         % Nombre oficial del proyecto
\newcommand{\DocCodigo}{CORIOT-2025-...} % Código interno (CORIOT-AAAA-SIGLAS-NNN)
\newcommand{\DocCliente}{...}          % Organización o entidad destinataria
\newcommand{\DocPeriodo}{...}          % "Enero --- Junio 2025"
\newcommand{\DocLugar}{Medellín, Colombia}
\newcommand{\DocVersion}{1.0}
\newcommand{\DocFecha}{...}            % "30 de junio de 2025"
\newcommand{\DocConfidencialidad}{...} % "Uso interno --- CORIOTLAB" | "Confidencial"
\newcommand{\DocAutor}{...}            % Nombre completo del autor
\newcommand{\DocCargoAutor}{...}       % Cargo del autor
\newcommand{\DocRevisor}{...}          % Nombre del revisor/aprobador
\newcommand{\DocCargoRevisor}{...}     % Cargo del revisor
\newcommand{\DocEntidad}{CORIOTLAB --- ITM}
```

---

## Secciones fijas — instrucciones

### Resumen Ejecutivo (en portada)

Síntesis de 5-8 oraciones dentro de `cajaResumen`. Debe responder:
¿qué se hizo?, ¿cómo?, ¿cuál fue el resultado clave?

```latex
\begin{tcolorbox}[cajaResumen, width=\linewidth]
  El presente informe documenta...
\end{tcolorbox}
```

> No usar listas ni subtítulos dentro del resumen ejecutivo.

### Control de versiones

Agregar una fila por versión del documento. Formato fecha: `DD/MM/AAAA`.

```latex
\rowcolor{white}
1.0 & 15/04/2025 & \DocAutor & Versión inicial — diseño de arquitectura. \\
\rowcolor{GrisClaro}
1.1 & 02/06/2025 & \DocAutor & Incorporación de resultados de pruebas. \\
```

### Introducción

3-4 párrafos:
1. Contexto institucional del proyecto.
2. Problema o necesidad que motiva el trabajo.
3. Descripción general de la solución.
4. Alcance (usar `cajaDatos` para delimitar claramente).

### Objetivos

- **General:** Una sola oración con verbo infinitivo. Estructura: "Verbo + objeto + para + propósito + mediante + método".
- **Específicos:** 3-6 ítems medibles y verificables con viñetas `>`.

### Conclusiones

3 párrafos:
1. Valoración global (¿se cumplieron los objetivos?).
2. Hallazgos técnicos o lecciones aprendidas.
3. (Opcional) Proyección o continuidad del trabajo.

Cerrar con `cajaResultado`:
```latex
\begin{tcolorbox}[cajaResultado]
  El proyecto cumplió / superó / no alcanzó los indicadores...
\end{tcolorbox}
```

---

## Secciones opcionales — cómo activar

Para activar una sección opcional: **eliminar el `%`** al inicio de cada
línea del bloque correspondiente.

### OPT-A: Marco Teórico
Para informes que requieren fundamentación teórica o cuando el lector
no tiene formación técnica. Incluir: conceptos clave, estado del arte.

### OPT-B: Metodología
Para proyectos con fases bien definidas (iterativo, investigación-acción).
Incluir: fases del proyecto, criterios de diseño, herramientas usadas.

### OPT-C: Desarrollo Técnico + Código
Para documentar implementaciones. Soporta Python y C++.
Envolver bloques de código en `cajaDatos`:
```latex
\begin{tcolorbox}[cajaDatos]
\begin{lstlisting}[language=Python, caption={Descripción}]
def mi_funcion():
    return 42
\end{lstlisting}
\end{tcolorbox}
```

### OPT-D: Resultados con indicadores
Para informes que presentan métricas de desempeño.
Tabla: Indicador | Meta | Logrado | % Cumplimiento | Observaciones.

### OPT-E: Recomendaciones
Para informes que incluyen sugerencias de acción al cliente.
Ordenar de mayor a menor prioridad.

### OPT-F: Referencias
Para citar normas, artículos, datasheets. Formato APA 7 preferido.

### OPT-G: Anexos
Para material complementario: diagramas, tablas extensas, especificaciones.
Usar `\appendix` para cambiar la numeración a letras (A, B, C...).

---

## Cajas disponibles

| Caja | Estilo | Uso |
|---|---|---|
| `cajaNota` | Azul, borde izq. | Notas aclaratorias, buenas prácticas |
| `cajaAlerta` | Magenta, borde izq. | Advertencias, riesgos |
| `cajaResultado` | AzulITM, borde izq. | Resultados destacados, conclusión |
| `cajaDatos` | Fondo gris | Código, tablas de datos, fichas técnicas |
| `cajaResumen` | Marco AzulITM | Solo para el Resumen Ejecutivo en portada |

---

## Numeración de documentos

Formato: `IT-AAAA-NNN`

- `IT` = Informe Técnico
- `AAAA` = año
- `NNN` = correlativo de 3 dígitos

Código interno: `CORIOT-AAAA-SIGLAS-NNN`
- `SIGLAS` = identificador del proyecto (ej. `MA` = Monitoreo Ambiental)

---

## Compilar

```powershell
cd C:\CORIOTLAB\INFORMES\plantillas\tecnicos
xelatex -interaction=nonstopmode plantilla_tecnico.tex
xelatex -interaction=nonstopmode plantilla_tecnico.tex
```
