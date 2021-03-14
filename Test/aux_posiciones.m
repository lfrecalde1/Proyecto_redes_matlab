function nuevo = aux_posiciones(posiciones)
[i_total,j_total]=size(posiciones);

%% generacion del vector auxiliar para las posiciones de forma columna de los datos
for i=1:j_total
    if i==1
        nuevo(:,i)=posiciones(:,i);
    else
        sumatoria=sum(posiciones(2,1:i));
        nuevo(1,i)=nuevo(2,i-1)+1;
        nuevo(2,i)=sumatoria;
    end
    
    
end

end