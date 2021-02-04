function [Total_final,posiciones,C] = voltajes_extremos(nuevo,Total)
[x1,y1]=size(nuevo);
Total_final=Total;
posiciones=[];
for k=1:nuevo(2,end)
    valor(k)=Total(1,k);
    [r,c]=find(Total==valor(k));
    if length(c)>1
        aux=Total(1,c-1);
        if all(aux==aux(1))
            %           disp('no es nodo')
            C=0;
        else
            C=c;
            c(find(c~=k))=c(find(c~=k))-1;
            %           disp('es nodo')
            valor_1=0;
            suma_total=[];
            
            for j=1:y1
                creacion=[nuevo(1,j):1:nuevo(2,j)];
                sumatoria=[];
                suma=0;
                for jj=1:length(c)
                    aux2=find(creacion==c(jj));
                    
                    if isempty(aux2)
                        %                     disp('No se suma');
                        sumatoria(jj)=0;
                        
                    else
                        a=[];
                        c(jj);
                        for jjj=1:length(creacion)
                            
                            if(creacion(jjj)==c(jj))
                                if find(C==c(jj))
                                    aux=Total(3,creacion(jjj));
                                    a=[a,aux];
                                    break;
                                else
                                    
                                    [r1,c1]=find(Total==Total(1,creacion(jjj)));
                                    aux=Total(3,creacion(jjj))/(length(c1));
                                    a=[a,aux];
                                    
                                    break;
                                end
              
                            else
                                [r1,c1]=find(Total==Total(1,creacion(jjj)));
                                
                                aux=Total(3,creacion(jjj))/(length(c1));
                                a=[a,aux];
                            end
                            
                        end
                        sumatoria(jj)=sum(a);
                        %                     disp('se suma');
                        
                    end
                    
                end
                suma=sum(sumatoria);
                suma_total(j)=suma;
            end
            
            valor_1=sum(suma_total);
            
            Total_final(3,C')=valor_1;
            
        end
        
    else
        C=0;
    end
    posiciones=[posiciones;C];
end
end