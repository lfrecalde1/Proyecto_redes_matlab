%% Programa de transcripcion de lo que se encuentra en excel

%% Eliminar todas la variables del sistema
clc,clear all,close all;

%% Lectura de los datos de la base 
consumo_poste=Consumo_poste(14);
kva_m = kvam();

%% Definir poste a buscar
poste_1=10879;
poste_2=194409;
poste_3=10888;

poste_4=189313;
poste_5=10892;
poste_6=10891;
poste_7=10890;

poste_8=17235972;
poste_9=17235973;


%% DEFINIR EL VECTOR DE LOS POSTES
POSTES1=[poste_1,poste_2,poste_3];
POSTES2=[poste_4,poste_5,poste_6,poste_7];
POSTES3=[poste_8,poste_9];

%% DEFINIR LAS LONGITUDES 
long_1=36.34;
long_2=39.36;
long_3=36.48;

long_4=28.68;
long_5=43.08;
long_6=41.12;
long_7=27.97;

long_8=120.25;
long_9=167.55;

LONG1=[long_1,long_2,long_3];
LONG2=[long_4,long_5,long_6,long_7];
LONG3=[long_8,long_9];

%% Definir el tipo de conductor a usar
conductor_1="ASC2";
conductor_2="ASC2";
conductor_3="ASC2";

conductor_4="ACSRDUPLEX";
conductor_5="ASC2";
conductor_6="ASC2";
conductor_7="ASC2";

conductor_8="ASC2";
conductor_9="ASC2";


CONDUCTOR1=[conductor_1,conductor_2,conductor_3];
CONDUCTOR2=[conductor_4,conductor_5,conductor_6,conductor_7];
CONDUCTOR3=[conductor_8,conductor_9];
%% DEFINIR EL TIPO DE CONEXION A USAR EN EL SISTEMA
tipo_conexion="monofasica";

[Datos_1,resultado_1] = voltaje_extremos(POSTES1,consumo_poste,tipo_conexion,kva_m,CONDUCTOR1,LONG1);
[Datos_2,resultado_2] = voltaje_extremos(POSTES2,consumo_poste,tipo_conexion,kva_m,CONDUCTOR2,LONG2);
[Datos_3,resultado_3] = voltaje_extremos(POSTES3,consumo_poste,tipo_conexion,kva_m,CONDUCTOR3,LONG3);

% n=2;
% [i_dato1,j_dato1]=size(Datos_1)
% [i_dato2,j_dato2]=size(Datos_2)
% 
% j_max=max(j_dato1,j_dato2)
% i_max=max(i_dato1,i_dato2)
% 
% TOTAL(:,:,1)=zeros(i_max,j_max)
% for i=1:i_max
%    for j=1:j_max
%        
%    end
%     
% end
% % TOTAL(:,:,1)=Datos_1;
% TOTAL(:,:,2)=Datos_2;