# みんなの裁判

## URL
  - https://minnanosaiban.github.io/hotline/

## git

```
git clone https://github.com/minnanosaiban/hotline.git
git remote set-url origin https://github.com/minnanosaiban/hotline.git
jb clean .
jb build .
ghp-import -n -p -f _build/html
git add .
git reset _build/
git commit -m "Update main branch (excluding _build/)"
git push origin main
```