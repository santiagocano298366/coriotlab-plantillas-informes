#!/usr/bin/env bash
# =============================================================
# CORIOTLAB — Setup de fuentes y verificacion de XeLaTeX
# Uso: bash setup_coriotlab.sh
# Compatible con Linux y macOS
# =============================================================

set -euo pipefail

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FONTS="$BASE/fonts"
TMPDIR_FONTS="$(mktemp -d)"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo -e "${CYAN}=============================================${NC}"
echo -e "${CYAN}  CORIOTLAB — Configuracion del sistema${NC}"
echo -e "${CYAN}=============================================${NC}"
echo ""

# -------------------------------------------------------------
# Funcion auxiliar de descarga
# -------------------------------------------------------------
descargar_fuente() {
    local nombre="$1"
    local url="$2"
    local destino="$3"
    local zip="$TMPDIR_FONTS/${nombre}.zip"

    echo -e "  Descargando ${nombre}..."
    if curl -fsSL -o "$zip" "$url"; then
        echo -e "  Descomprimiendo ${nombre}..."
        unzip -q -o "$zip" -d "$destino"
        rm -f "$zip"
        echo -e "  ${GREEN}OK  ${nombre} instalada.${NC}"
    else
        echo -e "  ${RED}ERROR al descargar ${nombre}.${NC}"
        echo -e "  ${YELLOW}Descarga manual desde Google Fonts:${NC}"
        echo -e "  ${CYAN}$url${NC}"
    fi
}

# -------------------------------------------------------------
# 1. Verificar xelatex
# -------------------------------------------------------------
echo -e "[1/5] ${YELLOW}Verificando XeLaTeX...${NC}"

if command -v xelatex &>/dev/null; then
    echo -e "  ${GREEN}OK  xelatex encontrado: $(which xelatex)${NC}"
else
    echo -e "  ${RED}AVISO: xelatex no encontrado.${NC}"
    echo ""
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo -e "  ${YELLOW}En macOS, instala MacTeX:${NC}"
        echo -e "  ${CYAN}brew install --cask mactex-no-gui${NC}"
        echo -e "  o descarga desde: https://tug.org/mactex/"
    else
        echo -e "  ${YELLOW}En Ubuntu/Debian:${NC}"
        echo -e "  ${CYAN}sudo apt install texlive-xetex texlive-lang-spanish${NC}"
        echo ""
        echo -e "  ${YELLOW}En Arch Linux:${NC}"
        echo -e "  ${CYAN}sudo pacman -S texlive-xetex${NC}"
    fi
    echo ""
    echo -e "  Continuando con la descarga de fuentes..."
fi

# -------------------------------------------------------------
# 2. Fuente Inter
# -------------------------------------------------------------
echo ""
echo -e "[2/5] ${YELLOW}Instalando fuente Inter...${NC}"

INTER_DEST="$FONTS/Inter"
mkdir -p "$INTER_DEST"

if [ -f "$INTER_DEST/static/Inter-Regular.ttf" ]; then
    echo -e "  ${GREEN}OK  Inter ya instalada.${NC}"
else
    descargar_fuente "Inter" \
        "https://fonts.google.com/download?family=Inter" \
        "$INTER_DEST"
fi

# -------------------------------------------------------------
# 3. Fuente Museo Moderno
# -------------------------------------------------------------
echo ""
echo -e "[3/5] ${YELLOW}Instalando fuente Museo Moderno...${NC}"

MUSEO_DEST="$FONTS/MuseoModerno"
mkdir -p "$MUSEO_DEST"

if [ -f "$MUSEO_DEST/static/MuseoModerno-Regular.ttf" ]; then
    echo -e "  ${GREEN}OK  MuseoModerno ya instalada.${NC}"
else
    descargar_fuente "MuseoModerno" \
        "https://fonts.google.com/download?family=Museo+Moderno" \
        "$MUSEO_DEST"
fi

# -------------------------------------------------------------
# 4. Fuente Space Mono
# -------------------------------------------------------------
echo ""
echo -e "[4/5] ${YELLOW}Instalando fuente Space Mono...${NC}"

SPACE_DEST="$FONTS/SpaceMono"
mkdir -p "$SPACE_DEST"

if [ -f "$SPACE_DEST/SpaceMono-Regular.ttf" ]; then
    echo -e "  ${GREEN}OK  SpaceMono ya instalada.${NC}"
else
    descargar_fuente "SpaceMono" \
        "https://fonts.google.com/download?family=Space+Mono" \
        "$SPACE_DEST"

    # Mover TTFs a raiz si quedaron en subcarpeta
    find "$SPACE_DEST" -mindepth 2 -name "*.ttf" -exec mv {} "$SPACE_DEST/" \;
    find "$SPACE_DEST" -mindepth 1 -type d -empty -delete 2>/dev/null || true
fi

# -------------------------------------------------------------
# 5. Verificar estructura de carpetas
# -------------------------------------------------------------
echo ""
echo -e "[5/5] ${YELLOW}Verificando estructura de carpetas...${NC}"

CARPETAS=(
    "fonts/Inter/static"
    "fonts/MuseoModerno/static"
    "fonts/SpaceMono"
    "membretes"
    "plantilla_base"
    "informes/actividades"
    "informes/tecnicos"
    "informes/cuentas_cobro"
    "informes/memorandos"
    "informes/propuestas"
    "output/actividades"
    "output/tecnicos"
    "output/cuentas_cobro"
    "output/memorandos"
    "output/propuestas"
    "assets/imagenes"
)

for c in "${CARPETAS[@]}"; do
    ruta="$BASE/$c"
    if [ -d "$ruta" ]; then
        echo -e "  ${GREEN}OK  $c${NC}"
    else
        echo -e "  ${YELLOW}--  Creando $c${NC}"
        mkdir -p "$ruta"
    fi
done

# Limpiar temp
rm -rf "$TMPDIR_FONTS"

echo ""
echo -e "${CYAN}=============================================${NC}"
echo -e "${GREEN}  Setup completado.${NC}"
echo -e "  Compila con:"
echo -e "${CYAN}  bash compile.sh actividades${NC}"
echo -e "${CYAN}  bash compile.sh todos${NC}"
echo -e "${CYAN}=============================================${NC}"
echo ""
