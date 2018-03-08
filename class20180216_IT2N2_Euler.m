function [] = class20180216_IT2N2_Euler (fig,x0,y0,h,xend)
%Solving 1st order ordinary differential equation of type 
%y'(x)=f(x,y) with initial condition y(x0)=y0 
%using Euler's algorithm with uniform grid spacing h. 

[xE,yE]=Euler(x0,y0,h,xend);
Visualization(fig,xE,yE,'y',x0,y0);

end%class20180216_IT2N2_Euler

function [x,y] = Euler (x0,y0,h,xend)
%
%initial condition
x(1)=x0;
y(1)=y0;

Nsteps=floor((xend-x0)/h);
n=0;%counter
for(n=1:Nsteps)
    x(n+1)=x(n)+h;
    k=ODE(x(n),y(n));
    y(n+1)=y(n)+k*h;
end%for

end%Euler

function [Dy] = ODE (x,y)
Dy=cos(x);
end%ODE
function [y] = Analytic (x0,y0,x)
C=y0-sin(x0);
y=sin(x)+C;
end%ODE

function [] = Visualization (fig,x,y,analytic,x0,y0)

figure(fig);
clf;
hold on;
plot(x,y,'b.-');
grid on;
xlabel('x');
ylabel('y');
legend('Euler');
if(analytic=='y')
    ya=Analytic(x0,y0,x);
    plot(x,ya,'ro');
end

end