import glob
from fontTools.ttLib import TTFont
from fontbakery.constants import (
    MacStyle,
    FsSelection,
)


if __name__ == "__main__":

    for font_path in glob.glob("fonts/variable/*Italic*.ttf"):
        # set windows subfamily name to Italic in name table
        # For Urbanist-Italic, set ttFont["head"].macStyle = MacStyle.ITALIC
        # Change OS/2.fsSelection to 0x0081
        with open(font_path, "rb") as f:
            print("Fix italic naming in {}".format(font_path))
            ttFont = TTFont(f)
            ttFont["head"].macStyle = MacStyle.ITALIC
            ttFont["OS/2"].fsSelection = FsSelection.USETYPOMETRICS | FsSelection.ITALIC
            ttFont.save(font_path)
