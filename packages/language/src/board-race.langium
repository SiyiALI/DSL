grammar BoardRace

hidden terminal COMMENT: /\/\/[^\n]*|\/\*[^*]*\*+([^/*][^*]*\*+)*\//;

hidden terminal WS: /\s+/;
terminal ID: /[_a-zA-Z][\w_]*/;
terminal INT returns number: /[0-9]+/;
terminal SIGNED_INT: /[-+]?[0-9]+/;
terminal STRING: /"(\\.|[^"\\])*"|'(\\.|[^'\\])*'/;

hidden terminal ML_COMMENT: /\/\*[\s\S]*?\*\//;
hidden terminal SL_COMMENT: /\/\/[^\n\r]*/;

entry Game:
    'game' name=ID '{'
        board=Board
        rules=Rules?
    '}';

Board:
    'board' '{'
        'cells' '=' size=INT ';'
        (specials+=SpecialCell | groups+=GooseGroup)*
    '}';

//grille spécialle avec des règles
SpecialCell:
    'cell' index=INT ':' effect=Effect ';';

Effect:
      Jump
    | Move
    | Lose
    | Repeat
    | Win
;

Jump:    'jump' 'to' target=INT;              // aller à case numéro n
Move:    'move' offset=SIGNED_INT;            // avancer/reculer n cases
Lose:    'lose' turns=INT 'turns';            // bloquer n ronds
Repeat returns string  :'repeat';              // dé +1
Win returns string : 'win';                    // gagné

GooseGroup:
    'goose' cells+=INT (',' cells+=INT)* ';';

Rules:
    'rules' '{'
        ('dice' '=' dice=Dice ';')?
        ('overflow' '=' overflow=Overflow ';')?
    '}';

// dé
Dice:
      faces=INT
    | count=INT 'd' faces=INT
;

// Manipulation après la ligne d'arrivée :rebond ou stoppe sauf dé exacte ou gagné directement
Overflow returns string:   'bounce' | 'exact' | 'stop';