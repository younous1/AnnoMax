unit Marchand;

{$mode objfpc}{$H+} {$codepage utf8}

interface

uses
  Classes, SysUtils, GestionEcran,ressources;
procedure marchandage();
implementation
procedure marchandage();
var
  choix:integer;// permet de faire les choix
  argent:integer;//argent du joueuer
  achatouvente:integer;// choix du joueur si il vends ou achete
  accesbateau:integer;
begin
argent:=get_moneys();
effacerecran;
write('voulez vous accedé au bateau [1] ou partir [0] ');
readln(accesbateau);
while accesbateau =1 do
begin
write('voulez vous acheté [1] ou vendre [n''importe quel chiffre] ? '); // choix de si il achete ou vends
readln(achatouvente);
if achatouvente = 1 then
begin


     effacerecran;
     writeln('voici ce que je vous propose et voici votre argent : ',argent);
     writeln(' 1 Laine[1] / poisson[2] / bois[3] ---> 2 louis d''or ');
     writeln(' 1 tissu [4] ---> 2 Louis');
     writeln(' 1 outils[5] ---> 15 Louis ');
     writeln('Voici les objets que vous possedez : ');
     writeln('Laine : ',get_laines);
     writeln('Bois : ',get_bois);
     writeln('Poisson : ',get_poissons);
     writeln('Tissu : ',get_tissus);
     writeln('Outils : ',get_outils);

     write('faites votre choix, 0 pour partir ');
     readln(choix);

     while (choix <> 0) and (argent > 1) do //tant que choi différents lui proposé différent option
           begin
           case choix of
           // l'achat de laine
           1: begin
                   if get_laines < get_resssimplemax then
                      begin
                       add_laines(1);
                       remove_moneys(1);
                       argent:=argent-1;
                      end
                   else
                       begin
                       effacerecran();
                       write('vous n''avez pas assez de place disponible, il faut plus d''entrepot ');
                       end;
               end;
         //l'achat de poisson
            2: begin
             if get_laines < get_resssimplemax then
                begin
                     add_poissons(1);
                     remove_moneys(1);
                     argent:=argent-1;
                end
                else
                    begin
                         effacerecran();
                         write('vous n''avez pas assez de place disponible, il faut plus d''entrepot ');
                    end

                end;
         // l'achat de bois
           3: begin
                   if get_bois < get_resssimplemax then
                   begin
                      add_bois(1);
                      remove_moneys(1);
                      argent:=argent-1;
                   end
                   else
                    begin
                         effacerecran();
                         write('vous n''avez pas assez de place disponible, il faut plus d''entrepot ');
                    end;

                 end;
       else  // si on a pas 5 piece on peux quand même racheter en haut donc on boucle
            if argent < 5 then write('vous ne pouvez pas acheter ces ressources par manque de fonds ')

            else if choix = 4 then
                 begin // l'achat de tissus
                    if get_tissus < get_tissusmax then
                    begin
                         add_tissus(1);
                         remove_moneys(2);
                         argent:=argent-5;
                    end
                    else
                    begin
                         effacerecran();
                         write('vous n''avez pas assez de place disponible, il faut plus d''entrepot ');
                    end;

                 end
            else if choix = 5 then
                 begin // l'achat d'outils
                 if get_outils < get_outilsmax then
                 begin
                      add_outils(1);
                      remove_moneys(15);
                      argent:=argent-5;
                 end
                 else
                 begin
                     effacerecran();
                     write('vous n''avez pas assez de place disponible, il faut plus d''entrepot ');
                 end;

                 end
             else if choix <> 0 then write('choix incorect recommencé s''il vous plait ');


      end;//fin du case of
      write('votre argent : ',argent,' ');
      write('voulez vous continué ? (0 pour quitté) ');
      readln(choix);
                    end; // fin du while

      writeln('vous êtes parti de l''achat ou vous n''avez plus assez d''argent ');
end
else
begin
  writeln('Voici mes prix de rachat Laine, Bois, Poisson et Tissous 1 unité pour un Louis, ');
  writeln('Les outils pour 15 Louis ');
  writeln('Voici les objets que vous possedez : ');
  writeln('Laine [1] : ',get_laines);
  writeln('Poisson [2] : ',get_bois);
  writeln('Bois [3] : ',get_poissons);
  writeln('Tissu [4] : ',get_tissus);
  writeln('Outils [5] : ',get_outils);
  writeln('Et voici votre argent : ',argent);
  write('Saissiez le chiffre de l''objet que vous voulez vendre, [0] pour quité');
  readln(choix);

  while (choix<> 0) do
        begin
             case choix of
                // vente de laine
           1: begin if get_laines > 0 then
                begin
                     remove_laines(1);
                     add_moneys(1);
                end
                     else write('Pas assez de ressources');

               end;
                //vent de poisson
            2: begin if get_poissons > 0 then
                 begin
                      remove_poissons(1);
                      add_moneys(1);
                 end
                    else write('Pas assez de ressources');
                 end;
                 // vente de bois
            3: begin if get_bois > 0 then
                begin
                     remove_bois(1);
                     add_moneys(1);
                end
                     else write('Pas assez de ressources');
                end;
                // vente de tissus
            4: begin if get_tissus > 0 then
                begin
                     remove_tissus(1);
                     add_moneys(2);
                end
                     else write('Pas assez de ressources');
                end;
                // vente d'outils
            5: begin if get_outils > 0 then
                begin
                     remove_outils(1);
                     add_moneys(15);
                end
                     else write('Pas assez de ressources');
                end;
             end;// end case of
             write('Que voulez vous faire, continué[n''importe quel chiffre], quitté [0]');
             readln(choix) ;
             if choix =0 then write('Au revoir')
        end;// end begin  de la boucle



end;// end du else
write('Voulez vous acheté ou vendre quelque chose [1] ou partir [n''importe quel chiffre] ');
readln(accesbateau);
end;
write('Au revoir,le Marchand s''en va et a la revoyure ');
attendre(2500);

end;

end.
