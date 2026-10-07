#!/usr/bin/env bash
# Instala en Claude Code las skills de una persona (generales + especificas).
# Uso:  ./instalar.sh kimberly-chocano | carolina-valbuena | lina-lancheros | melanny-duque | natalia-ortiz | isabel-rosales | diana-salazar | natalia-jimenez | camilo-rodriguez
set -euo pipefail
persona="${1:-}"
case "$persona" in
  kimberly-chocano|carolina-valbuena|lina-lancheros|melanny-duque|natalia-ortiz|isabel-rosales|diana-salazar|natalia-jimenez|camilo-rodriguez) ;;
  *) echo "Uso: ./instalar.sh kimberly-chocano | carolina-valbuena | lina-lancheros | melanny-duque | natalia-ortiz | isabel-rosales | diana-salazar | natalia-jimenez | camilo-rodriguez" >&2; exit 1 ;;
esac
raiz="$(cd "$(dirname "$0")" && pwd)"
destino="$HOME/.claude/skills"
mkdir -p "$destino"
n=0
for grupo in generales especificas; do
  for dir in "$raiz/$persona/$grupo"/*/; do
    nombre="$(basename "$dir")"
    mkdir -p "$destino/$nombre"
    cp -R "$dir." "$destino/$nombre/"
    n=$((n + 1))
  done
done
echo "Listo: $n skills instaladas en $destino. Reinicia Claude Code para que las cargue."
