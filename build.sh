TTFDIR=./fonts/TTF
# VFDIR=./Fonts/ttf-variable
mkdir -p $TTFDIR
# mkdir -p $VFDIR
rm -r $TTFDIR/*.ttf
# rm -r $VFDIR/*.ttf

# Build static instances
fontmake -g "./sources/Nunito.glyphs" -o ttf -i --output-dir $TTFDIR -a
# fontmake -g "./Sources/Petrona-ITALIC-MASTER.glyphs" -o ttf -i --output-dir $TTFDIR -a
for f in $TTFDIR/*.ttf
do
	echo Processing $f
	gftools fix-dsig --autofix $f
	gftools fix-hinting $f
	mv $f.fix $f
done

# set -e
# # Build variable font
# VF_FILENAME="$VFDIR/Petrona[wght].ttf"
# fontmake -g "./Sources/Petrona-ROMAN-MASTER.glyphs" -o variable --output-path $VF_FILENAME
# gftools fix-dsig --autofix $VF_FILENAME
# ttfautohint $VF_FILENAME $VF_FILENAME.fix
# mv $VF_FILENAME.fix $VF_FILENAME
# gftools fix-hinting $VF_FILENAME
# mv $VF_FILENAME.fix $VF_FILENAME

# VF_FILENAME="$VFDIR/Petrona-Italic[wght].ttf"
# fontmake -g "./Sources/Petrona-ITALIC-MASTER.glyphs" -o variable --output-path $VF_FILENAME
# gftools fix-dsig --autofix $VF_FILENAME
# ttfautohint $VF_FILENAME $VF_FILENAME.fix
# mv $VF_FILENAME.fix $VF_FILENAME
# gftools fix-hinting $VF_FILENAME
# mv $VF_FILENAME.fix $VF_FILENAME

# Clean up
rm -r instance_ufo
rm -r master_ufo
