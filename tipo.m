function [kv,aux] = tipo(tipo_conexion,kva_m,conductor)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
if (strcmp(tipo_conexion,"monofasica"))
    %disp("monofasic");
    dato=kva_m.Monofsica;
    aux=1;
elseif (strcmp(tipo_conexion,"bifasica"))
    %disp("bifasic");
    dato=kva_m.Bifsica;
    aux=1;
elseif (strcmp(tipo_conexion,"trifasica"))
%     disp("trifasic");
    dato=kva_m.Trifsica;
    aux=1;
else
    %disp("Se coloco mal el tipo de conexion");
    dato=0;
    aux=0;
end

if aux==1
    kv=0;
    for k=1:length(conductor)
        auxiliar_tipo=dato(strcmp(kva_m.CONDUCTOR,conductor(1,k)));
        if(isempty(auxiliar_tipo))
            %disp("un valor intorducido no se encuentra en la bas de datos no se puede continuar");
            aux=0;
            break
        else
            kv(k)=auxiliar_tipo;
            aux=1;
        end
    end
    
else
kv=0;
end


end

