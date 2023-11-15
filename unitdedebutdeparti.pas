unit UnitDeDebutDeParti;

{$mode objfpc}{$H+}
{$codepage utf8}

interface

uses
  Classes, SysUtils,gestionecran, ressources, MMsystem, sauvegardeunit, Dos, unitpartie;

type
  debutPart = (charge, new, quit);

procedure ConnectOuQuit();// procédure pour commencé la parti ou quité le jeu
procedure niveaudifficulte();

var
  NomJoueur:string ;//variable pour tout l'unité
  choixNom:integer;//pour le choix du nom ou la création du sien
  existence : boolean; //existence de la sauvegarde
implementation


 // procédure pour commencé la parti ou quité le jeu  il renvera le nom du joueur

procedure ConnectOuQuit();
var

  choixSoL:debutPart;// varaible que va dire si on reste ou part


begin
interfacePrincipale();
deplacerCurseurXY(90,30);
write('Voulez-vous:');
deplacerCurseurXY(55,31);
write('Charger une partie [charge], partir [quit], ou commencer une nouvelle partie [new]: ');
readln(ChoixSoL);  // on récupère si le joueur joue ou non


if ChoixSoL = quit then
   begin
   effacerecran();
   interfacePrincipale();
   deplacerCurseurXY(92, 30);
   write('Au revoir'); // a 1 on part
   playsound('AUrevoir.wav',1,SND_SYNC);
   attendre(2500);
   end

else if (choixSoL = charge) then
   begin
   chargesauvegarde();
   nomJoueur:=get_nomjoueur;
   partie(nomJoueur);
   end

else // si il fait autre chose que x>1 il joue
    begin
    effacerecran;
    deplacerCurseurXY(71,23);
    writeln('Choissisez un nom prédéfini ou créez le votre: '); // on fait choisir le nom à notre joueur
    deplacerCurseurXY(71,24);
    writeln('[1] Enzo Hardouin ');
    deplacerCurseurXY(71,25);
    writeln('[2] Ruben Clerc ');
    deplacerCurseurXY(71,26);
    writeln('[3] Younous Seghir ');
    deplacerCurseurXY(71,27);
    writeln('[4] Quentin Feret  ');
    deplacerCurseurXY(71,28);
    writeln('[5] Matthieu Simonet');
    deplacerCurseurXY(71,29);
    writeln('[autre chose] Customizer votre nom');
    readln(choixNom);
    case choixNom of
      1 : NomJoueur:='Enzo Hardouin';
      2 : NomJoueur:='Ruben Clerc';
      3 : NomJoueur:='Younous Seghir';
      4 : NomJoueur:='Quentin Feret';
      5 : NomJoueur:='Matthieu Simonet';
      else
        begin
        effacerecran;
        write('Choissisez votre nom : '); // on fait choisir le nom à notre joueur
        readln(Nomjoueur);
        end;

      end;
    set_nomjoueur(nomJoueur);
    niveaudifficulte();
    partie(nomJoueur);
    end;
end;



procedure niveaudifficulte();
var
  entree:integer;                       //choix saisit par l'utilisateur

begin
//--------------------------------AFFICHAGE---------------------------

  write('[1] Facile '#13#10'');
  write('[2] Normal '#13#10'');
  write('[3] Difficile '#13#10'');
  readln(entree);
  if (nomJoueur = 'Matthieu Simonet') and (entree <> 3) then
     begin
     write(' voyons Monsieur, pour vous c''est difficle et rien d''autre ');
     entree:=3;
     attendre(2000);
     end;


  //-----------------------------CONDITIONS---------------------------

  {-------FACILE-------}
  if entree= 1 then
     begin
          set_moneys(30);
          set_bois(15);
          set_tissus(0);
          set_outils(5);
          set_poissons(15);
          set_laines(0);
          set_nbjour(1);

     end
   {-------NORMAL-------}
  else if entree= 2 then
     begin
          set_moneys(15);
          set_bois(10);
          set_tissus(10);
          set_outils(3);
          set_poissons(10);
          set_laines(0);
          set_nbjour(1);

     end
   {-------DIFFICILE-------}
  else if entree= 3 then
     begin
          set_moneys(5);
          set_bois(5);
          set_tissus(5);
          set_outils(2);
          set_poissons(5);
          set_laines(0);
          set_nbjour(1);

     end
     else
     begin
          writeln('mauvais choix');
          niveaudifficulte();
     end;

end;
end.
