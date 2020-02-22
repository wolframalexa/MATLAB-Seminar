%% 
close all; clear all; clc
% Alexa Jakob
% ECE211: Signals and Systems, Homework #3, 2/25/2020

%% Question 2 b/c

h.data = [5 3 2 -2 -3];
h.start = 2;
last = numel(h.data)-h.start;
first = 1 - h.start;
h.range = first:last;

x.data = [2 3 4 5 6];
x.start = 3;
last = numel(x.data)-x.start;
first = 1 - x.start;
x.range = first:last;

y_data = conv(h.data,x.data);
y_range = h.range(1)+x.range(1):h.range(end)+x.range(end);

subplot(2,2,1);
stem(x.range, x.data)
title('Signal x')
xlabel('time')

subplot(2,2,2);
stem(h.range, h.data)
title('Signal h')
xlabel('time')

subplot(2,2,[3 4]);
stem(y_range, y_data)
title('Signal y, Convolution of x and h')
xlabel('time')

sgtitle('Question 2: Convolution')

%% Question 3
[b,a] = butter(3, [0.2, 0.5]);
[h,t] = impz(b,a,30);

figure
subplot(2,2,1);
stem(t,h)
title('Impulse response')
xlabel('n')
ylabel('x')

[h,t] = stepz(b,a,30);

subplot(2,2,2);
stem(t,h)
title('Unit step response')
xlabel('n')
ylabel('x')

n = 0:30;
x = cos(0.4*pi*n);
y = filter(b,a,x);

subplot(2,2,[3 4]);
stem(n,y)
title('Output of the filter with input x')
xlabel('n')
ylabel('x')

sgtitle('Question 3: Response of a Butterworth bandpass filter')