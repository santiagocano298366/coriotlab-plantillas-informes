#!/usr/bin/env bash
# =============================================================
# CORIOTLAB — Script de compilacion XeLaTeX
# Uso: bash compile.sh [tipo]
# Tipos: actividades | tecnicos | cuentas_cobro | memorandos | propuestas | todos
# =============================================================

set -uo pipefail

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
GRAY='\033[0;37m'
NC='\033[0m'

TIPO="${1:-todos}"

declare -A TEX_FILES=(
    ["actividades"]="informes/actividades/informe_actividades.tex"
    ["tecnicos"]="informes/tecnicos/informe_tecnico.tex"
    ["cuentas_cobro"]="informes/cuentas_cobro/cuenta_cobro.tex"
    ["memorandos"]="informes/memorandos/memorando.tex"
    ["propuestas"]="informes/propuestas/propuesta_proyecto.tex"
)

declare -A OUT_DIRS=(
    ["actividades"]="output/actividades"
    ["tecnicos"]="output/tecnicos"
    ["cuentas_cobro"]="output/cuentas_cobro"
    ["memorandos"]="output/memorandos"
    ["propuestas"]="output/propuestas"
)

AUX_EXTS=("*.aux" "*.log" "*.out" "*.toc" "*.lof" "*.lot" "*.synctex.gz" "*.fls" "*.fdb_latexmk" "*.xdv")

compilar_documento() {
    local tipo="$1"
    local tex_rel="${TEX_FILES[$tipo]}"
    local out_rel="${OUT_DIRS[$tipo]}"

    local tex_path="$BASE/$tex_rel"
    local tex_dir
    tex_dir="$(dirname "$tex_path")"
    local tex_file
    tex_file="$(basename "$tex_path")"
    local pdf_name="${tex_file%.tex}.pdf"
    local out_dir="$BASE/$out_rel"

    echo ""
    echo -e "  ${YELLOW}Compilando: $tipo${NC}"
    echo -e "  ${GRAY}Archivo: $tex_path${NC}"

    if [ ! -f "$tex_path" ]; then
        echo -e "  ${RED}ERROR: Archivo no encontrado: $tex_path${NC}"
        return 1
    fi

    pushd "$tex_dir" > /dev/null

    # Primera pasada
    if xelatex -interaction=nonstopmode -halt-on-error "$tex_file" > /dev/null 2>&1; then
        # Segunda pasada (TOC y referencias cruzadas)
        if xelatex -interaction=nonstopmode -halt-on-error "$tex_file" > /dev/null 2>&1; then
            mkdir -p "$out_dir"
            cp "$pdf_name" "$out_dir/$pdf_name"
            echo -e "  ${GREEN}OK  PDF generado: $out_rel/$pdf_name${NC}"

            # Limpiar auxiliares
            for ext in "${AUX_EXTS[@]}"; do
                rm -f $ext 2>/dev/null || true
            done
            echo -e "  ${GRAY}OK  Auxiliares eliminados.${NC}"
        else
            echo -e "  ${RED}ERROR en segunda pasada de $tipo.${NC}"
            echo -e "  ${YELLOW}Revisa: $tex_dir/${tex_file%.tex}.log${NC}"
        fi
    else
        echo -e "  ${RED}ERROR en primera pasada de $tipo.${NC}"
        echo -e "  ${YELLOW}Revisa: $tex_dir/${tex_file%.tex}.log${NC}"
    fi

    popd > /dev/null
}

# -------------------------------------------------------------
# Ejecucion
# -------------------------------------------------------------
echo ""
echo -e "${CYAN}=============================================${NC}"
echo -e "${CYAN}  CORIOTLAB — Compilador de documentos${NC}"
echo -e "${CYAN}  Tipo: $TIPO${NC}"
echo -e "${CYAN}=============================================${NC}"

TIPOS_VALIDOS=("actividades" "tecnicos" "cuentas_cobro" "memorandos" "propuestas" "todos")
VALIDO=false
for t in "${TIPOS_VALIDOS[@]}"; do
    [ "$TIPO" = "$t" ] && VALIDO=true && break
done

if [ "$VALIDO" = false ]; then
    echo -e "${RED}ERROR: Tipo invalido '$TIPO'.${NC}"
    echo -e "Uso: bash compile.sh [actividades|tecnicos|cuentas_cobro|memorandos|propuestas|todos]"
    exit 1
fi

if [ "$TIPO" = "todos" ]; then
    for tipo in actividades tecnicos cuentas_cobro memorandos propuestas; do
        compilar_documento "$tipo"
    done
else
    compilar_documento "$TIPO"
fi

echo ""
echo -e "${CYAN}=============================================${NC}"
echo -e "${GREEN}  Compilacion finalizada.${NC}"
echo -e "  PDFs disponibles en: output/"
echo -e "${CYAN}=============================================${NC}"
echo ""
