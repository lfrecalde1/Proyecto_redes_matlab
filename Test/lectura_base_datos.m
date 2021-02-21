%% Programa de transcripcion de lo que se encuentra en excel

%% Eliminar todas la variables del sistema
clc,clear all,close all;

%% Lectura de los datos de la base 
consumo_poste=Consumo_poste(17);
kva_m = kvam();

%% Definir poste a buscar
poste_1=10879;
poste_2=194409;
poste_3=10888;

poste_4=189313;
poste_5=10892;
poste_6=10891;
poste_7=10890;
poste_71=10889;

poste_8=17235972;
poste_9=17235973;

poste_10=17183796;
poste_11=17235973;

%% DEFINIR EL VECTOR DE LOS POSTES
POSTES1=[poste_1,poste_2];
POSTES2=[poste_4,poste_5,poste_6,poste_7,poste_71];
POSTES3=[poste_8,poste_9];
POSTES4=[poste_10,poste_11];

%% DEFINIR LAS LONGITUDES 
long_1=36.34;
long_2=39.36;
long_3=36.48;

long_4=28.68;
long_5=43.08;
long_6=41.12;
long_7=27.97;
long_71=36.48;

long_8=120.25;
long_9=167.55;

long_10=212.91;
long_11=167.55;

LONG1=[long_1,long_2];
LONG2=[long_4,long_5,long_6,long_7,long_71];
LONG3=[long_8,long_9];
LONG4=[long_10,long_11];

%% Definir el tipo de conductor a usar
conductor_1="ASC2";
conductor_2="ASC2";
conductor_3="ASC2";

conductor_4="ACSRDUPLEX";
conductor_5="ASC2";
conductor_6="ASC2";
conductor_7="ASC2";
conductor_71="ASC2";

conductor_8="ASC2";
conductor_9="ASC2";

conductor_10="ACSRDUPLEX";
conductor_11="ASC2";

CONDUCTOR1=[conductor_1,conductor_2];
CONDUCTOR2=[conductor_4,conductor_5,conductor_6,conductor_7,conductor_71];
CONDUCTOR3=[conductor_8,conductor_9];
CONDUCTOR4=[conductor_10,conductor_11];

%% DEFINIR EL TIPO DE CONEXION A USAR EN EL SISTEMA
tipo_conexion="monofasica";

[Datos_1] = voltaje_extremos(POSTES1,consumo_poste,tipo_conexion,kva_m,CONDUCTOR1,LONG1);
[Datos_2] = voltaje_extremos(POSTES2,consumo_poste,tipo_conexion,kva_m,CONDUCTOR2,LONG2);
[Datos_3] = voltaje_extremos(POSTES3,consumo_poste,tipo_conexion,kva_m,CONDUCTOR3,LONG3);
[Datos_4] = voltaje_extremos(POSTES4,consumo_poste,tipo_conexion,kva_m,CONDUCTOR4,LONG4);

[i_1,j_1]=size(Datos_1(1,:));
[i_3,j_3]=size(Datos_3(1,:));
[i_2,j_2]=size(Datos_2(1,:));
[i_4,j_4]=size(Datos_4(1,:));

% posiciones=[i_1,i_2,i_3,i_4;...
%             j_1,j_2,j_3,j_4];
        
posiciones=[i_1,i_2;...
            j_1,j_2];

% posiciones=[i_1;...
%             j_1];
%% generacion de las posiciones en las que va a mover el vector
nuevo=aux_posiciones(posiciones);

%% generacion de la matrix de datos
Total=[Datos_1,Datos_2];

% Total=[Datos_1];

%% generacion de los nodos en todos los datos introducidos
[Total_final,busqueda,C] = voltajes_extremos(nuevo,Total);

%% generacionde los datos necesarios para el calculo de la caida de voltaje
Parametros.voltage=120;
Parametros.resistividad=0.028;
Parametros.diametro=7.41;
Parametros.radio=Parametros.diametro/2;
Parametros.operador=Parametros.radio^2;
% %% generacion de donde se encontraron los nodos
unique(busqueda(busqueda>0));
%% calculo de las perdidas en los extremos del sistema
[resultado,Datos] = extremos_final(Total_final,nuevo,busqueda,Parametros);

