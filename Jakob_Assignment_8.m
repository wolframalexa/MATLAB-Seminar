clear all; close all; clc

%% Alexa Jakob
% ECE210-A: MATLAB Seminar, Spring 2020
% Week 8 Homework: 4/29/2020

%% Image Processing

monroe = imread("marilynMonroe.png");
einstein = imread("albertEinstein.png");

monroe(380,:) = []; % resize images, make same size
monroe(1,:) = [];
monroe(:,364) = [];
monroe(:,1) = [];

monroe = double(monroe)/255; % convert to double and normalize
einstein = double(einstein)/255; 

subplot(1,2,1)
imshow(monroe)
subplot(1,2,2)
imshow(einstein)


% prepare and plot filters
[X, Y] = meshgrid(1:size(monroe,2), 1:size(monroe,1));
sigma = 14;
a = size(monroe,1)/2; % find center pixel
b = size(monroe,2)/2;
g = exp(-((X-a).^2+(Y-b).^2)/(2*sigma^2)); % low pass filter
figure
graph = surf(g);
set(graph, 'LineStyle', 'none');
title('Low Pass Filter')

figure
g2 = 1-g;
graph2 = surf(g2);
set(graph2, 'LineStyle', 'none');
title('High Pass Filter')

% FFT
monroefft = fftshift(fft2(monroe));
einsteinfft = fftshift(fft2(einstein));

monroelpf = monroefft.*g; % apply lpf to monroe
einsteinhpf = einsteinfft.*g2; % apply hpf to einstein

figure
subplot(2,2,1)
imshow(monroelpf)
title('LPF: Monroe')

subplot(2,2,2)
imshow(einsteinhpf)
title('HPF: Einstein')

subplot(2,2,3)
imshow(monroefft)
title('Original: Monroe')

subplot(2,2,4)
imshow(einsteinfft)
title('Original: Einstein')
sgtitle('Images in the Frequency Domain')


% return to time domain
monroelpf_time = ifft2(fftshift(monroelpf));
einsteinhpf_time = ifft2(fftshift(einsteinhpf));

figure
subplot(1,2,1)
imshow(monroelpf_time)
title('LPF: Monroe')
subplot(1,2,2)
imshow(einsteinhpf_time)
title('HPF: Einstein')
sgtitle('Filtered images in time')

% average photos
avg = (monroelpf_time*1.5 + einsteinhpf_time)/2; %weighted for more Marilyn
figure
imshow(avg)

% you can see both Marilyn Monroe and Einstein in the same photo! wacky!

%% Bode Plots

syms f(t)
f = t^5*exp(2*t)+t^3*exp(3)*t*cos(4*t)+t*cos(10*t);
Laplacef = laplace(f);
[N, D] = numden(Laplacef);
cn = double(coeffs(N));
cd = double(coeffs(D));

H = tf(cn, cd);
figure
bode(H)
grid on
