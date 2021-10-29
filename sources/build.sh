#!/bin/sh
set -e

# Build with gftools builder
gftools builder sources/builder.yaml

# Slice into Roman and Italic VF (as Google Fonts currently doesn't support slnt or ital axes)
fonttools varLib.instancer "fonts/variable/Nunito[ital,wght].ttf" ital=0 wght=200:1000 --update-name-table -o "fonts/variable//Nunito[wght].ttf"
fonttools varLib.instancer "fonts/variable/Nunito[ital,wght].ttf" ital=1 wght=200:1000 --update-name-table -o "fonts/variable/Nunito-Italic[wght].ttf"

# Fix Italic bits
python3 sources/fix.py

# Remove original
rm "fonts/variable/Nunito[ital,wght].ttf"
