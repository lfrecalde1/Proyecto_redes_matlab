function [Basedatos] = kvam()
%% Import the data
[~, ~, raw] = xlsread('Calculo_centro_carga_1.xlsm','kVA-m');
raw = raw(2:36,1:8);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
stringVectors = string(raw(:,[1,2]));
stringVectors(ismissing(stringVectors)) = '';
raw = raw(:,[3,4,5,6,7,8]);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
Basedatos = table;

%% Allocate imported array to column variable names
Basedatos.CONDUCTOR = stringVectors(:,1);
Basedatos.TIPOFASE = categorical(stringVectors(:,2));
Basedatos.SECCION = data(:,1);
Basedatos.FASE = data(:,2);
Basedatos.NEUTRO = data(:,3);
Basedatos.Trifsica = data(:,4);
Basedatos.Bifsica = data(:,5);
Basedatos.Monofsica = data(:,6);

%% Clear temporary variables
clearvars data raw stringVectors R;
end

