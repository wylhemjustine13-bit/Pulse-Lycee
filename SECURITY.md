# Sécurité et confidentialité — Hiera Sociale

Ce document décrit les règles de conception du projet. Le site actuel est une maquette : il ne possède pas encore de serveur, de comptes réels ni de système de signalement opérationnel.

## Principes

- **Données minimales :** ne demander que les informations nécessaires. Ne jamais afficher publiquement l'adresse, le numéro de téléphone, l'emploi du temps détaillé ou les identifiants personnels d'un élève.
- **Pseudonymes :** privilégier un nom d'affichage plutôt que le nom complet.
- **Confidentialité par défaut :** les profils et publications ne doivent pas être indexés publiquement par les moteurs de recherche.
- **Protection des comptes :** utiliser une authentification côté serveur, des mots de passe hachés avec un algorithme adapté, des sessions sécurisées et une limitation des tentatives de connexion. Ne jamais stocker de mot de passe en clair ni une clé secrète dans le code du navigateur.
- **Sécurité des contenus :** valider les données côté serveur, encoder les contenus affichés et limiter les types et tailles de fichiers téléversés.
- **Modération :** prévoir le signalement, le blocage, la suppression de contenu et une procédure d'examen par des modérateurs autorisés.
- **Messagerie :** ne l'activer qu'avec des règles de confidentialité, des outils de blocage et de signalement, et une modération adaptée.
- **Mineurs :** expliquer clairement les règles, limiter la collecte de données et prévoir la supervision appropriée de l'établissement et des responsables légaux lorsque nécessaire.

## Avant toute utilisation réelle

1. Choisir qui peut créer un compte et comment vérifier l'appartenance à l'établissement sans collecter de justificatifs excessifs.
2. Mettre en place un serveur et une base de données avec des droits d'accès stricts.
3. Ajouter une politique de confidentialité et des règles communautaires compréhensibles.
4. Tester l'inscription, la connexion, la récupération de compte, les permissions et les signalements.
5. Prévoir une personne responsable de la modération et une procédure pour les contenus préoccupants.
6. Faire vérifier le dispositif par l'établissement et respecter les règles applicables à la protection des données des mineurs.

## État actuel de la maquette

Les publications, réactions et signalements visibles dans la page sont des démonstrations locales. Ils ne sont ni envoyés à un serveur, ni conservés de façon fiable, ni transmis à l'établissement. Ne pas utiliser cette maquette pour publier de vraies informations personnelles.

Pour signaler une faille dans le code du projet, ouvre une issue privée si le dépôt le permet, ou contacte directement le responsable du dépôt sans publier de données personnelles.
