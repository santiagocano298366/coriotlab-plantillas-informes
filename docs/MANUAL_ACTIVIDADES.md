# Manual — Informe de Actividades

**Plantilla:** `plantillas/actividades/plantilla_actividades.tex`
**Versión:** 1.2 | **Actualizado:** 2025-06-19

---

## ¿Para qué sirve?

Documento interno para reportar las actividades realizadas por un miembro de
CORIOTLAB durante un período definido (semanal, quincenal o mensual), o para
documentar guías técnicas paso a paso.

---

## Variantes disponibles

| Variante | `\TipoVariante` | Uso |
|---|---|---|
| **Periódico** | `periodico` | Reporte regular con tabla de actividades y estados |
| **Guía** | `guia` | Documentación de procedimientos con código fuente |

Para cambiar de variante:
1. Cambiar el valor de `\TipoVariante` en la Zona de Configuración.
2. En el cuerpo del documento, **comentar** la variante activa y **descomentar** la deseada.

---

## Zona de Configuración — campos explicados

```latex
\newcommand{\TipoVariante}{periodico}      % "periodico" o "guia"
\newcommand{\TipoPeriodo}{Semanal}         % Semanal | Quincenal | Mensual
\newcommand{\DocTitulo}{...}               % Nombre del proyecto (máx. 80 chars)
\newcommand{\DocNumero}{IA-2025-[NNN]}     % Formato: IA-AAAA-NNN
\newcommand{\DocAutor}{...}                % Nombre completo del autor
\newcommand{\DocCargo}{...}                % Cargo dentro de CORIOTLAB
\newcommand{\DocProyecto}{...}             % Nombre oficial del proyecto
\newcommand{\DocPeriodo}{...}              % "16 al 20 de junio de 2025"
\newcommand{\DocFecha}{\today}             % Fecha de entrega (o escribir fija)
\newcommand{\DocVersion}{1.0}             % Iniciar en 1.0
```

---

## Variante A: Periódico — guía de uso

### Tabla de actividades

La tabla tiene 6 columnas: N°, Actividad, Descripción, Fecha, Hrs, Estado.

**Estructura de una fila:**
```latex
\rowcolor{white}           % Alternar con \rowcolor{GrisClaro}
1 & Nombre corto &
Descripción detallada (máx. 150 chars). &
16/06 & 4 & \EstadoCompletado \\
```

**Macros de estado disponibles:**

| Macro | Color | Significado |
|---|---|---|
| `\EstadoCompletado` | Verde (`#1A5C35`) | Actividad finalizada en el período |
| `\EstadoEnCurso` | AzulDigital (`#56ACDE`) | Actividad en progreso |
| `\EstadoPendiente` | GrisMedio (`#AAAAAA`) | Planificada pero no iniciada |
| `\EstadoBloqueado` | Magenta (`#C14894`) | Detenida por impedimento externo |

> Para actividades **Bloqueadas**, usar `---` en las columnas Fecha y Hrs.

**Ejemplo de tabla completa:**
```latex
\rowcolor{white}
1 & Firmware MQTT & Desarrollo del protocolo de comunicación con el broker. &
17/06 & 6 & \EstadoCompletado \\
\rowcolor{GrisClaro}
2 & Integración Node-RED & Flujos de visualización en dashboard. &
18/06 & 5 & \EstadoEnCurso \\
\rowcolor{white}
3 & Documentación API & Especificación de endpoints REST. &
20/06 & 2 & \EstadoPendiente \\
\rowcolor{GrisClaro}
4 & Certificados TLS & Pendiente de acceso al servidor ITM. &
--- & --- & \EstadoBloqueado \\
```

### Conteo de horas

```latex
\noindent{\small\color{GrisMedio}
\textbf{Total horas registradas:} 20\,h
\quad|\quad
\textbf{Período:} \DocPeriodo
}
```

### Observaciones

Texto libre. Explicar: dificultades, cambios de alcance, decisiones.
Usar `cajaNota` para información crítica:
```latex
\begin{tcolorbox}[cajaNota]
  Texto de la nota importante.
\end{tcolorbox}
```

### Próximos pasos

Lista de acciones con viñetas `>`:
```latex
\begin{itemize}[label={\color{AzulITM}\textbf{>}}, leftmargin=1.8em, itemsep=4pt]
  \item Completar integración Node-RED.
  \item Resolver acceso TLS e implementar cifrado MQTT.
\end{itemize}
```

> Iniciar cada ítem con verbo en infinitivo: "Completar", "Implementar", "Revisar".

### Firma

La firma se inserta automáticamente con `\FirmaSimple`. Toma los datos
de `\DocAutor`, `\DocCargo` y `\DocFecha` de la Zona de Configuración.

---

## Variante B: Guía Técnica — guía de uso

Estructura del documento:

1. **Objetivo de la Guía** — qué proceso o sistema documenta (2-3 oraciones).
2. **Requisitos Previos** — hardware, software, versiones, permisos necesarios.
3. **Pasos** — subsecciones numeradas con código en bloques `cajaDatos`:

```latex
\subsection{Nombre del paso}
Descripción del paso.

\begin{tcolorbox}[cajaDatos]
\begin{lstlisting}[language=Python]
# código aquí
\end{lstlisting}
\end{tcolorbox}

\begin{tcolorbox}[cajaNota]
  Nota aclaratoria sobre el paso.
\end{tcolorbox}
```

4. **Conclusión** — resultado esperado y siguiente paso natural.
5. **Firma** — `\FirmaSimple`.

**Lenguajes disponibles en lstlisting:**
`Python`, `C++`, `bash`, `C`, `Java`, `JavaScript`, `SQL`, y más.

---

## Cajas disponibles

| Caja | Estilo | Uso |
|---|---|---|
| `cajaNota` | Azul, borde izquierdo | Información importante, aclaraciones |
| `cajaAlerta` | Magenta, borde izquierdo | Advertencias, riesgos |
| `cajaResultado` | AzulITM, borde izquierdo | Conclusiones, logros |
| `cajaDatos` | Fondo gris claro | Envuelve bloques de código |

---

## Numeración de documentos

Formato: `IA-AAAA-NNN`

- `IA` = Informe de Actividades
- `AAAA` = año (ej. 2025)
- `NNN` = correlativo de 3 dígitos (001, 002, ...)

Ejemplo: `IA-2025-007`

---

## Compilar

```powershell
# Desde la carpeta del .tex:
cd C:\CORIOTLAB\INFORMES\plantillas\actividades
xelatex -interaction=nonstopmode plantilla_actividades.tex
xelatex -interaction=nonstopmode plantilla_actividades.tex
```
