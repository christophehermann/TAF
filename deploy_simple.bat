@echo off
title TAF TRANS - Deploiement Firebase
cls

echo.
echo ========================================================
echo    TAF TRANS - Deploiement Firebase Hosting
echo ========================================================
echo.

REM Verifier Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERREUR] Node.js n'est pas installe.
    echo          Telecharge-le sur: https://nodejs.org
    echo.
    pause
    exit /b 1
)
echo [OK] Node.js detecte

REM Verifier Firebase CLI
where firebase >nul 2>nul
if %errorlevel% neq 0 (
    echo.
    echo [INFO] Installation de Firebase CLI...
    echo        Cela peut prendre quelques minutes...
    echo.
    call npm install -g firebase-tools
    if %errorlevel% neq 0 (
        echo [ERREUR] Installation Firebase CLI echouee
        pause
        exit /b 1
    )
)
echo [OK] Firebase CLI detecte

REM Connexion Firebase
echo.
echo ========================================================
echo    CONNEXION FIREBASE
echo ========================================================
echo.
echo Une fenetre va s'ouvrir dans ton navigateur.
echo Connecte-toi avec ton compte Google.
echo.
pause

call firebase login
if %errorlevel% neq 0 (
    echo [ERREUR] Connexion Firebase echouee
    pause
    exit /b 1
)
echo [OK] Connecte a Firebase

REM Lier au projet
echo.
echo [INFO] Liaison au projet rtt-cp...
call firebase use rtt-cp
if %errorlevel% neq 0 (
    echo [ERREUR] Projet rtt-cp non trouve
    echo          Verifie que tu as acces au projet Firebase
    pause
    exit /b 1
)
echo [OK] Projet rtt-cp selectionne

REM Deployer
echo.
echo ========================================================
echo    DEPLOIEMENT EN COURS...
echo ========================================================
echo.
call firebase deploy --only hosting

if %errorlevel% equ 0 (
    echo.
    echo ========================================================
    echo    DEPLOIEMENT REUSSI !
    echo ========================================================
    echo.
    echo    App principale:
    echo    https://rtt-cp.web.app
    echo.
    echo    Formulaire collaborateurs:
    echo    https://rtt-cp.web.app/formulaire.html
    echo.
    echo ========================================================
) else (
    echo.
    echo [ERREUR] Le deploiement a echoue
    echo          Verifie les messages ci-dessus
)

echo.
pause
