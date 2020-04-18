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

% d
dVec = linspace(-5,5);

% e
A = [1+2j        1e-5;
     exp(j*2*pi) 3+4j];

% f
B = magic(5)/65;
% Checks for stochasticity:
S1 = sum(B); % is left stochastic since  == 1
S2 = sum(B, 2); % is right stochastic since == 1

% g
C = randn(5);

%% Vector and Matrix Operations
% a
d1 = dot(aVec, bVec1);
d2 = aVec.*bVec1';
d2 = sum(d2,'all');

% b
E = B*C;

% c
G = 1/4*A^3 + 1/4*A^2 + 1/3*A + 1/6*eye(size(A,1));

% d
H = inv(A);

% e
cVec_dim = size(cVec);
dVec_dim = size(dVec);