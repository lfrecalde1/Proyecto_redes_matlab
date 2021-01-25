function [BasedatosS1] = Consumo_poste(N)
[~, ~, raw] = xlsread('/home/fer/MATLAB_1/Proyecto_redes_matlab/Base_datos.xlsm','CONSUMO POR POSTE');
raw = raw(7:N,1:5);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
BasedatosS1 = table;

%% Allocate imported array to column variable names
BasedatosS1.Item = data(:,1);
BasedatosS1.Poste = data(:,2);
BasedatosS1.Consumo = data(:,3);
BasedatosS1.Cantidad = data(:,4);
BasedatosS1.Numero = data(:,5);

%% Clear temporary variables
clearvars data raw;
end

