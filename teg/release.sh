#!/usr/bin/env bash
# Compila la tesis y publica una nueva iteración como GitHub Release (v1, v2, ...).
# Adjunta el PDF versionado como asset descargable (repo público: sin login).
# Uso: bash teg/release.sh
set -e
cd "$(dirname "$0")/.."   # raíz del repo (este script vive en teg/)

echo "==> Compilando..."
cd teg
pdflatex -interaction=nonstopmode main.tex >/dev/null
bibtex main >/dev/null
pdflatex -interaction=nonstopmode main.tex >/dev/null
pdflatex -interaction=nonstopmode main.tex >/dev/null
cd ..

echo "==> Calculando próxima versión..."
last=$(git tag -l 'v[0-9]*' | sort -V | tail -1)
if [ -z "$last" ]; then n=1; else n=$(( ${last#v} + 1 )); fi
tag="v$n"
echo "    última: ${last:-ninguna} → nueva: $tag"

echo "==> Sincronizando PDFs (repo + docs/ para Pages)..."
cp teg/main.pdf docs/tesis-portalasig.pdf
git add teg/main.pdf docs/tesis-portalasig.pdf
git diff --cached --quiet || git commit -m "release: $tag"
git pull --rebase
git push

echo "==> Creando GitHub Release $tag..."
cp teg/main.pdf "/tmp/tesis-portalasig-$tag.pdf"
if [ -n "$last" ]; then
  cambios=$(git log --oneline "$last..HEAD" | sed 's/^/- /')
else
  cambios="- Primera iteración publicada"
fi
gh release create "$tag" "/tmp/tesis-portalasig-$tag.pdf" \
  --title "Tesis $tag" \
  --notes "Iteración $tag del documento ($(date +%d-%m-%Y)).

Cambios desde ${last:-el inicio}:
$cambios"

echo "✔ Release: https://github.com/portalasig-microservices/portalasig-teg/releases/tag/$tag"
