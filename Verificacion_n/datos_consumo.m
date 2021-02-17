function [consumo,aux] = datos_consumo(postes,consumo_poste)
consumo_total=consumo_poste.Poste==postes;

%% variables auxiliares para poder almacenar los datos respectivos
[i_c,j_c]=size(consumo_total);


%% bucle de interaccion para verificar si los datos son los correctos  de los postes

for k=1:j_c
    
    auxiliar_consumo=consumo_poste.Consumo(consumo_total(:,k));
    if(isempty(auxiliar_consumo))
        %disp("un valor intorducido no se encuentra en la bas de datos no se puede continuar");
        aux=0;
        break
    else
        consumo(k)=auxiliar_consumo;
        aux=1;
    end
end
end

