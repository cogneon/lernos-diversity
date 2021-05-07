set filename="LernOS-Diversity-Inclusion"
set chapters=./src/index.md ./src/1-Grundlagen.md ./src/2-Lernpfad.md ./src/3-Anhang.md

REM Create eBook Versions (epub, mobi)
echo Creating eBook versions ...
magick -density 300 %filename%.pdf[0] src/images/ebook-cover.jpg
magick mogrify -size 2500X2500 -resize 2500X2500 src/images/ebook-cover.jpg
magick mogrify -crop 1563X2500+102+0 src/images/ebook-cover.jpg
pandoc metadata.yaml -s --resource-path="./src" --epub-cover-image=src/images/ebook-cover.jpg %chapters% -o %filename%.epub
ebook-convert %filename%.epub %filename%.mobi

echo Done. Check for error messages or warnings above. 

pause