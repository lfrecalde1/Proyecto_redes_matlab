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



%% DEFINIR EL VECTOR DE LOS POSTES
postes=[poste_1,poste_2,poste_3];


%% DEFINIR LAS LONGITUDES 
long_1=36.34;
long_2=39.36;
long_3=36.48;
long=[long_1,long_2,long_3];

%% Definir el tipo de conductor a usar
conductor_1="PRE. AL2X50(50)";
conductor_2="PRE. AL2X50(50)";
conductor_3="PRE. AL2X50(50)";
conductor=[conductor_1,conductor_2,conductor_3];

%% DEFINIR EL TIPO DE CONEXION A USAR EN EL SISTEMA
tipo_conexion="monofasica";



%% ENCONTRAR EL CONSUMO DE LOS POSTES RESPECTIVOS
[consumo,aux_c] = datos_consumo(postes,consumo_poste);

%% VERIFICACION DE QUE TIPO DE CONEXION SE VA A UTILIZAR
[conexion,aux_t] = tipo(tipo_conexion,kva_m,conductor);


%% GERNERACION DE LA MATRIX DE LOS DATOS INGRESADOS
[Datos] = generacion_datos(postes,long,consumo,aux_c,conexion,aux_t);

[i_dato,j_dato]=size(Datos)
for k=1:j_dato
    Parcial(k)=(Datos(2,k)*sum(Datos(3,1:k)))/Datos(4,k);
end
rsultado_1=sum(Parcial)