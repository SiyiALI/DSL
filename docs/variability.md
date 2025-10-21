# Variabilité — DSL *BoardRace*

## 1. Liste des paramètres

| Nom du paramètre         | Élément concerné | Type               | Domaine / valeurs possibles              | CT / RT | Valeur par défaut | Contraintes                      |
| ------------------------ | ---------------- | ------------------ | ---------------------------------------- | ------- | ----------------- | -------------------------------- |
| `players`                | Game → Players   | Liste de `Player`  | 2–6 joueurs                              | **CT**  | 2                 |       |
| `color`                  | Player           | String             | `"red"`, `"blue"`, `"green"`, etc.       | RT      | auto              | Doit être unique entre joueurs   |
| `cells`                  | Board            | Int                | ≥ 5                                      | **CT**  | 63                | Fixe la taille du plateau        |
| `specials`               | Board            | Liste<SpecialCell> | effets (`jump`, `lose`, `repeat`, `win`) | **CT**  | —                 | Index distincts                  |
| `goose`                  | Board            | Liste<int>         | n≥1 indices de cases                     | **CT**  | —                 | Aucun doublon                    |
| `dice`                   | Rules            | Dice               | `faces=INT` ou `count d faces`           | **CT**  | `1d6`             | Faces ≥ 2                        |
| `overflow`               | Rules            | Overflow           | `bounce`, `exact`, `stop`                | **CT**  | `stop`            | Affecte la condition de victoire |
| `pathType`               | Layout           | PathType           | `snake`, `spiral`                        | **CT**  | `snake`           | Détermine le parcours de rendu   |
| `uiTheme`                | UI               | UITheme            | `bright`, `dark`                         | **RT**  | `bright`          |       |

---

## 2. Presets (combinaisons typiques CT)

| Description                                                     | Paramètres clés                                              |
| --------------------------------------------------------------- | ------------------------------------------------------------ |
| Jeu de l’oie traditionnel à 63 cases, dé à 6 faces, sans rebond | `cells=63`, `dice=1d6`, `overflow=stop`, `pathType=snake`    |
| Variante plus imprévisible avec rebond sur dépassement          | `cells=50`, `dice=1d8`, `overflow=bounce`, `pathType=spiral` |
| Partie rapide, petit plateau et règles allégées                 | `cells=30`, `dice=1d4`, `overflow=exact`, `pathType=snake`   |

---

## 3. Scénarios d’usage

### **Scénario 1**

**Paramètres CT :**

* `cells=63`
* `dice=2d4` → modifie la distribution des tirages (totaux plus centrés). (2 dés à 4 faces)
* `overflow=bounce` → le pion rebondit lorsqu’il dépasse la case finale.
* `pathType='snake'` → disposition classique.
* `specials` (jump, lose, repeat, move, win) définissent des mécaniques structurelles figées.
* `goose` sur de nombreuses positions : bonus de déplacement multiples.

**Paramètres RT :**

* `uiTheme='bright'`
* `color` des joueurs (`pink`, `blue`, `purple`)

**Effet :**
Jeu long et stratégique où la chance moyenne des dés (2d4) rend les déplacements plus prévisibles, mais le rebond (`bounce`) crée des retours imprévus en fin de partie. Les nombreuses cases "oie" accélèrent temporairement le rythme, compensant la lenteur moyenne des dés.

**Impact CT :**
* Structure du plateau riche et figée (63 cases, nombreux effets).
* Règle de rebond intégrée dans la logique interne du moteur (spécialisation structurelle).
* Spécialisation du dé et de la condition de victoire.

**Impact RT :**
* Thème lumineux et contrasté adapté aux longues sessions.
* Personnalisation visuelle des pions (clarté, différenciation).


### **Scénario 2**

**Paramètres CT :**

* `cells=45` → plateau plus court.
* Groupes d’oies denses (`goose` : 5–6, 12–14, 25–26, 38–40) → bonus en chaîne.
* `dice=1d6` → progression standard.
* `overflow=stop` → arrêt net sur dépassement.
* `pathType='spiral'` → chemin en spirale inhabituel.

**Paramètres RT :**

* `color` des joueurs (`Green`, `Yellow`, `Purple`)
* Pas de paramètre RT explicite pour l’UI (hérite du thème par défaut).

**Effet :**
Partie plus courte mais très dynamique : les "zones d’oies" créent des effets d’accélération en rafale, renforçant la tension sur un petit plateau.
La spirale rend la lecture du parcours plus circulaire et visuellement singulière.

**Impact CT :**
* Le choix du *pathType=spiral* modifie la structure de rendu et donc la lisibilité de la progression.
* Les grappes d’oies modifient profondément la distribution des mouvements (effet systémique).
* Règles et taille de plateau figées (spécialisation de gameplay).

**Impact RT :**
* Couleurs ajustées pour la lisibilité.
* Les changements RT resteraient limités à l’esthétique.


### **Scénario 3 — Variant4 : Le Sprint Sombre**

**Paramètres CT :**

* `cells=35` → plateau très court.
* `pathType='snake'` → tracé simple, lisible.
* `overflow=stop` → fin stricte sans rebond.
* Effets `repeat` et `jump to 30` : mécaniques structurelles qui garantissent la rapidité du jeu.

**Paramètres RT :**

* `dice=1d12` → accélère fortement le rythme de déplacement.
* `uiTheme='dark'` → ambiance visuelle immersive.
* `color` des joueurs (`Bleu`, `Rouge`)

**Effet :**
Jeu ultra-rapide (“sprint”) où les cases spéciales compressent le parcours : en quelques tours, les joueurs peuvent franchir la majorité du plateau.
Le dé à 12 faces renforce la sensation de puissance et d’imprévisibilité.
Le thème sombre ancre une atmosphère plus intense et compétitive.

**Impact CT :**
* Structure du plateau minimaliste et pensée pour un gameplay condensé.
* Règles structurelles fixes (saut, relance, victoire).
* Aucun rebond → simplification logique et meilleure lisibilité du moteur.

**Impact RT :**
* Paramétrage du dé et du thème impacte directement la dynamique ressentie.
* Accélération et ambiance adaptables sans reconstruire le modèle.


