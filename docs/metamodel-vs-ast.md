| Concept du métamodèle | Noeud/propriété dans l'AST | Remarques |
|---|---|---|
| Concept du métamodèle | Noeud / Propriété dans l’AST Langium | Remarques / Détails de correspondance |
| Game                    | Game (interface)                      | Règle d’entrée principale du langage.     |
| name: String            | Game.name: string                     | Correspondance directe.                   |
| players: Players        | Game.players: Players                 | Relation de composition.                  |
| board: Board            | Game.board: Board                     | Relation de composition.                  |
| rules: Rules [0..1]     | Game.rules?: Rules                    | Propriété optionnelle.                    |
| layout: Layout [0..1]   | Game.layout?: Layout                  | Propriété optionnelle.                    |
| ui: UI [0..1]           | Game.ui?: UI                          | Propriété optionnelle.                    |
| Players | Players (interface) | Conteneur regroupant les joueurs. |
| players: Player[*] | Players.players: Player[] | Liste de plusieurs joueurs. |
| Player | Player (interface) | Définit un joueur. |
| name: String | Player.name: string | Obligatoire. |
| color: String | Player.color?: string | Optionnel. |
| Board | Board (interface) | Définit le plateau de jeu. |
| size: int | Board.size: number | Taille du plateau. |
| specialCells: SpecialCell[*] | Board.specials: SpecialCell[] | Liste des cases spéciales. |
| SpecialCell | SpecialCell (interface) | Représente une case spéciale du plateau. |
| index: int | SpecialCell.index: number | Position de la case. |
| effect: Effect | SpecialCell.effect: Effect | Référence polymorphe vers un effet. |
| Effect (abstrait) | Effect (type union) | Supertype polymorphe représenté comme union TypeScript. |
| ├─ Jump | Jump (interface) | Sous-type d’Effect. |
| │ └─ target: int | Jump.target: number | Case de destination. |
| ├─ Move | Move (interface) | Sous-type d’Effect. |
| │ └─ offset: string | Move.offset: string | ⚠️ Type chaîne (car basé sur le terminal SIGNED_INT). |
| ├─ Lose | Lose (interface) | Sous-type d’Effect. |
| │ └─ turns: int | Lose.turns: number | Nombre de tours perdus. |
| ├─ Repeat | Repeat (type Repeat = 'repeat') | Type littéral, pas un objet. |
| └─ Win | Win (type Win = 'win') | Type littéral, pas un objet. |
| Rules | Rules (interface) | Bloc de règles optionnel. |
| dice: Dice [0..1] | Rules.dice?: Dice | Optionnel. |
| overflow: Overflow [0..1] | Rules.overflow?: Overflow | Optionnel. |
| Dice | Dice (interface) | Configuration des dés. |
| count: int | Dice.count?: number | Optionnel (ex. : un seul dé). |
| faces: int | Dice.faces: number | Nombre de faces (obligatoire). |
| Overflow (énumération) | type Overflow = 'bounce' | 'exact' | 'stop' | L’énumération est traduite en union de chaînes. |
| Layout | Layout (interface) | Configuration de la disposition du plateau. |
| pathType: PathType | Layout.path: PathType | Type de chemin (valeur d’énumération). |
| PathType (énumération) | type PathType = 'snake' | 'spiral' | Énumération traduite en union de chaînes. |
| UI | UI (interface) | Configuration de l’interface utilisateur. |
| uiTheme: UITheme | UI.theme: UITheme | Thème de l’interface. |
| UITheme (énumération) | type UITheme = 'bright' | 'dark' | Énumération traduite en union de chaînes. |