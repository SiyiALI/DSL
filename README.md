# BoardRace DSL

## 1. Sous-domaine et périmètre

**Sous-domaine :** DSL pour jeux de plateau à cases

**Périmètre :**  
Notre projet se concentre sur les jeux de plateau à cases du type « course jusqu’à l’arrivée », où chaque joueur déplace un ou plusieurs pions sur un parcours défini pour tenter d’atteindre la case finale avant les autres. Ces jeux se jouent à tour de rôle, avec information parfaite, et comportent souvent un élément de hasard (comme un lancer de dés ou une pioche de carte).  

Le plateau est composé de cases discrètes, disposées de manière linéaire, circulaire ou en grille, et chaque case est identifiable et configurable. Chaque joueur commence avec un ou plusieurs pions dont les positions initiales peuvent être définies à l’avance. Certaines cases ont des effets particuliers pouvant influencer la partie : faire avancer ou reculer un pion, rejouer, bloquer un adversaire, ou encore offrir un bonus.  

Les jeux ciblés incluent des classiques comme le **Jeu de l’Oie** ou **Les Petits Chevaux**, ainsi que d’autres variantes reposant sur le même principe de course à pions.  

**Exclusions (hors périmètre) :**  
- Jeux à information cachée (cartes, bluff)  
- Jeux 2D/3D  
- Jeux sans chemin défini ou à déplacement libre (échecs, dames, go)  

**Justification :**  
Ce sous-domaine est limité mais riche. La structure du plateau et les mécaniques de jeu sont simples et bien définies, ce qui rend la modélisation en langage textuel intuitive. En revanche, la diversité des formes de plateau, des effets des cases, du nombre de dés ou des conditions de victoire permet de tester plusieurs variantes, analyser des règles, générer de nouveaux jeux ou étudier des stratégies d’IA.

---

## 2. Structure du projet

```
DSL/
├── README.md
├── docs/
│   ├── metamodel-vs-ast.md
│   ├── service-notes.md
│   ├── state-of-the-art.md
│   └── variability.md
├── examples/
│   ├── variant1/
│   │   ├── program.br
│   │   └── NOTES.md
│   ├── variant2/
│   │   ├── program.br
│   │   └── NOTES.md
│   ├── variant3/
│   │   ├── program.br
│   │   └── NOTES.md
│   ├── variant4/
│   │   ├── preview/
│   │   │   └── mockup.png
│   │   ├── program.br
│   │   └── NOTES.md
│   └── variant5/
│       ├── program.br
│       └── NOTES.md
├── lang/
│   ├── generated/
│   │   ├── ast.ts
│   │   ├── grammar.ts
│   │   └── module.ts
│   ├── board-race-module.ts
│   ├── board-race-validator.ts
│   ├── board-race.langium
│   └── index.ts
├── model/
│   ├── metamodel.png
│   └── metamodel.puml
├── src/
│   └── language/
│       └── validation.ts
└── package.json
````

Depuis la racine du projet:
- Les 5 exemples se trouvent dans le dossier `examples`.
- Les validations se trouvent dans le fichier `src/language/validations.ts`
- Les notes de variabilité se trouvent dans le fichier `docs/variability.md`

### Instructions

Conmpiler le projet:

```
npm run langium:generator
```