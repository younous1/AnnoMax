unit ressources;

{$mode objfpc}{$H+}

interface
var
   colons,
   colons_max,
   citoyens,
   citoyens_max,
   outils,
   bois,
   poissons,
   laines,
   tissus,
   moneys,
   ressSimplemax,
   tissusmax,
   nbjour,
   outilsmax :integer;
   nomJ:string;
   
   {-- nom joueur --}
   procedure set_nomjoueur(x:string);
   function get_nomjoueur():string;
   

   {-- nombre de tour --}
  procedure set_nbjour(x:integer);
  function get_nbjour():integer;
  procedure add_nbjour();


   { -- ressource max -- }
   procedure set_ressource_max(x:integer);
   procedure add_ress_max();
   function get_resssimplemax():integer;
   function get_tissusmax():integer;
   function get_outilsmax():integer;

   { -- COLONS -- }
   procedure set_colons(x: integer);
   function get_colons(): integer;
   procedure add_colons(x: integer);
   procedure remove_colons(x: integer);

   { -- COLONS_MAX -- }
   procedure set_colons_max(x: integer);
   function get_colons_max(): integer;
   procedure add_colons_max(x: integer);
   procedure remove_colons_max(x: integer);

   { -- CITOYENS -- }
   procedure set_citoyens(x: integer);
   function get_citoyens(): integer;
   procedure add_citoyens(x: integer);
   procedure remove_citoyens(x: integer);

   { -- CITOYENS_MAX -- }
   procedure set_citoyens_max(x: integer);
   function get_citoyens_max(): integer;
   procedure add_citoyens_max(x: integer);
   procedure remove_citoyens_max(x: integer);

   { -- OUTILS -- }
   procedure set_outils(x: integer);
   function get_outils(): integer;
   procedure add_outils(x: integer);
   procedure remove_outils(x: integer);

   { -- BOIS -- }
   procedure set_bois(x: integer);
   function get_bois(): integer;
   procedure add_bois(x: integer);
   procedure remove_bois(x: integer);

   { -- POISSONS -- }
   procedure set_poissons(x: integer);
   function get_poissons(): integer;
   procedure add_poissons(x: integer);
   procedure remove_poissons(x: integer);

   { -- LAINES -- }
   procedure set_laines(x: integer);
   function get_laines(): integer;
   procedure add_laines(x: integer);
   procedure remove_laines(x: integer);

   { -- TISSUS -- }
   procedure set_tissus(x: integer);
   function get_tissus(): integer;
   procedure add_tissus(x: integer);
   procedure remove_tissus(x: integer);

   { -- MONEYS -- }
   procedure set_moneys(x: integer);
   function get_moneys(): integer;
   procedure add_moneys(x: integer);
   procedure remove_moneys(x: integer);


implementation

 {-- nom joueur --}
 
 procedure set_nomjoueur(x:string)
 begin
 nomJ:=x;
 end;
 
 
  function get_nomjoueur():string;
  begin
  get_nomJoueur:=nomJ;
  end;
  
  

{ -- nombre de tour -- }

procedure set_nbjour(x:integer);
   begin
      nbjour:=x;
   end;
function get_nbjour():integer;
   begin
      get_nbjour:=nbjour;
   end;

procedure add_nbjour();

begin
  nbjour := nbjour + 1;
end;

{-- ressource maximal --}
{Défini le nombre}
 procedure set_ressource_max(x:integer);
 begin
 ressSimplemax := x+1000 ;
 tissusmax := x+100;
 outilsmax :=x+25 ;
 end;
 procedure add_ress_max();
 {on change le nombre max grâce au entrepot}
begin
    ressSimplemax := RessSimplemax + 500;
    tissusmax := tissusmax + 50;
    outilsmax := outilsmax + 12;
end;

 function get_resssimplemax():integer;

 begin
     get_resssimplemax := resssimplemax;
 end;

 function get_tissusmax():integer;

 begin
     get_tissusmax := tissusmax;
 end;

 function get_outilsmax():integer;

 begin
     get_outilsmax := outilsmax;
 end;

{ -- COLONS -- }
{Définir le nombre}
procedure set_colons(x: integer);
begin
  colons := x;
end;
{Récupère le nombre}
function get_colons(): integer;
begin
     get_colons := colons;
end;
{Ajoute des quantité}
procedure add_colons(x: integer);
begin
     colons := colons + x;
end;
{Supprimer des quantité}
procedure remove_colons(x: integer);
begin
     colons := colons - x;
end;


{ -- COLONS_MAX -- }
{Définir le nombre}
procedure set_colons_max(x: integer);
begin
  colons_max := x;
end;
{Récupère le nombre}
function get_colons_max(): integer;
begin
     get_colons_max := colons_max;
end;
{Ajoute des quantité}
procedure add_colons_max(x: integer);
begin
     colons_max := colons_max + x;
end;
{Supprimer des quantité}
procedure remove_colons_max(x: integer);
begin
     colons_max := colons_max - x;
end;

{ -- CITOYENS -- }
{Définir le nombre}
procedure set_citoyens(x: integer);
begin
  colons := x;
end;
{Récupère le nombre}
function get_citoyens(): integer;
begin
     get_citoyens := citoyens;
end;
{Ajoute des quantité}
procedure add_citoyens(x: integer);
begin
     colons := colons + x;
end;
{Supprimer des quantité}
procedure remove_citoyens(x: integer);
begin
     colons := colons - x;
end;


{ -- CITOYENS_MAX -- }
{Définir le nombre}
procedure set_citoyens_max(x: integer);
begin
  colons_max := x;
end;
{Récupère le nombre}
function get_citoyens_max(): integer;
begin
     get_citoyens_max := citoyens_max;
end;
{Ajoute des quantité}
procedure add_citoyens_max(x: integer);
begin
     colons_max := colons_max + x;
end;
{Supprimer des quantité}
procedure remove_citoyens_max(x: integer);
begin
     colons_max := colons_max - x;
end;


{ -- OUTILS -- }
{Définir le nombre}
procedure set_outils(x: integer);
begin
  outils := x;
end;
{Récupère le nombre}
function get_outils(): integer;
begin
     get_outils := outils;
end;
{Ajoute des quantité}
procedure add_outils(x: integer);
begin
     outils := outils + x;
     if outils > outilsmax then outils:=outilsmax
end;
{Supprimer des quantité}
procedure remove_outils(x: integer);
begin
     outils := outils - x;
end;


{ -- BOIS -- }
{Définir le nombre}
procedure set_bois(x: integer);
begin
  bois := x;
end;
{Récupère le nombre}
function get_bois(): integer;
begin
     get_bois := bois;
end;
{Ajoute des quantité}
procedure add_bois(x: integer);
begin
     bois := bois + x;
     if bois > ressSimplemax then  bois:=ressSimplemax;
end;
{Supprimer des quantité}
procedure remove_bois(x: integer);
begin
     bois := bois - x;
end;


{ -- POISSONS -- }
{Définir le nombre}
procedure set_poissons(x: integer);
begin
  poissons := x;
end;
{Récupère le nombre}
function get_poissons(): integer;
begin
     get_poissons := poissons;
end;
{Ajoute des quantité}
procedure add_poissons(x: integer);
begin
     poissons := poissons + x;
     if poissons > ressSimplemax then
         begin
         writeln('vous ne pouvez pas dépasser ', ressSimplemax, ' poissons vous n''avez donc pas gagné de poissons ');
         poissons:=poissons - x;
         write( 'vous avez actuellement ',poissons,' poissons en votre possesion ');
         end;
end;
{Supprimer des quantité}
procedure remove_poissons(x: integer);
begin
     poissons := poissons - x;
end;


{ -- LAINES -- }
{Définir le nombre}
procedure set_laines(x: integer);
begin
  laines := x;
end;
{Récupère le nombre}
function get_laines(): integer;
begin
     get_laines := laines;
end;
{Ajoute des quantité}
procedure add_laines(x: integer);
begin
     laines := laines + x;
     if laines > ressSimplemax then laines:= ressSimplemax;
end;
{Supprimer des quantité}
procedure remove_laines(x: integer);
begin
     laines := laines - x;
end;


{ -- TISSUS -- }
{Définir le nombre}
procedure set_tissus(x: integer);
begin
  tissus := x;
  if tissus> tissusmax then tissus:=tissusmax;
end;
{Récupère le nombre}
function get_tissus(): integer;
begin
     get_tissus := tissus;
end;
{Ajoute des quantité}
procedure add_tissus(x: integer);
begin
     tissus := tissus + x;
end;
{Supprimer des quantité}
procedure remove_tissus(x: integer);
begin
     tissus := tissus - x;
end;


{ -- MONEYS -- }
{Définir le nombre}
procedure set_moneys(x: integer);
begin
  moneys := x;
end;
{Récupère le nombre}
function get_moneys(): integer;
begin
     get_moneys := moneys;
end;
{Ajoute des quantité}
procedure add_moneys(x: integer);
begin
     moneys := moneys + x;
end;
{Supprimer des quantité}
procedure remove_moneys(x: integer);
begin
     moneys := moneys - x;
end;


end.
