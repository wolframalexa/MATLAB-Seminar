clear; close all; clc

%%
% Alexa Jakob
% ECE210A: MATLAB Seminar
% Week 3 Homework, due 2/12/2020

%% Lunar Eclipse
% a, b
A = true(100);
B = false(100);
[i j] = meshgrid(1:100, 1:100);

%c, d
A = A & ~(sqrt((i-50).^2+(j-50).^2) < 20);
B = B | (sqrt((i-40).^2+(j-40).^2) < 20);

%e
figure
imshow(A) %centred black dot on a white background
figure
imshow(B) % upper left corner white dot on a black background
figure
imshow(A&B) % white crescent moon facing down on a black background
figure
imshow(A|B) % black crescent moon facing up on a white background
figure
imshow(~(A&B)) % black crescent moon facing down on a white background
figure
imshow(~(A|B)) % white crescent moon facing up on a black background

%% Sincing Ship
%a
x = linspace(-2*pi, 2*pi, 10001);
y = sinc(x);
plot(x,y)
title('Plot of the sinc function')
hold on

%b in attached file: findRoots.m

%c
roots = findRoots(y);
xRoots = x(roots);
yRoots = y(roots);
plot(xRoots, yRoots,'ko')

%d
dydx = diff(y)./diff(x);
droots = findRoots(dydx);
xMinMax = x(droots);
yMinMax = y(droots);
plot(xMinMax,yMinMax,'r*')

%% Fun with Find

[a, b] = findClosest(sin(linspace(0,5,100))+1, 3/2);
