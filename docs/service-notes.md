# Services

### Légalité & coups

Le DSL décrit entièrement les règles du jeu (déplacements, effets de cases, conditions de victoire). Il doit permettre de vérifier si une action est permise, de détecter la fin de partie et de générer un court texte explicatif du résultat d’un coup. Les variantes de règles (overflow, nombre de dés, cases spéciales) sont explicitement modélisées pour garantir cette validité.

### Complexité

Le DSL expose les paramètres du plateau et des dés pour analyser le branching factor et la profondeur moyenne d’une partie. La taille de l’espace de jeu est bornée par le nombre de joueurs, de cases et de dés, ce qui permet d’évaluer la résolvabilité et la complexité combinatoire des variantes. Chaque configuration peut ainsi être comparée pour étude ou génération automatique.

### Mode texte

*TODO*

### Graphique / UI / Skin

Le DSL contient un bloc `ui` et un bloc `layout` pour gérer l’apparence du plateau et les thèmes visuels (bright/dark). Les positions et chemins des cases sont explicitement modélisés pour un rendu graphique fidèle. Chaque variante peut être visualisée avec différents skins et layouts sans modifier les règles.

### IA basique

Le DSL permet de dériver facilement un adversaire naïf, qui joue soit aléatoirement, soit selon une heuristique simple (ex. avancer le pion le plus proche de la victoire). Les paramètres du plateau et les effets de cases sont accessibles pour guider cette IA.

### LLM

Le DSL permet de représenter toute variante de jeu sous forme textuelle structurée. Cela facilite l’intégration avec un LLM, capable de "jouer" à n’importe quelle variante, comprendre les règles et proposer des coups explicites.
