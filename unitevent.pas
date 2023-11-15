unit unitEvent;

{----Unité qui gère les évènements sur l'île----}

{$mode objfpc}{$H+}
{$codepage utf8}

interface

uses
  Classes, SysUtils, ressources;


{----Fonction de déclaration des évènements----}
function declarerEvent(estDeclare: boolean):integer;

{----Procédures de chaque évènement----}
procedure incendie();
procedure epidemie();
procedure animaux();
procedure tresor();
procedure pecheur();


implementation


{----Fonction qui déclare les évènements si ils ne sont pas déjà déclarés----}
function declarerEvent(estDeclare:boolean):integer;

var
  declarer: boolean; //déclare un évènement
  nbLancement: integer; //lance un évènement au hasard

begin
   //Si un évènement est déjà déclaré on ne peut pas en déclarer un autre
   if (estDeclare = true) then declarer := false else declarer := true;


  //Si on a l'autorisation de déclarer un évènement
  if (declarer = true) then
  begin
    //On génère un nombre aléatoire
    randomize();
    nbLancement := random(13) + 1;

    //Si le résultat est strictement supérieur à 5 on lance l'évènement qui correspond au chiffre sinon on renvoie -1 pour ne rien déclarer
    if (nbLancement > 8) then declarerEvent := nbLancement else declarerEvent := -1;
  end;
end;


{----Procedure qui fait durer un incendie pendant 1 à 5 jours----}
procedure incendie();

begin
  writeln('Malheur, votre colonie est victime d''un incendie!');
  writeln('Aujourd''hui, vous avez perdu 10 items de tissus.');

  //on set les nouvelles valeurs des ressources
  set_tissus(get_tissus() - 10);
end;


{----Procedure qui fait durer une épidémie pendant 1 à 7 jours----}
procedure epidemie();

begin
  writeln('Malheur, votre colonie est victime d''une épidémie!');
  writeln('Aujourd''hui, vous avez perdu 3 colons, et 2 citoyens.');

  //on set les nouvelles valeurs des ressources
  set_colons(get_colons() - 3);
  set_citoyens(get_citoyens() - 2);
end;


{----Procedure qui fait durer un pillage des ressources par des animaux pendant 1 à 5 jours----}
procedure animaux();

begin
  writeln('Malheur, votre colonie est victime d''un vol de nourritures par des animaux!');
  writeln('Aujourd''hui, vous avez perdu 3 poissons');

  //on set les nouvelles valeurs des ressources
  set_poissons(get_poissons() - 3);
end;


{----Procedure qui indique un trésor trouvé et donne de nouvelles ressources pendant 1 à 3 jours----}
procedure tresor();

begin
  writeln('Quelle chance, votre colonie a trouvé un trésor!');
  writeln('Aujourd''hui, vous avez trouvé 70 Louis !');

  //on set les nouvelles valeurs des ressources
  set_moneys(get_moneys() + 70);
end;


{----Procedure qui indique qu'un pêcheur local vient apporter du poisson pendant 1 à 5 jours----}
procedure pecheur();

begin
  writeln('Quelle chance, un pêcheur local vient vous apporter du poissons!');
  writeln('Aujourd''hui, vous avez récupéré 15 poissons!');

  //on set les nouvelles valeurs des ressources
  set_poissons(get_poissons() + 15);
end;


end.
