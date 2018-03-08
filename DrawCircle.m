function [ ] = DrawCircle ( )
%Draw chosen points of a circle. 
%radius R
%center (x0,y0)
%number of chosen points N

R=2;
x0=1;
y0=3;
N=20;

%first alternative is to pick x-coordinates evenly
dx=2*R/(N-1);%step size, note the number of intervals is ONE LESS than points
x=[-R:dx:R];
y=(R^2-x.^2).^0.5;
Xx=x+x0;%shifting the origin
Yx=y+y0;%shifting the origin

%second alternative is to pick angular coordinates evenly
da=2*pi/N;%step size, note the number of intervals EQUALS points
a=[0:da:2*pi];
r=repmat(R,size(a));
Xa=x0+r.*cos(a);%shifting the origin
Ya=y0+r.*sin(a);%shifting the origin

%plotting
figure(1);
clf;

horz=3;
vert=2;

subplot(vert,horz,[3]);
hold on;
plot(Xx,Yx,'bo-');
plot(Xx,-(Yx-y0)+y0,'bo-');
plot(x0,y0,'bo');
axis equal;
title('equal spacing in x');

subplot(vert,horz,[6]);
hold on;
plot(Xa,Ya,'rs--');
plot(x0,y0,'rs');
axis equal;
title('equal spacing in angle');

subplot(vert,horz,[1 2 4 5]);
hold on;
plot(Xx,Yx,'bo-');
plot(Xx,-(Yx-y0)+y0,'bo-');
plot(Xa,Ya,'rs--');
plot(x0,y0,'kx');
axis equal;

end