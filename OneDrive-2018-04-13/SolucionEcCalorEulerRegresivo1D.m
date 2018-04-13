function SolucionEcCalorEulerRegresivo1D()
h = 0.01;
x = 0:h:1;
m=100;%tiempo
T=5; %tiempo final
t= linspace(0,T,m+1); % malla en el tiempo
xi = 0.5-abs(0.5-x)';
kappa = [1.e+6 1.e+6];
g =[0 0];
coef_dif=inline('1','x');
fuente= inline('2*x','x');
A= EnsambleRigidez1D(x,coef_dif,kappa);
M= EnsambleMasa1D(x);
b= EnsambleCarga1D(x,fuente,kappa,g);
for l = 1:m
k= t(l+1) -t(l);
xi = (M+k*A)\(M*xi+k*b); % regresivo
%xi= xi+k*M\(b-A*xi);% progresivo
plot(x,xi), axis([0 1 0 0.5]), pause(0.1)
end