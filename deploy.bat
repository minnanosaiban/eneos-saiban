@echo off
setlocal

rem --- メモ（初回設定やコマンド確認用） ---
rem pip install jupyter-book ghp-import
rem git clone https://github.com/minnanosaiban/eneos-saiban.git
rem git remote set-url origin https://github.com/minnanosaiban/eneos-saiban.git
rem --------------------------------------

echo === Jupyter Book Build and Deploy ===
cd /d "%~dp0"

echo === Check Current Directory ===
echo Current: %CD%

echo === Clean and Build ===
jb clean .
jb build .
if %errorlevel% neq 0 (
    echo Build failed.
    pause
    exit /b
)

echo === Deploy to gh-pages ===
rem _build/html の内容を gh-pages ブランチに反映
ghp-import -n -p -f _build/html
if %errorlevel% neq 0 (
    echo Deploy failed.
    pause
    exit /b
)

echo === Commit ^& Push to main ===
git add .
git reset _build/ >nul 2>&1
git commit -m "Update main branch (excluding _build/)" || echo No changes to commit
git push origin main --force

echo === Done ===
pause