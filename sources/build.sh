#!/bin/sh
set -e

# Build static instances
TTFDIR=../fonts/TTF
mkdir -p $TTFDIR
rm -rf $TTFDIR/*.ttf
fontmake -g "./Nunito.glyphs" -o ttf -i --output-dir $TTFDIR -a
for f in $TTFDIR/*.ttf
do
	echo Processing $f
	gftools fix-dsig --autofix $f
	ttfautohint $f $f.fix
	mv $f.fix $f
	gftools fix-hinting $f
	mv $f.fix $f
done


## Not implemented yet:

# # Build variable font
# VFDIR=../Fonts/ttf-variable
# mkdir -p $VFDIR
# rm -rf $VFDIR/*.ttf
# VF_FILENAME="$VFDIR/Petrona[wght].ttf"
# fontmake -g "./Sources/Petrona-ROMAN-MASTER.glyphs" -o variable --output-path $VF_FILENAME
# gftools fix-dsig --autofix $VF_FILENAME
# gftools fix-nonhinting $VF_FILENAME
# mv $VF_FILENAME.fix $VF_FILENAME

# VF_FILENAME="$VFDIR/Petrona-Italic[wght].ttf"
# fontmake -g "./Sources/Petrona-ITALIC-MASTER.glyphs" -o variable --output-path $VF_FILENAME
# gftools fix-dsig --autofix $VF_FILENAME
# gftools fix-nonhinting $VF_FILENAME
# mv $VF_FILENAME.fix $VF_FILENAME

# Clean up
rm -rf master_ufo/ instance_ufo/
