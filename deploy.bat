@echo off
chcp 65001 >nul
cls
echo.
echo ╔═══════════════════════════════════════════════════════════╗
echo ║  🚀 TAF TRANS - Déploiement Firebase Hosting              ║
echo ╚═══════════════════════════════════════════════════════════╝
echo.

:: Vérifier Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Node.js n'est pas installé.
    echo    Télécharge-le sur: https://nodejs.org
    pause
    exit /b 1
)
echo ✅ Node.js détecté

:: Vérifier/Installer Firebase CLI
where firebase >nul 2>nul
if %errorlevel% neq 0 (
    echo 📦 Installation de Firebase CLI...
    call npm install -g firebase-tools
)
echo ✅ Firebase CLI détecté

:: Connexion Firebase
echo.
echo 🔐 Connexion à Firebase...
echo    Une fenêtre va s'ouvrir dans ton navigateur.
echo.
call firebase login

:: Lier au projet
echo.
echo 🔗 Liaison au projet rtt-cp...
call firebase use rtt-cp

:: Déployer
echo.
echo 📤 Déploiement en cours...
call firebase deploy --only hosting

if %errorlevel% equ 0 (
    echo.
    echo ╔═══════════════════════════════════════════════════════════╗
    echo ║  ✅ DÉPLOIEMENT RÉUSSI !                                  ║
    echo ╠═══════════════════════════════════════════════════════════╣
    echo ║                                                           ║
    echo ║  🏠 App principale:                                       ║
    echo ║     https://rtt-cp.web.app                                ║
    echo ║                                                           ║
    echo ║  📝 Formulaire collaborateurs:                            ║
    echo ║     https://rtt-cp.web.app/formulaire.html                ║
    echo ║                                                           ║
    echo ╚═══════════════════════════════════════════════════════════╝
) else (
    echo ❌ Erreur lors du déploiement
)

echo.
pause
