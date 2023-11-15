unit finJournee;

{$mode objfpc}{$H+}
{$codepage utf8}

interface
uses
  sysutils, ressources, GestionEcran,unitbatiment, Marchand, unitEvent, armes;
  procedure fin_journee();

implementation
{Appel de la Fin de journée}
procedure fin_journee();
var
   coord: coordonnees; {Travail, Utilisé dans l'unit de gestion d'écran}
   arrivemarchand, {Travail, indique si le marchand est validé}
   ressmaxbois,
   ressmaxlaine,
   ressmaxpoissons,
   ressmaxtissus: boolean;
   text: string; {Travail, text a afficher}
   bois,
   poissons,
   laines,
   tissus,
   citoyens,
   colons,
   i: integer; {Travail, for}
   choix: integer; {travail}
   niveauBonheurColons: real; {travail, niveau de bonheur des colons}
   niveauBonheurCitoyens: real; {travail, niveau de bonheur des citoyens}
   estDeclare : boolean; {travail, indique si un évènement est déclaré}
   evenement : integer; {travail, lance un évènement}
   jourEv : integer; {travail, jour de l'évènement}
begin
     {Init}
     ressmaxbois:= false;
     ressmaxlaine:= false;
     ressmaxpoissons:= false;
     ressmaxtissus:= false;
     arrivemarchand := false;
     choix := 0;
     if (get_colons() > 0) then niveauBonheurColons := get_poissons() / get_colons();
     if (get_citoyens() > 0) then niveauBonheurCitoyens := get_poissons() / get_citoyens()*2;


     {Stokage des ressource vant modification}
     bois := get_bois();
     poissons := get_poissons();
     laines := get_laines();
     tissus := get_tissus();
     citoyens := get_citoyens();
     colons := get_colons();

     {calcule des ressource recu dans la journée}


     {production de matiére premier dans la journées}
     add_bois(get_bucherons() * 4);
     if (bois) > (get_resssimplemax()) then
        begin
             set_bois(1000);
             ressmaxbois:= true;
        end;

     add_poissons(get_pecheurs() * 4);
     if (poissons) > (get_resssimplemax()) then
        begin
            set_poissons(1000);
            ressmaxpoissons:= true;

        end;
     add_laines(get_bergeries() * 4);
      if (laines) > (get_resssimplemax()) then
        begin
             set_laines(1000);
             ressmaxlaine:= true;
        end;

     {Fabrication des tissu a partir de la laines}
     {4 laines = 1 tissu et 1 atelier fabrique 1 tissu/day}
     for i := 1 to get_ateliers() do
     begin
          if (get_laines >= 4) and (tissus < get_tissusmax) then
          begin
            add_tissus(1);
            remove_laines(4);
          end
          else ressmaxtissus:= true;
     end;


     {Ajout des colons}
     if (get_colons_max()-2 > get_colons) and (niveauBonheurColons > 1) then
     begin
       writeln('Vos colons sont très heureux');
       add_colons(2);
     end

     else if (get_colons_max() > get_colons) and (niveauBonheurColons = 1) then
     begin
       writeln('Vos colons sont heureux');
       add_colons(1);
     end
     else if (get_colons_max() > get_colons) and (niveauBonheurColons < 1) then
     begin
       writeln('Vos colons ne sont pas heureux');
       remove_colons(1);
     end;

     {Ajout des citoyens}
     if (get_citoyens_max()-2 > get_citoyens) and (niveauBonheurCitoyens > 1) then
     begin
       writeln('Vos citoyens sont très heureux');
       add_citoyens(2);
     end

     else if (get_citoyens_max() > get_citoyens) and (niveauBonheurCitoyens = 1) then
     begin
       writeln('Vos citoyens sont heureux');
       add_citoyens(1);
     end
     else if (get_citoyens_max() > get_citoyens) and (niveauBonheurCitoyens < 1) then
     begin
       writeln('Vos citoyens ne sont pas heureux');
       remove_citoyens(1);
     end;

      readln;

     {Consomation de nourriture la journée}
     remove_poissons(get_colons);
     remove_poissons(get_citoyens()*2);
     if (get_poissons < 0) then set_poissons(0);


     if random(100) > 65 then arrivemarchand := true;

     {Affichage des récapitulatif}
     dessinerCadreXY(10,10,190,50,simple,15,0);
     {afficher les ressource gagner (tissu inclut)}
               { BOIS }
               coord.x := 90;
               coord.y := 27;
               if ressmaxbois = false then
               begin
                    text := Concat('+ ', IntToStr(get_bois() - bois)  ,' Bois');
                    ecrireEnPosition(coord, text);
               end
               else
               begin
                    text := concat('Vous avez atteinds le max de ressource vous avez donc ', intToStr(get_resssimplemax) ,' bois ');
                    ecrireEnPosition(coord, text);
               end;

               { Poissons }
               coord.y := 29;
               if ressmaxpoissons = false then
               begin
                    text := Concat('+ ', IntToStr(get_poissons() - poissons),' Poissons');
                    ecrireEnPosition(coord, text);
               end
               else
               begin
                    text := concat('Vous avez atteinds le max de ressources, vous avez donc ', intToStr(get_resssimplemax),' poissons  ');
                    ecrireEnPosition(coord, text);
               end;


               { Laines }
               coord.y := 31;
               if ressmaxlaine = false then
               begin
                    text := Concat('+ ', IntToStr(get_laines() - laines) ,' laine');
                    ecrireEnPosition(coord, text);
               end
               else
               begin
                    text := concat('Vous avez atteinds le max de ressources, vous avez donc ',intToStr(get_resssimplemax), ' laines  ');
                    ecrireEnPosition(coord, text);
               end;

               { Tissus }
               coord.y := 33;
               if ressmaxtissus = false then
               begin
                    text := Concat('+ ', IntToStr(get_tissus() - tissus) ,' Tissus');
                    ecrireEnPosition(coord, text);
               end
               else
               begin
                    text := concat('Vous avez atteinds le max de ressources, vous avez donc ', intToStr(get_tissusmax) ,' tissus ');
                    ecrireEnPosition(coord, text);
               end;


               {Colons}
               coord.y := 35;
               text := Concat('+', IntToStr(get_colons() - colons),' colons');
               ecrireEnPosition(coord, text);

               {Citoyens}
               coord.y := 37;
               text := Concat('+', IntToStr(get_citoyens() - citoyens),' citoyens');
               ecrireEnPosition(coord, text);

     estDeclare := false;

     //On commence les évènements à partir du jour 3
     if (get_nbjour() > 3) and (estDeclare = false) then
     begin
         evenement := declarerEvent(estDeclare);
     end;

     //Si l'on obtient des valeurs possible pour chaque énènement on le lance. On initialise une variable au jour du début que l'on incrémente jusqu'à la fin de l'évènement
     case evenement of
     9:
     begin
          jourEv := get_nbjour();
          estDeclare := true;

          if (jourEv <= get_nbjour() + 5) then
          begin
              incendie();
              jourEv := jourEv + 1;
          end;

     end;
     10:
     begin
          jourEv := get_nbjour();
          estDeclare := true;

          if (jourEv <= get_nbjour() + 7) then
          begin
              jourEv := jourEv + 1;
              epidemie();
          end;

     end;
     11:
     begin
          jourEv := get_nbjour();
          estDeclare := true;

          if (jourEv <= get_nbjour() + 5) then
          begin
              jourEv := jourEv + 1;
              animaux();
          end;

     end;
     12:
     begin
          jourEv := get_nbjour();
          estDeclare := true;

          if (jourEv <= get_nbjour() + 5) then
          begin
              jourEv := jourEv + 1;
              tresor();
          end;

     end;
     13:
     begin
          jourEv := get_nbjour();
          estDeclare := true;

          if (jourEv <= get_nbjour() + 5) then
          begin
              jourEv := jourEv + 1;
              pecheur();
          end;
     end;
     end;

     if Random(100)>65 then
     begin
         arrivemarchand := true;
     end;

     if arrivemarchand = true then
     begin
        {afficher une phrase "Bateaux en vu" si le marchands et validé}
         coord.y := 40;
         text := 'Bateaux en vu !';
         ecrireEnPosition(coord, text);

     end;

     coord.y := 50;
     text := '[1] Pour continuer';
     ecrireEnPosition(coord, text);


     while choix <> 1 do
     begin
          readln(choix);
     end;
     {L'utilisateur a tapez 1}
     if arrivemarchand = true then marchandage();
     arrivemarchand := false;
     combat();
end;

end.
