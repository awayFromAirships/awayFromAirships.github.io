#!/bin/bash

for file in articles/*.md; do
  filename="${file%.*}"
  pandoc -o "$filename.html" "$file" --template=static/template.html --mathml
done

echo "```" > "articles/index.md"
echo ""title: Index of articles""
echo "```" > "articles/index.md"
echo "" > "articles/index.md"
echo "# Index of articles" > "articles/index.md"
find articles/ -name "*.html" -type f -printf "%f\n" | while read file; do
  echo "* [${file%.html}]($file)" >> "articles/index.md"
done


pandoc -o articles/index.html articles/index.md --template=static/template.html --mathml
pandoc -o index.html index.md --template=static/template.html --mathml

git add .
git commit -m "`date +%s`"
git push
