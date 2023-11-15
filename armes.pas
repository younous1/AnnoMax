unit armes;

{$mode objfpc}{$H+}
{$codepage utf8}

interface
uses
    sysutils, ressources, GestionEcran;

var
  soldat: integer;

  procedure interface_armee();
  procedure combat();
  function get_soldats():integer;
  procedure set_soldats(x :integer);



implementation
{Get et Set}
function get_soldats(): integer;
begin
   get_soldats := soldat;
end;

procedure set_soldats(x: integer);
begin
   soldat := x;
end;

{Menu des actions}
procedure interface_armee();
var
  coord: coordonnees; {Travail, Utilisé dans l'unit de gestion d'écran}
  choix: integer;
  text: String;
begin
    choix := -1;
    while choix <> 0 do
    begin
      effacerEcran;
      //dessinerCadreXY(10,10,190,50,simple,15,0);

      coord.x := 15;
      coord.y := 15;
      text := Concat('[1] Recruter un soldat (2 Louis, 5 bois)');
      ecrireEnPosition(coord, text);

      coord.y := 16;
      text := Concat('[0] Quitter');
      ecrireEnPosition(coord, text);

      coord.x := 100;
      coord.y := 15;
      text := Concat('Nbr de soldat: ', IntToStr(soldat));
      ecrireEnPosition(coord, text);


      readln(choix);
      if choix = 1 then
      begin
        if (get_bois() >= 5) AND (get_moneys() >= 2) then
        begin
          remove_moneys(2);
          remove_bois(5);
          soldat := soldat + 1;
        end
        else
        begin
            writeln('Ressource insuffisante');
            readln();
        end;
    end;

    end;
end;

procedure combat();
var
  x,      {Nombre de jour}
  ennemies,
  choix: integer;
  victoire : boolean;
begin
    {initialisation}
    victoire := false;
    x := get_nbjour();
   {Test si combat}
   if (x mod 5) = 0 then
   begin
      soldat := 3;
      Randomize;
      ennemies := Random(x)+1;
      writeln('Ennemies: ', ennemies);
      writeln('Soldat: ', soldat);
      writeln('[1] Attacker par supprise');
      writeln('[2] Défendre l ile');

      readln(choix);
      {Attack par supprise, plus suptile mais par a cout sur}
      if choix = 1 then
      begin
         if ennemies <= soldat*2 then
         begin
              Randomize;
             if Random(2) = 1 then victoire := true
             else
             victoire := false;
         end
         else
         begin
           victoire := false;
         end;

      end;


      if choix = 2 then
      begin
         if ennemies > soldat then victoire := false
         else victoire := true;
      end;
      writeln('Victoire: ', victoire);
      if victoire = false then
      begin
         if get_moneys() >= 2 then
         begin
            remove_moneys(2);
            writeln('Vous avez perdu 2 louis');

         end;
      end;
      readln;
   end;



end;

end.
