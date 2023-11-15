unit Sauvegardeunit;

{$mode objfpc}{$H+} {$codepage utf8}

interface

uses
  Classes, SysUtils,ressources,unitbatiment,armes, Dos;
var
  Sauvegarde :text; // Le fichier text



  procedure sauvegardeProc();
  function chargesauvegarde():string;



implementation
  procedure sauvegardeProc();

  begin       // debut de la procedure
    assign(sauvegarde,'Sauvegarde.txt');  // on enregistre

    // on enregistre les ressources
    rewrite(sauvegarde);
    writeln(sauvegarde,get_colons()); // le nb de colon
    writeln(sauvegarde,get_colons_max());  // le nb de colon max
    writeln(sauvegarde,get_citoyens()); // le nb de citoyen
    writeln(sauvegarde,get_citoyens_max()); // le nb de citoyen max
    writeln(sauvegarde,get_outils());  // le nb d'outils
    writeln(sauvegarde,get_bois()); // le nb de bois
    writeln(sauvegarde,get_laines()); // le nb de laines
    writeln(sauvegarde,get_poissons()); // le nb de poissons
    writeln(sauvegarde,get_tissus());  // le nb de tissus
    writeln(sauvegarde,get_moneys()); // l'argent du joueur
    writeln(sauvegarde,get_soldats()); // le nombre de soldat
    writeln(sauvegarde,get_nbjour()); // le nb de jour passé
    writeln(sauvegarde,get_nomjoueur());// le nom du joueur 

    flush(sauvegarde);// on écrit au cas où

    // on enregistre les batiments
    writeln(sauvegarde,get_maisons());
    writeln(sauvegarde,get_pecheurs());
    writeln(sauvegarde,get_bucherons());
    writeln(sauvegarde,get_bergeries());
    writeln(sauvegarde,get_ateliers());
    writeln(sauvegarde,get_chapelles());
    writeln(sauvegarde,get_centres());
    writeln(sauvegarde,get_maisoncitoyens());
    writeln(sauvegarde,get_entrepots());

    close(sauvegarde); // on referme le fichier

  end; // fin de la procedure

  function chargesauvegarde():string;
  var
    tampon , // sert de tampon
    tamponentrepot:integer; // sert de tampon pour un calcul qui arrive tard
    tamponstring:string; //sert de trampon pour les strings
    i:integer;// compteur de boucle

  begin // debut de la procedure
    assign(sauvegarde,'sauvegarde.txt');

    // on recharge chaque donnée
     reset(sauvegarde);
    // Les ressources
    readln(sauvegarde,tampon);
    set_colons(tampon);  // on redefini le nombre de colons

    readln(sauvegarde,tampon);
    set_colons_max(tampon); // on redefini le nombre de colons max

    readln(sauvegarde,tampon);
    set_citoyens(tampon); // on redefini le nombre de citoyens

    readln(sauvegarde,tampon);
    set_citoyens_max(tampon); // on redefini le nombre de citoyens max

    readln(sauvegarde,tampon);
    set_outils(tampon); // on redefini le nombre d'outils

    readln(sauvegarde,tampon);
    set_bois(tampon); // on redefini le nombre de bois

    readln(sauvegarde,tampon);
    set_laines(tampon); // on redefini le nombre de laine

    readln(sauvegarde,tampon);
    set_poissons(tampon); // on redefini le nombre de poissons

    readln(sauvegarde,tampon);
    set_tissus(tampon); // on redefini le nombre de tissus

    readln(sauvegarde,tampon);
    set_moneys(tampon); // on redefini le nombre de Louis

    readln(sauvegarde,tampon);
    set_soldats(tampon);   // on redefini le nombre de soldat

    readln(sauvegarde,tampon);
    set_nbjour(tampon);//on redifini le nombre de jour
    
    readln(sauvegarde,tamponstring);
    set_nomjoueur(tamponstring);



    // Les batiments

    readln(sauvegarde,tampon);
    set_maisons(tampon);  // on redefini le nombre de maisons

    readln(sauvegarde,tampon);
    set_pecheurs(tampon);  // on redefini le nombre de pechers

    readln(sauvegarde,tampon);
    set_bucherons(tampon);  // on redefini le nombre de bucherons

    readln(sauvegarde,tampon);
    set_bergeries(tampon);  // on redefini le nombre de bergeries

    readln(sauvegarde,tampon);
    set_ateliers(tampon);  // on redefini le nombre de attelier

    readln(sauvegarde,tampon);
    set_chapelles(tampon);  // on redefini le nombre de chapelles

    readln(sauvegarde,tampon);
    set_centres(tampon);  // on redefini le nombre de centres

    readln(sauvegarde,tampon);
    set_Maisoncitoyens(tampon);  // on redefini le nombre de maison de citoyens

    readln(sauvegarde,tampon);
    set_entrepots(tampon);  // on redefini le nombre d'entrepots
    tamponentrepot:=tampon;

    close(sauvegarde);
    //pour le de ress max je fait l'initilae + le bonus d'un
    //entrepot * le nombre d'entrepots
    for i := 1 to tamponentrepot do
    begin
    add_ress_max();
    end;



  end;


end.

