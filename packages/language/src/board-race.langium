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
        players=Players
        board=Board
        rules=Rules?
        layout=Layout?
        ui=UI?
    '}';

Players:
    'players' '{'
        players+=Player+
    '}';

Player:
    'player' name=ID
    ('color' '=' color=STRING)?
    ';'
;

Board:
    'board' '{'
        ('start' '=' startCell=INT ';')?  
        'cells' '=' size=INT ';'
        specials+=SpecialCell*
    '}';

SpecialCell:
    'cell' index=INT ':' effect=Effect ';';

Effect:
      Jump
    | Move
    | Lose
    | Repeat
    | Win
;

Jump:    'jump' 'to' target=INT;
Move:    'move' offset=SIGNED_INT;
Lose:    'lose' turns=INT 'turns';
Repeat returns string: 'repeat';
Win returns string: 'win';

Rules:
    'rules' '{'
        ('dice' '=' dice=Dice ';')?
        ('startRule' '=' startRule=StartRule ';')?   
        ('overflow' '=' overflow=Overflow ';')?
    '}';

Dice:
      faces=INT
    | count=INT 'd' faces=INT
;

StartRule:
    'any' '==' startValue=INT       
  | 'sum' '>=' minTotal=INT         
  | 'exact' '==' startValue=INT     
;

Overflow returns string: 'bounce' | 'exact' | 'stop';

Layout:
    'layout' '{'
        'pathType' '=' path=PathType ';'
    '}';

PathType returns string: 'snake' | 'spiral';

UI:
    'ui' '{'
        'uiTheme' '=' theme=UITheme ';'
    '}';

UITheme returns string: 'bright' | 'dark';
