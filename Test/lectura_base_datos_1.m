%% Programa de transcripcion de lo que se encuentra en excel

%% Eliminar todas la variables del sistema
clc,clear all,close all;

%% Lectura de los datos de la base datos
consumo_poste=Consumo_poste(17);
kva_m = kvam();

%% Definir poste a buscar
poste_1=3681;
poste_2=3680;
poste_3=3679;
poste_4=1;

poste_5=3676;
poste_6=1;

%% DEFINIR EL VECTOR DE LOS POSTES
POSTES1=[poste_1,poste_2,poste_3,poste_4];
POSTES2=[poste_5,poste_6];



%% DEFINIR LAS LONGITUDES 
long_1=40.9;
long_2=44.66;
long_3=24.21;
long_4=23.06;

long_5=15.94;
long_6=23.06;

LONG1=[long_1,long_2,long_3,long_4];
LONG2=[long_5,long_6];



%% Definir el tipo de conductor a usar
conductor_1="ASC2";
conductor_2="ASC2";
conductor_3="ASC2";
conductor_4="ASC2";

conductor_5="ASC2";
conductor_6="ASC2";


CONDUCTOR1=[conductor_1,conductor_2,conductor_3,conductor_4];
CONDUCTOR2=[conductor_5,conductor_6];



%% DEFINIR EL TIPO DE CONEXION A USAR EN EL SISTEMA
tipo_conexion="monofasica";

[Datos_1] = voltaje_extremos(POSTES1,consumo_poste,tipo_conexion,kva_m,CONDUCTOR1,LONG1);
[Datos_2] = voltaje_extremos(POSTES2,consumo_poste,tipo_conexion,kva_m,CONDUCTOR2,LONG2);


[i_1,j_1]=size(Datos_1(1,:));
[i_2,j_2]=size(Datos_2(1,:));

        
posiciones=[i_1,i_2;...
            j_1,j_2];

%% generacion de las posiciones en las que va a mover el vector
nuevo=aux_posiciones(posiciones);

%% generacion de la matrix de datos
Total=[Datos_1,Datos_2];


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

