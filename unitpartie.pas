unit unitPartie;

{$mode objfpc}{$H+}
{$codepage utf8}

interface

uses
  Classes, SysUtils, ressources, GestionEcran, unitbatiment, finJournee, unitnavires, armes, sauvegardeunit, MMsystem;

type
  finPartie = (suite,arret);
  allerA = (bat, armee, flotte, passer);

procedure partie(nomJ:string); //procedure de partie en cours

implementation

procedure partie(nomJ:string);

var
    continuer: finPartie; //variable pour continuer ou arrêter la partie
    changerUnit: allerA; //variable pour changer de menu ou continuer
    nbMaisons, //nombre de maisons
    nbPecheurs, //nombre de maisons de pêcheurs
    nbBucherons, //nombre de maisons de bucherons
    nbBergeries, //nombre de bergeries
    nbChapelles, //nombre de chappelles
    nbCentres, //nombre de centre ville
    nbAteliers, //nombre d'ateliers
    nbColons, //nombre de colons
    nbArgent, //nombre de louis
    nbTissu, //nombre d'item de tissus
    nbBois, //nombre d'item de bois
    nbOutils, //nombre d'outils
    nbPoissons, //nombre de poissons
    nbLaine, //nombre d'item de laines
    TourEnCours:integer;  // permetra d'afficher depuis combien de jour vous avez commencer votre partie

begin
  changerTailleConsole(200,60);
  continuer := suite;

  set_ressource_max(0);//Et initialisation des ressources maximal


  while (continuer = suite) do

        begin
           //On récupère les valeurs de nos ressources
           nbColons := get_colons();
           nbArgent := get_moneys();
           nbTissu := get_tissus();
           nbBois := get_bois();
           nbOutils := get_outils();
           nbPoissons := get_poissons();
           nbLaine := get_laines();
           nbMaisons := get_maisons();
           nbPecheurs := get_pecheurs();
           nbBucherons := get_bucherons();
           nbBergeries := get_bergeries();
           nbChapelles := get_chapelles();
           nbCentres := get_centres();
           nbAteliers := get_ateliers();
           TourEnCours:=get_nbjour();

           //Affichage du nombre de tour
           deplacerCurseurXY(180,6);
           write('Jour : ',TourEnCours);

           //Affichage des ressources
           dessinerCadreXY(3,3,29+length(nomJ), 5, simple, 15, 0);
           deplacerCurseurXY(4,4);
           writeln('Bienvenue sur votre île ', nomJ, '.');
           deplacerCurseurXY(3,8);
           writeln('Colons et argent');
           dessinerCadreXY(1,5,50,8, simple, 15, 0);
           deplacerCurseurXY(4,6);
           writeln('Votre colonie comporte ', nbColons, ' colons.');
           deplacerCurseurXY(4,7);
           writeln('Vous possedez ', nbArgent, ' Louis.');
           dessinerCadreXY(3,11,14,13, simple, 15,0);
           deplacerCurseurXY(4,12);
           writeln('Ressources');
           dessinerCadreXY(1,13,50,19, simple, 15,0);
           deplacerCurseurXY(4,14);
           writeln(nbTissu,'/', get_tissusmax, ' items de tissus.');
           deplacerCurseurXY(4,15);
           writeln(nbBois, ' items de bois.');
           deplacerCurseurXY(4,16);
           writeln(nbOutils, ' outils.');
           deplacerCurseurXY(4,17);
           writeln(nbPoissons, ' poissons.');
           deplacerCurseurXY(4,18);
           writeln(nbLaine, ' items de laine.');

           //Affichage des bâtiments
           dessinerCadreXY(3,22,14,24, simple, 15,0);
           deplacerCurseurXY(4,23);
           writeln('Bâtiments');
           dessinerCadreXY(1,24,50,32,simple,15,0);
           deplacerCurseurXY(4,25);
           writeln('Vous avez ', nbMaisons, ' maisons');
           deplacerCurseurXY(4,26);
           writeln('Vous avez ', nbPecheurs, ' maisons de pêcheurs.');
           deplacerCurseurXY(4,27);
           writeln('Vous avez ', nbBucherons, ' maisons de bucherons.');
           deplacerCurseurXY(4,28);
           writeln('Vous avez ', nbBergeries, ' bergeries.');
           deplacerCurseurXY(4,29);
           writeln('Vous avez ', nbChapelles, ' chapelles.');
           deplacerCurseurXY(4,30);
           writeln('Vous avez ', nbCentres, ' centres.');
           deplacerCurseurXY(4,31);
           writeln('Vous avez ', nbAteliers, ' ateliers.');

           //Passer au menu des bâtiments
           deplacerCurseurXY(4, 35);
           writeln('Voulez vous acheter des bâtiments [bat], gérer votre armée [armee], gérer votre flotte [flotte], ou passer [passer]?');
           readln(changerUnit);
           effacerEcran();
           if (changerUnit = bat) then afficherBatiments()
           else if (changerUnit = armee) then interface_armee()
           else if (changerUnit = flotte) then affichernavires();

           //Fin de journée
           effacerEcran();
           add_nbjour();
           fin_journee();
           sauvegardeProc();
          //Continuité de la partie
          effacerEcran();
          writeln('Voulez vous continuer?');
          write('suite pour continuer, arret pour arrêter: ');
          readln(continuer);
        end;
playsound('AUrevoir.wav',1,SND_SYNC);
end;

end.
