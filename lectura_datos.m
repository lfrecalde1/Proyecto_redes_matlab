%% Programa de transcripcion de lo que se encuentra en excel


%% Eliminar todas la variables del sistema
clc,clear all,close all;

%% Lectura de los datos de la base 
consumo_poste=Consumo_poste(14);
%% Definir poste a buscar
poste_1=10879;
poste_2=194409;
poste_3=10888;
postes=[poste_1,]
Final=consumo_poste.Consumo(consumo_poste.Poste==poste_1)
