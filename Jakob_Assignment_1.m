clear; close all; clc

%%
% Alexa Jakob
% ECE210-A: MATLAB Seminar, Spring 2020
% Week 1 Homework

%% Creating Scalar Variables

a = 5.7*pi/6.9;
b = 239 + exp(5) - 2.5e23;
c = log(4.23)*asin(0.7);
z = (3+2j)*(4+5j);

%% Complex Operations

z_Re = real(z);
z_Im = imag(z);
z_Phase = angle(z);
z_bar = conj(z);

%% Vector and Matrix Variables

% a
aVec = [3.14 15 9 26+0.1j];
A1 = repmat(aVec,3,1);
A2 = [aVec; aVec; aVec];

% b
bVec1 = aVec.';
bVec2 = transpose(aVec);

% c
cVec = -5:0.1:5;