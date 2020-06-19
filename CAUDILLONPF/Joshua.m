
%% PROGRAMA PARA CALCULAR PROMEDIOS CIERTO INTERVALO DE TIEMPO
clear all
close all
clc

%% CARGAR DATOS
datos = uigetfile({'*.txt','Archivos formato (*.txt)';...
                  '*.dat','Archivos formato (*.dat)';...
                  '*.*', 'Todos los archivos (*,*)'},...
                  'Selecciona el archivo de entrada');

data = load(datos); %se puede seleccionar un txt que contiene la concentración numérica
diam = [20,30,50,70,100,200]; %diámetros


[ren,col] = size(data); %Calcula el tamaño de la matriz, número de renglones y columnas 

% Para convertir las celdas que contienen ceros en NaN,
for i = 1:ren
    for j = 1:col
        if data(i,j) == 0
            data(i,j) = NaN;
        end
    end
end



%% Para obtener la matriz de los datos cada tiempo que se decidio promediar
time = 1:col; %crea un vector con numeros de 1 en 1 hasta size(columna)
load('date22abr.mat')
date = date22abr;

%% GRAFICAR
h = figure;
% Para la superficie en colores (rainbow)
[X,Y] = meshgrid(time,diam); %crea el meshgrid
pcolor(date,diam,data); % rellena el mesgrid con los datos
colormap jet %escala la colores
shading interp %escala la colores
% Para lo títulos del gráfico
title({' ';(char('\bf Observation Date: 22/04/2017'))});
xlabel('\bf Date/Time','Fontsize',14)
ylabel('\bf Diameter (nm)','Fontsize',14)
ylim([min(diam),max(diam)]);
% Para una escala de colores
c = colorbar;
ylabel(c,{'\bf (p/cm^3)'}) %label eje y
yticks([20 30 50 70 100 200])
%yticklabels({'20','30','50','70','100','200'})
caxis([0 10^3.75]); %rango de c axis  
% Para el formato del fondo de la gráfica
grid on
set(gca,'FontName','Corbel','FontSize',14)
set(gcf,'Color',[1,1,1]);  
set(gca, 'YScale', 'log'); %activar solo en caso log scale en eje y

