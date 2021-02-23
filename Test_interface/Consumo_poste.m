function [BasedatosS1] = Consumo_poste(N)
[~, ~, raw] = xlsread('Calculo_centro_carga_1.xlsm','CONSUMO POR POSTE');
raw = raw(7:N,1:5);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

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

