close all; clear all; clc

%% 
% Alexa Jakob
% ECE210-A: MATLAB Seminar, Spring 2020
% Week 2 Homework: 2/5/2020

%% Vectors
interval = [0 1];
len = interval(2) - interval(1);
%a
x = linspace(interval(1), interval(2));
y = exp(x);
%b
trap = trapz(y)*len
rect = sum(y)*len
%c
cumtrap = cumtrapz(y);
cumtrap = cumtrap(end)
cumrect = cumsum(y);
cumrect = cumrect(end);
% The cumulative values are the same as in part B
%d
dydx = diff(y)./diff(x); % length 1x99
xhat = x(1:end-1);
d2ydx2 = diff(dydx)./diff(xhat); %length 1x98

%% Arrays
%a
A = 1:100;
A = reshape(A, [10 10]);
%b
B = magic(10);
a = diag(B);
C = diag(a);
%c
B(:,2) = flipud(B(:,2));
%d
A = fliplr(A);
%e
Asum = sum(A);
%f
AB = A.*B;
ABmean = mean(AB,2);
%g
A(:,end) = [];

%% Timing
tocs = [];
%a
tic
for i = 1:300
    for j = 1:500
        a(i,j) = (i^2+j^2)/(i+j+3);
    end
end
toc;
tocs = [tocs; toc];

%b
b = zeros(300,500);
tic
for i = 1:300
    for j = 1:500
        b(i,j) = (i^2+j^2)/(i+j+3);
    end
end
toc;
tocs = [tocs; toc];

%c
tic
i = 1:500;
j = 1:300;
[ihat, jhat] = meshgrid(i, j);
numer = ihat.^2 + jhat.^2;
denom = ihat + jhat + repmat(3, 300, 500);
Z = numer./denom;
toc;
tocs = [tocs; toc];

Methods = {'Without preallocation'; 'With preallocation with 0'; 'Elementwise'};
T = table(Methods, tocs)