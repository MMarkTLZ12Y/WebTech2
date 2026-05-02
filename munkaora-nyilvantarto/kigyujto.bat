@echo off
set "output=teljes_diagnosztika.txt"
echo Diagnosztikai adatok kigyűjtése... > %output%

echo ========================================== >> %output%
echo 1. KÖRNYEZETI BEÁLLÍTÁSOK (.env) >> %output%
echo ========================================== >> %output%
if exist backend\.env (
    type "backend\.env" >> %output%
) else (
    echo A .env fájl nem található! >> %output%
)

echo. >> %output%
echo ========================================== >> %output%
echo 2. BACKEND SERVER ÉS ROUTES >> %output%
echo ========================================== >> %output%
type "backend\server.js" >> %output%
echo. >> %output%
for %%f in (backend\routes\*.js) do (
    echo --- FILE: %%f --- >> %output%
    type "%%f" >> %output%
    echo. >> %output%
)

echo ========================================== >> %output%
echo 3. FRONTEND SZERVIZEK (Services) >> %output%
echo ========================================== >> %output%
for /r "frontend\src\app\services" %%f in (*.ts) do (
    echo --- FILE: %%f --- >> %output%
    type "%%f" >> %output%
    echo. >> %output%
)

echo ========================================== >> %output%
echo 4. FRONTEND KOMPONENSEK (TS ÉS HTML) >> %output%
echo ========================================== >> %output%
:: Összes TS és HTML fájl a komponensekből
for /r "frontend\src\app\components" %%f in (*.ts *.html) do (
    echo --- FILE: %%f --- >> %output%
    type "%%f" >> %output%
    echo. >> %output%
)

echo ========================================== >> %output%
echo 5. ANGULAR ALAPOK (Routes, Config) >> %output%
echo ========================================== >> %output%
if exist frontend\src\app\app.routes.ts type "frontend\src\app\app.routes.ts" >> %output%
if exist frontend\src\app\app.config.ts type "frontend\src\app\app.config.ts" >> %output%

echo KÉSZ! Küldd el a %output% tartalmát.