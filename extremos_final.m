function [resultado,Datos] = extremos_final(Total,nuevo,C)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[x1,y1]=size(nuevo);
for j=1:y1
    creacion=[nuevo(1,j):1:nuevo(2,j)];
    [i_dato,j_dato]=size(creacion);
    total=[];
    for k=1:j_dato
        for kk=1:length(C)
          
            if creacion(1,k)==C(kk)
                acumulado(creacion(1,k))=Total(3,creacion(1,k));
                break
            else
                acumulado(creacion(1,k))=sum(Total(3,creacion(1,1):creacion(1,k)));
            end
        end
        
        Lt(creacion(1,k))=Total(2,creacion(1,k))*acumulado((creacion(1,k)));
        Parcial(creacion(1,k))=Lt(creacion(1,k))/Total(4,creacion(1,k));
        total(k)=(Total(2,creacion(1,k))*acumulado((creacion(1,k))))/Total(4,creacion(1,k));
    end
resultado(j)=sum(total);
end
Datos=[Total;acumulado;Lt;Parcial];
end

