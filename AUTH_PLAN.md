# Comptes élèves — plan de mise en place

## Objectif

Permettre aux élèves autorisés de créer un compte et de se connecter sans exposer leurs informations personnelles. Cette étape décrit l'architecture à construire ; elle n'active pas encore de vrais comptes.

## Parcours prévu

### Inscription
1. L'élève ouvre une invitation fournie par l'établissement ou un responsable autorisé.
2. Il choisit un pseudonyme non déjà utilisé.
3. Il crée un mot de passe unique.
4. Le serveur vérifie l'invitation et les règles du compte.
5. Le serveur enregistre uniquement les données nécessaires et une empreinte sécurisée du mot de passe.

### Connexion
1. L'élève saisit son pseudonyme et son mot de passe.
2. Le serveur vérifie les identifiants.
3. Le serveur crée une session sécurisée.
4. L'élève peut se déconnecter de tous ses appareils si nécessaire.

## Données minimales

À envisager :
- identifiant interne aléatoire ;
- pseudonyme ;
- empreinte du mot de passe ;
- date de création du compte ;
- état du compte (actif, suspendu, désactivé).

Ne pas rendre publics les identifiants internes. Ne pas demander par défaut la date de naissance, l'adresse, le numéro de téléphone, la position ou l'emploi du temps. Toute donnée supplémentaire doit avoir une raison précise, une durée de conservation définie et une validation adaptée.

## Exigences techniques obligatoires

- L'authentification doit être vérifiée par le serveur, jamais uniquement par JavaScript dans le navigateur.
- Hacher les mots de passe avec Argon2id (ou une solution actuelle équivalente correctement configurée). Ne jamais les enregistrer en clair ou les envoyer dans les journaux.
- Utiliser des cookies de session HttpOnly, Secure et SameSite, avec renouvellement et expiration appropriés.
- Ajouter une limitation des tentatives de connexion et des protections contre les attaques automatisées.
- Vérifier les permissions côté serveur à chaque action sensible.
- Protéger les formulaires contre les requêtes intersites et valider toutes les entrées côté serveur.
- Ne jamais mettre de clé API, de mot de passe de base de données ou de secret dans le code front-end ou dans GitHub.
- Prévoir une procédure sûre de récupération de compte, sans révéler si un pseudonyme existe.
- Utiliser HTTPS en production et tenir les dépendances à jour.

## Règles de gestion et modération

- Définir avec l'établissement qui peut inviter, suspendre ou supprimer un compte.
- Donner aux élèves des moyens simples de signaler un contenu et de bloquer un compte.
- Limiter l'accès aux outils de modération aux personnes autorisées et conserver uniquement les traces nécessaires.
- Rédiger des règles communautaires, une politique de confidentialité et une procédure de traitement des signalements avant le lancement.
- Vérifier les obligations applicables aux services utilisés par des mineurs avec l'établissement et les responsables compétents.

## Ordre de développement

1. Valider le parcours et les données minimales avec l'établissement.
2. Choisir un hébergement serveur et une base de données adaptés.
3. Construire les routes serveur d'inscription, connexion et déconnexion.
4. Ajouter le stockage sécurisé des comptes et les sessions.
5. Ajouter les contrôles d'accès et les tests de sécurité.
6. Connecter l'interface web au serveur.
7. Tester avec des comptes fictifs avant toute utilisation réelle.

## État actuel

Le dépôt contient une maquette front-end. Il n'y a pas encore de serveur d'authentification, de base de données ni de comptes fonctionnels. Ne saisis aucun vrai mot de passe ou renseignement personnel dans la maquette actuelle.
