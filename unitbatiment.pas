unit unitbatiment;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,GestionEcran,ressources;

function afficherBatiments(): string;

function construireBatiments():string;

var
  nbMaisons,                         //nombre de Maisons que possede l'utilisateur
  nbPecheurs,
  nbBucherons,
  nbBergeries,
  nbChapelles,
  nbCentres,
  nbMaisoncitoyen,
  nbentrepots,
  nbAteliers : integer;


{-------FONCTION GET-BATIMENTS-------}
function get_maisons():integer;
function get_pecheurs():integer;
function get_bucherons():integer;
function get_bergeries():integer;
function get_ateliers():integer;
function get_chapelles():integer;
function get_centres():integer;
function get_maisoncitoyens():integer;
function get_entrepots():integer;


{-------PROCEDURE SET-BATIMENTS-------}
procedure set_maisons(x: integer);
procedure set_pecheurs(x: integer);
procedure set_bucherons(x: integer);
procedure set_bergeries(x: integer);
procedure set_chapelles(x: integer);
procedure set_centres(x: integer);
procedure set_ateliers(x: integer);
procedure set_Maisoncitoyens(x: integer);
procedure set_entrepots(x: integer);
procedure set_batiments();


implementation

function afficherBatiments(): string;
var
  entree1:integer;
begin
  write('Maison : ', nbMaisons ,''#13#10'');
  write('Cabanes Pecheurs : ', nbPecheurs ,''#13#10'' );
  write('Cabanes Bucherons : ', nbBucherons ,''#13#10'');
  write('Bergeries : ', nbBergeries ,''#13#10'');
  write('Ateliers : ', nbAteliers ,''#13#10'');
  write('Chapelles : ', nbChapelles ,''#13#10'');
  write('Centres-villes : ', nbCentres ,''#13#10'');
  write(''#13#10'');
  write('[1] Construire des batiments '#13#10'');
  write('[2] Revenir sur l''ile '#13#10'');
  readln(entree1);

  if entree1=1 then
     begin
          effacerecran;
          construireBatiments();
     end
  else if entree1=2 then
     begin
          effacerecran;
     end;
end;

//--------------------------------FONCTIONS GET-BATIMENTS-------------
{-------MAISON-------}
function get_maisons():integer;
begin
     get_maisons := nbMaisons;
end;

{-------PECHE-------}
function get_pecheurs():integer;
begin
     get_pecheurs := nbPecheurs;
end;

{-------BOIS-------}
function get_bucherons():integer;
begin
     get_bucherons := nbBucherons;
end;

{-------BERGERIES-------}
function get_bergeries():integer;
begin
     get_bergeries := nbBergeries;
end;

{-------ATELIERS-------}
function get_ateliers():integer;
begin
     get_ateliers := nbAteliers;
end;

{-------CHAPELLES-------}
function get_chapelles():integer;
begin
     get_chapelles := nbChapelles;
end;

{-------CENTRES-VILLES-------}
function get_centres():integer;
begin
     get_centres := nbCentres;
end;
{-------MAISON CITOYEN-------}
function get_maisoncitoyens():integer;
begin
     get_maisoncitoyens := nbMaisoncitoyen;
end;
{-------ENTREPOT-------}
function get_entrepots():integer;
begin
     get_entrepots := nbentrepots;
end;
//--------------------------------SET BATIMENTS-------------------
procedure set_batiments();
begin
  nbMaisons:=0;
  nbPecheurs:=0;
  nbBucherons:=0;
  nbBergeries:=0;
  nbChapelles:=0;
  nbCentres:=0;
  nbAteliers:=0;
  nbMaisoncitoyen:=0;
  nbentrepots:=0;
end;

procedure set_maisons(x: integer);
begin
  nbMaisons:= x;
end;

procedure set_pecheurs(x: integer);
begin
  nbPecheurs:= x;
end;

procedure set_bucherons(x: integer);
begin
  nbBucherons:= x;
end;

procedure set_bergeries(x: integer);
begin
  nbBergeries:= x;
end;

procedure set_chapelles(x: integer);
begin
  nbChapelles:= x;
end;

procedure set_centres(x: integer);
begin
  nbCentres:= x;
end;

procedure set_ateliers(x: integer);
begin
  nbAteliers:= x;
end;

procedure set_Maisoncitoyens(x: integer);
begin
  nbMaisoncitoyen:= x;
end;

procedure set_entrepots(x: integer);
begin
  nbentrepots:= x;
end;



//--------------------------------FONCTION CONSTRUIRE-----------------

function construireBatiments():string;
var
  entree:integer;                       //choix saisit par l'utilisateur

begin
//--------------------------------AFFICHAGE---------------------------

  write('[1] Construire une maison : 20 or, 8 bois, 8 tissus, 2 outils '#13#10'');
  write('[2] Construire une cabane de Pecheur : 8 or, 2 bois, 2 tissus, 1 outil '#13#10'');
  write('[3] Construire une cabane de bucheron : 8 or, 2 bois, 2 tissus, 1 outils '#13#10'');
  write('[4] Construire une bergerie : 20 or, 12 bois, 2 outils '#13#10'');
  write('[5] Construire un atelier : : 20 or, 12 bois, 2 outils '#13#10'');
  write('[6] Construire une chapelle :  60 or, 20 bois, 15 tissus 8 outils '#13#10'');
  write('[7] Construire un centre-ville : : 80 or, 50 bois, 36 tissus 10 outils '#13#10'');
  write('[8] Construire une maison de citoyen : 40 or, 16 bois, 16 tissus, 4 outils '#13#10'');
  write('[9] Construire un entrepot : 30 or, 20 bois,  15 tissus, 3 outils '#13#10'');
  write('[0] Revenir sur le menu  '#13#10'');

  readln(entree);


  //-----------------------------CONDITIONS---------------------------

  {-------MAISON-------}
  if entree= 1 then                        //lorsque l'user tape 1 il construit une maison selon...
     begin
          if (bois-8>=0) and (moneys-20>=0) and (tissus-8>=0) and (outils-2>=0) then              //si il possede assez de bois
             begin
             bois:=bois-8;
             moneys:=moneys-20;
             tissus:=tissus-8;
             outils:=outils-2;
             nbMaisons:=nbMaisons+1;
             add_colons_max(4);
             write('Construction reussie');
             readln();
             effacerecran;
             construireBatiments();
             end
          else                             //ou si il n'en possede pas
             begin
             write('Vous n''avez pas assez de resources');
             readln();
             effacerecran;
             construireBatiments();
             end;
             readln();
     end;
     {-------PECHE-------}
     if entree= 2 then                        //lorsque l'user tape 2 il construit une cabane de pecheur selon...
     begin
          if (bois-2>=0) and (moneys-8>=0) and (tissus-2>=0) and (outils-1>=0) then              //si il possede assez de bois,or...
             begin
             bois:=bois-2;
             moneys:=moneys-8;
             tissus:=tissus-2;
             outils:=outils-1;
             nbPecheurs:=nbPecheurs+1;
             write('Construction reussie');
             readln();
             effacerecran;
             construireBatiments();
             end
          else                             //ou si il n'en possede pas
             begin
             write('Vous n''avez pas assez de ressources');
             readln();
             effacerecran;
             construireBatiments();
             end;
             readln();
     end;
     {-------BOIS-------}
     if entree= 3 then                        //lorsque l'user tape 3 il construit une cabane de bucheron selon...
     begin
          if (bois-2>=0) and (moneys-8>=0) and (tissus-2>=0) and (outils-1>=0) then              //si il possede assez de bois,or...
             begin
             bois:=bois-2;
             moneys:=moneys-8;
             tissus:=tissus-2;
             outils:=outils-1;
             nbBucherons:=nbBucherons+1;
             write('Construction reussie');
             readln();
             effacerecran;
             construireBatiments();
             end
          else                             //ou si il n'en possede pas
             begin
             write('Vous n''avez pas assez de ressources');
             readln();
             effacerecran;
             construireBatiments();
             end;
             readln();
     end;
     {-------BERGERIE-------}
     if entree= 4 then                        //lorsque l'user tape 4 il construit une bergerie selon...
     begin
          if (moneys-20>=0) and (bois-12>=0) and (outils-2>=0) then              //si il possede assez de bois,or...
             begin
             moneys:=moneys-20;
             bois:=bois-12;
             outils:=outils-2;
             nbBergeries:=nbBergeries+1;
             write('Construction reussie');
             readln();
             effacerecran;
             construireBatiments();
             end
          else                             //ou si il n'en possede pas
             begin
             write('Vous n''avez pas assez de ressources');
             readln();
             effacerecran;
             construireBatiments();
             end;

             readln();
     end;

     {-------ATELIER-------}
     if entree= 5 then                        //lorsque l'user tape 5 il construit un atelier selon...
     begin
          if (moneys-20>=0) and (bois-12>=0) and (outils-2>=0) then              //si il possede assez de bois,or...
             begin
             moneys:=moneys-20;
             bois:=bois-12;
             outils:=outils-2;
             nbAteliers:=nbAteliers+1;
             write('Construction reussie');
             readln();
             effacerecran;
             construireBatiments();
             end
          else                             //ou si il n'en possede pas
             begin
             write('Vous n''avez pas assez de ressources');
             readln();
             effacerecran;
             construireBatiments();
             end;

             readln();
     end;

     {-------CHAPELLE-------}
     if entree= 6 then                        //lorsque l'user tape 6 il construit une chapelle selon...
     begin
          if (bois-20>=0) and (moneys-60>=0) and (tissus-15>=0) and (outils-8>=0) then              //si il possede assez de bois,or...
             begin
             moneys:=moneys-60;
             bois:=bois-20;
             tissus:=tissus-15;
             outils:=outils-8;
             nbChapelles:=nbChapelles+1;
             write('Construction reussie');
             readln();
             effacerecran;
             construireBatiments();
             end
          else                             //ou si il n'en possede pas
             begin
             write('Vous n''avez pas assez de ressources');
             readln();
             effacerecran;
             construireBatiments();
             end;

             readln();
     end;

     {-------CENTRE-VILLE-------}
     if entree= 7 then                        //lorsque l'user tape 7 il construit un centre-ville selon...
     begin
          if (bois-2>=0) and (moneys-8>=0) and (tissus-2>=0) and (outils-1>=0) then              //si il possede assez de bois,or...
             begin
             moneys:=moneys-8;
             bois:=bois-2;
             tissus:=tissus-2;
             outils:=outils-1;
             nbCentres:=nbCentres+1;
             write('Construction reussie');
             readln();
             effacerecran;
             construireBatiments();
             end
          else                             //ou si il n'en possede pas
             begin
             write('Vous n''avez pas assez de ressources');
             readln();
             effacerecran;
             construireBatiments();
             end;

             readln();
     end;

     {-------MAISON CITOYEN-------}
     if entree= 8 then                        //lorsque l'user tape 8 il construit une maison citoyen selon...
     begin
          if (bois-16>=0) and (moneys-40>=0) and (tissus-16>=0) and (outils-4>=0) then              //si il possede assez de bois,or...
             begin
             moneys:=moneys-40;
             bois:=bois-16;
             tissus:=tissus-16;
             outils:=outils-4;
             nbMaisoncitoyen:=nbMaisoncitoyen+1;
             add_citoyens_max(2);
             write('Construction reussie');
             readln();
             effacerecran;
             construireBatiments();
             end
          else                             //ou si il n'en possede pas
             begin
             write('Vous n''avez pas assez de ressources');
             readln();
             effacerecran;
             construireBatiments();
             end;

             readln();
     end;
     {-------ENTREPOTS-------}
     if entree= 9 then                        //lorsque l'user tape 9 il construit un entrepot selon...
     begin
          if (bois-20>=0) and (moneys-30>=0) and (tissus-15>=0) and (outils-3>=0) then              //si il possede assez de bois,or...
             begin
             moneys:=moneys-30;
             bois:=bois-20;
             tissus:=tissus-15;
             outils:=outils-3;
             nbentrepots:=nbentrepots+1;
             add_ress_max();
             write('Construction reussie');
             readln();
             effacerecran;
             construireBatiments();
             end
          else                             //ou si il n'en possede pas
             begin
             write('Vous n''avez pas assez de ressources');
             readln();
             effacerecran;
             construireBatiments();
             end;

             readln();
     end;

     {-------RETOUR-------}
     if entree=0 then
     begin
          effacerecran;
          afficherBatiments();
     end

end;
end.
