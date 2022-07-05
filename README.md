# Elm workshop

## Prérequis

-   Installer Node.js version 16 ou supérieur
-   Se trouver à la racine de ce dossier

## Installation

```bash
npm install
```

## Développement local

```bash
npm run dev
```

Ouvrir http://localhost:3001/

![step0](https://user-images.githubusercontent.com/802010/177262489-8e89c01d-825e-4f90-98ae-29c52bb64d7a.png)

## IDE

-   Installer [IntelliJ IDEA Community](https://www.jetbrains.com/fr-fr/idea/download)
-   Aller dans `Preferences` > `Plugins` > `Marketplace` puis rechercher "Elm"
-   Installer le plugin Elm de Keith Lazuka
-   Aller dans `Preferences` > puis rechercher "Elm".

Dans "Language & Frameworks" cliquer sur "Elm" et cocher "Run when file saved?" :

![CleanShot 2022-07-05 at 08 26 56@2x](https://user-images.githubusercontent.com/802010/177263350-75b7a752-e3ae-4e9f-b225-8abc9f43d5b4.png)

### Tester l'installation du plugin Elm

Ajouter `test = hello` dans _src/Main.elm_ et vérifier qu'en sauvegardant les modifications :
- le code se reformate automatiquement
- `test` est grisé (non utilisé)
- `hello` est souligné en rouge (non défini)


![CleanShot 2022-07-05 at 08 36 29](https://user-images.githubusercontent.com/802010/177264972-f44dfa13-0a6e-48dd-b155-268b648ee923.gif)

### Personnaliser l'apparence

Aller dans `Preferences` > puis rechercher "appearance". Cliquer sur "Get more themes" :

![CleanShot 2022-07-05 at 08 42 11@2x](https://user-images.githubusercontent.com/802010/177265830-caab61e3-ded5-4355-a2eb-c2dc93ef0fa5.png)


## Licence

Authored by [Cédric Soulas](https://twitter.com/CedricSoulas).
