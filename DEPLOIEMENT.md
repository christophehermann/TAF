# 🚀 Déploiement TAF Congés & RTT sur Firebase Hosting

## 📁 Contenu du package

```
taf-deploy/
├── firebase.json       # Configuration Firebase Hosting
├── public/
│   ├── index.html      # App principale (gestion complète)
│   └── formulaire.html # Formulaire collaborateurs
└── DEPLOIEMENT.md      # Ce fichier
```

## 🔧 Prérequis

1. **Node.js** installé (https://nodejs.org)
2. **Firebase CLI** installé :
   ```bash
   npm install -g firebase-tools
   ```

## 📤 Étapes de déploiement

### 1. Se connecter à Firebase
```bash
firebase login
```

### 2. Initialiser le projet (dans le dossier taf-deploy)
```bash
cd taf-deploy
firebase use rtt-cp
```

### 3. Déployer !
```bash
firebase deploy --only hosting
```

## 🌐 URLs après déploiement

Une fois déployé, tes applications seront accessibles à :

| Application | URL |
|-------------|-----|
| **App principale** | https://rtt-cp.web.app |
| **Formulaire collaborateurs** | https://rtt-cp.web.app/formulaire.html |

## 📧 Partager avec l'équipe

Tu peux maintenant envoyer ces liens à tes collaborateurs :

**Email type :**
```
Bonjour,

Pour soumettre vos demandes de congés et RTT, utilisez ce formulaire en ligne :
👉 https://rtt-cp.web.app/formulaire.html

Vos demandes seront automatiquement enregistrées et transmises pour validation.

Cordialement,
La Direction
```

## 🔄 Mise à jour

Pour mettre à jour l'application après modifications :
```bash
firebase deploy --only hosting
```

## ❓ Problèmes courants

### "Permission denied"
→ Vérifie que tu es bien connecté : `firebase login`

### "Project not found"
→ Vérifie l'ID du projet : `firebase projects:list`

### Les données ne s'affichent pas
→ Vérifie que Firestore est activé dans la console Firebase

---

📞 Support : En cas de problème, vérifiez la console Firebase sur https://console.firebase.google.com
