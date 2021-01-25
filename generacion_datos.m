function [Datos] = generacion_datos(postes,long,consumo,aux_c,conexion,aux_t)
if(aux_c==1)&&(aux_t==1)
    disp("Los datos colocados son correctos")
Datos=[postes;...
    long;...
    consumo;...
    conexion];

elseif(aux_c==1)&&(aux_t==0)
    disp("Existe un error en los datos de kva_m")
    Datos=0;
elseif(aux_c==0)&&(aux_t==1)
    disp("Existe un error en los datos de los Postes")
    Datos=0;
else
    disp("Se han colocado mal los datos de Kva_m y postes")
    Datos=0;
end

end

