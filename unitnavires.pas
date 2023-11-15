unit unitnavires;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,GestionEcran,ressources;

function affichernavires(): string;

function construirenavires():string;

var
  nbbasenavale,
  nbnavirescolon,
  nbnaviresexploration,
  nbnavirestransport : integer;



{-------FONCTION GET-BATIMENTS-------}
function get_navirescolon():integer;
function get_naviresexploration():integer;
function get_navirestransport():integer;


procedure set_navires();


implementation

function affichernavires(): string;
var
  entree2:integer;
begin
  write('Navires de colonisation : ', nbnavirescolon ,''#13#10'');
  write('Navires d''exploration : ', nbnaviresexploration ,''#13#10'' );
  write('Navires de transport : ', nbnavirestransport ,''#13#10'');
  write(''#13#10'');
  write('[1] Construire des navires '#13#10'');
  write('[2] Revenir sur l''ile '#13#10'');
  readln(entree2);

  if entree2=1 then
     begin
          effacerecran;
          construirenavires();
     end
  else if entree2=2 then
     begin
          effacerecran;
     end;
end;

//--------------------------------FONCTIONS GET-BATIMENTS-------------
{-------BASE NAVALE-------}
function get_basenavale():integer;
begin
     get_basenavale := nbbasenavale;
end;
{-------NAVIRES DE COLONISATION-------}
function get_navirescolon():integer;
begin
     get_navirescolon := nbnavirescolon;
end;

{-------NAVIRES D'EXPLORATION-------}
function get_naviresexploration():integer;
begin
     get_naviresexploration := nbnaviresexploration;
end;

{-------BOIS-------}
function get_navirestransport():integer;
begin
     get_navirestransport := nbnavirestransport;
end;


//--------------------------------SET NAVIRES-------------------
procedure set_navires();
begin
  nbnavirescolon:=0;
  nbnaviresexploration:=0;
  nbnavirestransport:=0;
  nbbasenavale:=0;
end;



//--------------------------------FONCTION CONSTRUIRE-----------------

function construirenavires():string;
var
  entree3:integer;                       //choix saisit par l'utilisateur

begin
//--------------------------------AFFICHAGE---------------------------
  write('[1] Construire une base navale (necessaire pour contruire un bateau) : 20 or, 8 bois, 8 tissus, 2 outils '#13#10'');
  write('[2] Construire un navire de colonisation : 20 or, 8 bois, 8 tissus, 2 outils '#13#10'');
  write('[3] Construire un navire d''exploration : 8 or, 2 bois, 2 tissus, 1 outil '#13#10'');
  write('[4] Construire un navire de transport : 8 or, 2 bois, 2 tissus, 1 outils '#13#10'');
  write('[0] Revenir sur le menu  '#13#10'');

  readln(entree3);



  //-----------------------------CONDITIONS---------------------------
  if entree3= 1 then                                                    //si l'utilisateur tape 1
     begin
          if nbbasenavale=0 then                                        // on verifie qu'il n'a pas deja une base navale
             if (bois-8>=0) and (moneys-20>=0) and (tissus-8>=0) and (outils-2>=0) then     // si il n'en a pas et qu'il a assez de ressources
                begin                                                  //la base navale est installé
                     bois:=bois-8;
                     moneys:=moneys-20;
                     tissus:=tissus-8;
                     outils:=outils-2;
                     nbbasenavale:=nbbasenavale+1;
                     write('Construction reussie');
                     readln();
                     effacerecran;
                     construirenavires();
                end
             else                                                      //sinon elle ne se construit pas
             begin
                  write('Vous n''avez pas assez de ressources');
                  readln();
                  effacerecran;
                  construirenavires();
             end
          else                                                         //sinon si il a deja une base navale alors retour à l'ecran de construction
          begin
               write('Vous avez deja une base navale');
               readln();
               effacerecran;
               construirenavires();
          end;
          readln();
     end;

  {-------NAVIRES DE COLONISATION-------}
  if entree3= 2 then                        //lorsque l'user tape 2 il construit un navire de colonisation selon...
     begin
          if nbbasenavale=1 then            //si il possede une base navale pour construire
             begin
                  if (bois-8>=0) and (moneys-20>=0) and (tissus-8>=0) and (outils-2>=0) then              //si il possede assez de bois...
                   begin
                        bois:=bois-8;
                        moneys:=moneys-20;
                        tissus:=tissus-8;
                        outils:=outils-2;
                        nbnavirescolon:=nbnavirescolon+1;
                        write('Construction reussie');
                        readln();
                        effacerecran;
                        construirenavires();
                   end
                   else                             //ou si il ne possede pas assez de ressources
                   begin
                        write('Vous n''avez pas assez de resources');
                        readln();
                        effacerecran;
                        construirenavires();
                   end
             end
     else                                                         //sinon si n'a pas de base navale alors retour à l'ecran de construction
          begin
               write('Vous n''avez pas de base navale');
               readln();
               effacerecran;
               construirenavires();
          end;
          readln();


     end;
     {-------NAVIRES D'EXPLORATION-------}
  if entree3= 3 then                        //lorsque l'user tape 3 il construit un navire d'exploration selon...
   begin
          if nbbasenavale=1 then            //si il possede une base navale pour construire
             begin
                  if (bois-8>=0) and (moneys-20>=0) and (tissus-8>=0) and (outils-2>=0) then              //si il possede assez de bois...
                  begin
                       bois:=bois-8;
                       moneys:=moneys-20;
                       tissus:=tissus-8;
                       outils:=outils-2;
                       nbnaviresexploration:=nbnaviresexploration+1;
                       write('Construction reussie');
                       readln();
                       effacerecran;
                       construirenavires();
                  end
          else                             //ou si il n'en possede pas
             begin
             write('Vous n''avez pas assez de resources');
             readln();
             effacerecran;
             construirenavires();
             end
          end
     else                                                         //sinon si n'a pas de base navale alors retour à l'ecran de construction
          begin
               write('Vous n''avez pas de base navale');
               readln();
               effacerecran;
               construirenavires();
          end;
          readln();


     end;
       {-------NAVIRES DE TRANSPORT-------}
  if entree3= 4 then                        //lorsque l'user tape 4 il construit un navire de transport selon...
     begin
           if nbbasenavale=1 then            //si il possede une base navale pour construire
             begin
                  if (bois-8>=0) and (moneys-20>=0) and (tissus-8>=0) and (outils-2>=0) then              //si il possede assez de bois...
                  begin
                       bois:=bois-8;
                       moneys:=moneys-20;
                       tissus:=tissus-8;
                       outils:=outils-2;
                       nbnavirestransport:=nbnavirestransport+1;
                       write('Construction reussie');
                       readln();
                       effacerecran;
                       construirenavires();
                  end
          else                             //ou si il n'en possede pas
             begin
             write('Vous n''avez pas assez de resources');
             readln();
             effacerecran;
             construirenavires();
             end
     end
        else                                                         //sinon si n'a pas de base navale alors retour à l'ecran de construction
          begin
               write('Vous n''avez pas de base navale');
               readln();
               effacerecran;
               construirenavires();
          end;
          readln();



     end;
     {-------RETOUR-------}
     if entree3=0 then
     begin
          effacerecran;
          affichernavires();
     end

end;
end.
