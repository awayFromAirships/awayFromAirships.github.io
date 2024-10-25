
# Personal website

## how to import an article and generate index

Drop the md file at the articles folder, and then run:
```
pandoc -o articles/output.html articles/input.md --template=static/template.html
```

