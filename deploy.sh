#!/bin/bash
# ═══════════════════════════════════════════════════════════════
#  🚀 TAF TRANS - Script de déploiement Firebase
# ═══════════════════════════════════════════════════════════════

echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║  🚀 TAF TRANS - Déploiement Firebase Hosting              ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# Vérifier Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js n'est pas installé."
    echo "   Télécharge-le sur: https://nodejs.org"
    exit 1
fi
echo "✅ Node.js détecté: $(node -v)"

# Vérifier/Installer Firebase CLI
if ! command -v firebase &> /dev/null; then
    echo "📦 Installation de Firebase CLI..."
    npm install -g firebase-tools
fi
echo "✅ Firebase CLI détecté: $(firebase --version)"

# Connexion Firebase
echo ""
echo "🔐 Connexion à Firebase (une fenêtre va s'ouvrir dans ton navigateur)..."
firebase login

# Vérifier la connexion
if [ $? -ne 0 ]; then
    echo "❌ Échec de la connexion Firebase"
    exit 1
fi
echo "✅ Connecté à Firebase"

# Lier au projet rtt-cp
echo ""
echo "🔗 Liaison au projet rtt-cp..."
firebase use rtt-cp

# Déployer
echo ""
echo "📤 Déploiement en cours..."
firebase deploy --only hosting

# Résultat
if [ $? -eq 0 ]; then
    echo ""
    echo "╔═══════════════════════════════════════════════════════════╗"
    echo "║  ✅ DÉPLOIEMENT RÉUSSI !                                  ║"
    echo "╠═══════════════════════════════════════════════════════════╣"
    echo "║                                                           ║"
    echo "║  🏠 App principale:                                       ║"
    echo "║     https://rtt-cp.web.app                                ║"
    echo "║                                                           ║"
    echo "║  📝 Formulaire collaborateurs:                            ║"
    echo "║     https://rtt-cp.web.app/formulaire.html                ║"
    echo "║                                                           ║"
    echo "╚═══════════════════════════════════════════════════════════╝"
    echo ""
else
    echo "❌ Erreur lors du déploiement"
    exit 1
fi
