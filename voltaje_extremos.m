function [Datos,resultado] = voltaje_extremos(postes,consumo_poste,tipo_conexion,kva_m,conductor,long)
%% ENCONTRAR EL CONSUMO DE LOS POSTES RESPECTIVOS
[consumo,aux_c] = datos_consumo(postes,consumo_poste);

%% VERIFICACION DE QUE TIPO DE CONEXION SE VA A UTILIZAR
[conexion,aux_t] = tipo(tipo_conexion,kva_m,conductor);

[Datos,resultado] = generacion_datos(postes,long,consumo,aux_c,conexion,aux_t);
end

