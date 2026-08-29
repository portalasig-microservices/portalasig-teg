#!/usr/bin/env bash
# Recompila la tesis y republica el PDF en GitHub Pages (docs/).
# Uso: bash teg/deploy-web.sh
set -e
cd "$(dirname "$0")"
pdflatex -interaction=nonstopmode main.tex >/dev/null
bibtex main >/dev/null
pdflatex -interaction=nonstopmode main.tex >/dev/null
pdflatex -interaction=nonstopmode main.tex >/dev/null
cp main.pdf ../docs/tesis-portalasig.pdf
cd ..
git add docs/tesis-portalasig.pdf teg/main.pdf
git commit -m "docs: actualiza PDF publicado $(date +%F)" || echo "sin cambios"
git pull --rebase
git push
echo "✔ Publicado: https://portalasig-microservices.github.io/portalasig-teg/"
