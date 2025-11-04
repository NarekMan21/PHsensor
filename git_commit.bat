@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo "# PHsensor" >> README.md
if exist .git rmdir /s /q .git
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/NarekMan21/PHsensor.git
git push -u origin main --force
git add index.html esp8266*.txt .gitignore .github/
git commit -m "Add ESP8266 code, web interface and GitHub Pages deployment"
git push origin main
pause

