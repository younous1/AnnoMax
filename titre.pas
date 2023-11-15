
unit titre;

{$mode objfpc}{$H+}


interface
uses
GestionEcran;
procedure write_titre();



implementation
procedure write_titre();
var
pos: coordonnees;
begin
pos.x := 60;
pos.y := 10;
deplacerCurseur(pos);
ecrireEnPosition(pos, '         ___   ____');
pos.y := pos.y +1;

ecrireEnPosition(pos, '        /  --;^/ ,-_\     \ | /');
pos.y := pos.y +1;

ecrireEnPosition(pos, '       / / --o\ o-\ \\   --(_)--');
pos.y := pos.y +1;

ecrireEnPosition(pos, '      /-/-/|o|-|\-\\|\\   / | \');
pos.y := pos.y +1;

ecrireEnPosition(pos, '        `  ` |-|   ``  ');
pos.y := pos.y +1;

ecrireEnPosition(pos, '             |-|');
pos.y := pos.y +1;

ecrireEnPosition(pos, '             |-|');
pos.y := pos.y +1;

ecrireEnPosition(pos, '             |-|O');
pos.y := pos.y +1;

ecrireEnPosition(pos, '             |-(\,__');
pos.y := pos.y +1;

ecrireEnPosition(pos, '          ...|-|\--,\_....');
pos.y := pos.y +1;

ecrireEnPosition(pos, '      ,;;;;;;;;;;;;;;;;;;;;;;;;,.');
pos.y := pos.y +1;

ecrireEnPosition(pos, '~~,;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,~~~~~~~~~~~~~~~~~~~~~~~~~~');
pos.y := pos.y +2;

ecrireEnPosition(pos, '~;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,  ______   ---------   _____');
pos.y := pos.y +2;
pos.x := pos.x +15;
ecrireEnPosition(pos, 'Appuyer pour continuer');
attendre(2500);
end;

end.
