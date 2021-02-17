%% Programa para verificar el funcionamiento de la deteccion de los nodos en una red
clc,clear all,close all;
%% DEFINICION DE LOS POSTES EN NUMEROS SENCILLOS
a=23;
b=35;
c=56;
d=65;
f=78;
g=42;
h=3;
i=6;
j=10;
k=15;
l=28;
m=33;
n=43;
o=17;
p=15;

%% definicion de l;as longitudes de los postes

la=20.5;
lb=23.5;
lc=22.6;
ld=24.7;
lf=25.1;
lg=21.1;
lh=20.2;
li=20.7;
lj=25.8;
lk=26.5;
ll=27.3;
lm=28.5;
ln=29.3;
lo=30.2;
lp=31.6;

%% definicion del consumo de cada poste
ka=0.1;
kb=0.4;
kc=0.3;
kd=0.2;
kf=0.5;
kg=0.6;
kh=0.7;
ki=0.8;
kj=0.9;
kk=1.0;
kl=1.2;
km=1.6;
kn=1.8;
ko=2.6;
kp=3.5;

%% generacion del tipo de conductor
ca=81;
cb=81;
cc=283;
cd=283;
cf=283;
cg=81;
ch=81;
ci=283;
cj=81;
ck=81;
cl=283;
cm=283;
cn=283;
co=81;
cp=81;

%% GFENERAR DATOS DE LAS ENTRADAS DE POSTES

POSTE1=[a,b,c,d,f,g];
POSTE2=[h,c,d,f,g];
POSTE3=[n m f g];
POSTE4=[l j i f g];

LONG1=[la,lb,lc,ld,lf,lg];
LONG2=[lh,lc,ld,lf,lg];
LONG3=[ln,lm,lf,lg];
LONG4=[ll lj li lf lg];


K1=[ka,kb,kc,kd,kf,kg];
K2=[kh,kc,kd,kf,kg];
K3=[kn,km,kf,kg];
K4=[kl kj ki kf kg];

C1=[ca,cb,cc,cd,cf,cg];
C2=[ch,cc,cd,cf,cg];
C3=[cn,cm,cf,cg];
C4=[cl,cj,ci,cf,cg];

Datos_1=[POSTE1;LONG1;K1;C1];
Datos_2=[POSTE2;LONG2;K2;C2];
Datos_3=[POSTE3;LONG3;K3;C3];
Datos_4=[POSTE4;LONG4;K4;C4];

[i_1,j_1]=size(Datos_1(1,:));
[i_2,j_2]=size(Datos_2(1,:));
[i_3,j_3]=size(Datos_3(1,:));
[i_4,j_4]=size(Datos_4(1,:));

posiciones=[i_1,i_2,i_3,i_4;...
            j_1,j_2,j_3,j_4];
        
% 
% posiciones=[i_1,i_2,i_3;...
%             j_1,j_2,j_3];
%         

%% generacion de las posiciones en las que va a mover el vector
nuevo=aux_posiciones(posiciones);

%% generacion de la matrix de datos
Total=[Datos_1,Datos_2,Datos_3,Datos_4];

%% generacion de los nodos en todos los datos introducidos
[Total_final,busqueda,C] = voltajes_extremos(nuevo,Total);

%% generacion de donde se encontraron los nodos
unique(busqueda(busqueda>0));

%% calculo de las perdidas en los extremos del sistema
[resultado,Datos] = extremos_final(Total_final,nuevo,busqueda);

dato_min=min(resultado);
dato_max=max(resultado);

max_extremos=abs(dato_min-dato_max);
