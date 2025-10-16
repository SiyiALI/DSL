# Cartographie de l’existant et originalité

| **Name**          | **Category**                     | **Lang / Runtime**                         | **License** | **Game Families**                   | **Rules expressivity** *(état / hasard / info cachée)*               | **Variability** *(compile / run)*     | **Interop** *(formats / protocoles)*               | **Maturity & activity**                               | **URL**                                                                      |
| ----------------- | -------------------------------- | ------------------------------------------ | ----------- | ----------------------------------- | -------------------------------------------------------------------- | ------------------------------------- | -------------------------------------------------- | ----------------------------------------------------- | ---------------------------------------------------------------------------- |
| **Boardgame DSL** | DSL / UI / Interop               | JavaScript + Haskell *(boardgame library)* | Open source | Jeux de plateau                     | Moyenne *(état, règles)*                                             | Moyenne *(via paramètres)*            | Oui *(format de partie)*                           | Peu mature *(<100 commits, dernière activité : 2021)* | [boardgame-dsl.github.io](https://boardgame-dsl.github.io/)                  |
| **Ludii**         | DSL / Engine / Tool              | Java / C++                                 | Open source | Jeux de plateau / cartes            | Très riche *(état, hasard, info cachée)*                             | Élevée *(via le Ludeme language)*     | Oui *(formats d’état/coup propres)*                | Mature et active                                      | [ludii.games](https://ludii.games/index.php)                                 |
| **Stratega**      | Cadre IA / Tool                  | C++                                        | Open source | Jeux de stratégie / RTS             | Riche *(état, IA, règles)*                                           | Moyenne *(via configuration)*         | Non *(cible IA uniquement)*                        | Actif                                                 | [github.com/GAIGResearch/Stratega](https://github.com/GAIGResearch/Stratega) |
| **Phaser**        | UI / Framework                   | JavaScript                                 | Proprietary | Arcade 2D, jeux de plateau / cartes | Faible *(centré sur le rendu)*                                       | Faible *(pour les mécaniques de jeu)* | Non *(cible de compilation graphique)*             | Très mature *(20 000+ commits, activité : mai 2025)*  | [phaser.io](https://phaser.io/)                                              |

---

## Note d’originalité

Notre DSL s’inspire d’outils existants comme **Ludii**, mais adopte une approche **beaucoup plus ciblée**.
Nous nous concentrons uniquement sur les **jeux de course à pions sur cases**, où le but est d’être le premier à atteindre la fin du parcours.

Cette spécialisation permet :

* un métamodèle simple et optimisé, adapté à ce type de mécanique *(cases spéciales, sauts, retours, zones de départ/arrivée, etc.)* ;
* une variabilité intégrée, permettant de définir différentes versions d’un même jeu — à la configuration ou à l’exécution *(effets de cases, contraintes de déplacement, presets de variantes, etc.)* ;
* la création de services génériques : génération automatique de coups légaux, export de parties, comparaison de variantes, etc.
