#!/bin/sh
# Make all themes given on the command line (or if no themes are
# given, make all themes in _themes/)

if [ $# -gt 0 ]; then
    themes=$@
else
    themes="ADCtheme agni agogo basic basicstrap bloodish bootstrap cbc classy cloud default epub fenics fenics_minimal1 fenics_minimal2 flask haiku impressjs jal nature pylons pyramid read_the_docs redcloud scipy_lectures scrolls slim-agogo solarized sphinxdoc traditional uio vlinux-theme default"
fi

for theme in $themes; do
    echo "building theme $theme..."
    doconce subst -m "^html_theme =.*$" "html_theme = '$theme'" conf.py
    make clean
    make html
    mv -f _build/html sphinx-$theme
done
echo
echo "Here are the built themes:"
ls -d sphinx-*
echo "for i in sphinx-*; do google-chrome $i/index.html; done"

