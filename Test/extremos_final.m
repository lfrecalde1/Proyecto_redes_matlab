function [resultado,Datos] = extremos_final(Total,nuevo,C,Parametros)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%% generacion de las constantes para el calculo de la perdida
v=Parametros.voltage;
radio_cuadrado=Parametros.operador;
resistividad=Parametros.resistividad;

[x1,y1]=size(nuevo);
%% bucle para el calculo de las perdidas y las caidas de voltaje
for j=1:y1
    creacion=[nuevo(1,j):1:nuevo(2,j)];
    [i_dato,j_dato]=size(creacion);
    total=[];
    total_2=[];
    
    for k=1:j_dato
        for kk=1:length(C)
            if creacion(1,k)==C(kk)
                acumulado(creacion(1,k))=Total(3,creacion(1,k));
                
                %% seccion para las perdidas
                [r1,c1]=find(Total==Total(1,creacion(1,k)));
                
                acumulado_aux(creacion(1,k))=Total(3,creacion(1,k));
                
                Lt_aux(creacion(1,k))=Total(2,creacion(1,k))*acumulado_aux((creacion(1,k)));
                
                Parcial_aux(creacion(1,k))=Lt_aux(creacion(1,k))/Total(4,creacion(1,k));
                
                subtotal(creacion(1,k))=120*Parcial_aux(creacion(1,k))/100;
                
                corriente_conductor(creacion(1,k))=((acumulado_aux(creacion(1,k))*0.86*1000)/(v-subtotal(creacion(1,k))))/length(c1);
                
                resistencia_conductor(creacion(1,k))=resistividad*(Total(2,creacion(1,k))/radio_cuadrado);
                
                perdidaa_potencia(creacion(1,k))=resistencia_conductor(creacion(1,k))*( corriente_conductor(creacion(1,k))^2)*length(c1);
                
                total_2(k)=resistencia_conductor(creacion(1,k))*( corriente_conductor(creacion(1,k))^2)*length(c1);
                
                break
            else
                acumulado(creacion(1,k))=sum(Total(3,creacion(1,1):creacion(1,k)));
                %% seccion para las perdidas
                acumulado_aux(creacion(1,k))=sum(Total(3,creacion(1,1):creacion(1,k)));
                
                Lt_aux(creacion(1,k))=Total(2,creacion(1,k))*acumulado_aux((creacion(1,k)));
                
                Parcial_aux(creacion(1,k))=Lt_aux(creacion(1,k))/Total(4,creacion(1,k));
                
                subtotal(creacion(1,k))=120*sum(Parcial_aux(creacion(1,1):creacion(1,k)))/100;
                
                corriente_conductor(creacion(1,k))=(acumulado_aux(creacion(1,k))*0.86*1000)/(v-subtotal(creacion(1,k)));
                
                resistencia_conductor(creacion(1,k))=resistividad*(Total(2,creacion(1,k))/radio_cuadrado);
                
                perdidaa_potencia(creacion(1,k))=resistencia_conductor(creacion(1,k))*( corriente_conductor(creacion(1,k))^2);
                
                total_2(k)=resistencia_conductor(creacion(1,k))*( corriente_conductor(creacion(1,k))^2);
                
            end
        end
  
    
        Lt(creacion(1,k))=Total(2,creacion(1,k))*acumulado((creacion(1,k)));
        
        Parcial(creacion(1,k))=Lt(creacion(1,k))/Total(4,creacion(1,k));
        
        total(k)=(Total(2,creacion(1,k))*acumulado((creacion(1,k))))/Total(4,creacion(1,k));
        
        %% almacenamiento
      
       
        
    end
    
    resultado.voltajes_extremos(j)=sum(total);
    
    resultado.perdidas(j)=sum(total_2)/1000;
    
    resultado.perdida.mes(j)=resultado.perdidas(j)*720;
    
    resultado.costo.mes(j)=(resultado.perdidas(j)*720)*0.11;
    
    resultado.costo.anual(j)=((resultado.perdidas(j)*720)*0.11)*12;
    
    resultado.perdida_total=sum(resultado.costo.anual(1:j));
    
end
dato_min=min(resultado.voltajes_extremos);
dato_max=max(resultado.voltajes_extremos);

resultado.variacion_extremos=abs(dato_min-dato_max);

Datos=[Total;acumulado;Lt;Parcial;subtotal;resistencia_conductor;corriente_conductor;perdidaa_potencia];
end