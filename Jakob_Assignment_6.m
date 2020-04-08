close all; clear all; clc

%% 
% Alexa Jakob
% ECE210-A: MATLAB Seminar, Spring 2020
% Week 6 Homework: 4/8/2020

%% Z-Transform

num = [3/7 2/3 1/2];
denom = [1/2 1/3 2];
zplane(num,denom)
title('Poles and Zeros')

[h,t] = impz(num,denom,50);
figure
stem(t,h)
title('Impulse Response')
xlabel('n')
ylabel('coefficients')

n = 0:49;
x = (-3/4).^n;
out1 = filter(num,denom,x);
out2 = conv(x,h);
out2(51:end) = []; % for plotting

figure
subplot(2,1,1)
stem(out1)
title('filter command')
xlabel('n')
ylabel('coefficients')

subplot(2,1,2)
stem(n,out2)
title('conv command')
xlabel('n')
ylabel('coefficients')

%% Fibonacci

fib = zeros(100,1);
fib(2) = 1;
for i = 3:100
    fib(i) = fib(i-1) + fib(i-2)
end

figure
semilogy(fib)
title('Fibonacci Sequence')
xlabel('Index of number')
ylabel('Logarithmic scale')

fibout = conv(x,fib);
figure
stem(fib)
title('Output of system with Fibonacci impulse response')
xlabel('n')
ylabel('coefficient')