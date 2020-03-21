%% PROGRAMA PARA CALCULAR PROMEDIOS CIERTO INTERVALO DE TIEMPO
clear all
close all
clc

%% CARGAR DATOS
datos = uigetfile({'*.txt','Archivos formato (*.txt)';...
                  '*.dat','Archivos formato (*.dat)';...
                  '*.*', 'Todos los archivos (*,*)'},...
                  'Selecciona el archivo de entrada');

data = load(datos);
% diam = data(:,1);
diam = [20,30,50,70,100,200];
% data = data(:,2:end);


[ren,col] = size(data);

% Para convertir las celdas que contienen ceros en NaN,
% Con la intención de promediar con el comando nanmean.
for i = 1:ren
    for j = 1:col
        if data(i,j) == 0
            data(i,j) = NaN;
        end
    end
end



%% Para obtener la matriz de los datos cada tiempo que se decidio promediar
time = 1:col;
load date16


%% GRAFICAR
h = figure;
% Para la superficie en colores (rainbow)
[X,Y] = meshgrid(time,diam);
pcolor(date,diam,data);
colormap jet
shading interp
% Para lo títulos del gráfico
title({' ';(char('\bf Observation Date: 16052018'))});
xlabel('\bf Date/Time')
ylabel('\bf Diameter (nm)')
ylim([min(diam),max(diam)])
% Para una escala de colores
c = colorbar;
ylabel(c,{'\bf (p/cm^3)'})
caxis([0 10^3.75]);  
% Para el formato del fondo de la gráfica
grid on
set(gca,'FontName','Corbel','FontSize',14)
set(gcf,'Color',[1,1,1]);  

