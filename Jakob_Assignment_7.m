close all; clc

%% 
% Alexa Jakob
% ECE210-A: MATLAB Seminar, Spring 2020
% Week 7 Homework: 4/22/2020

%% Signal Setup
i = 1:50000;
t = 0:0.001:2;
[I, T] = meshgrid(i,t);
s = I.*T; % create matrix of values to evaluate at
s = sin(2*pi*s);
s = sum(s,1); % sum along each row as to sum for various values of i

%% Butterworth Lowpass
out_bl = filter(ButterworthLowpass,s);
fft_bl = fftshift(fft(out_bl));

figure
plot(i,fft_bl)
title('Fourier Transform of s through Butterworth Lowpass Filter')
xlabel('Frequency (Hz)')
ylabel('Signal Value')

%% Chebyshev I Highpass
out_chebihi = filter(ChebyshevIHighpass, s);
fft_chebihi = fftshift(fft(out_chebihi));

figure
plot(i,fft_chebihi)
title('Fourier Transform of s through Chebyshev I Highpass Filter')
xlabel('Frequency (Hz)')
ylabel('Signal Value')

%% Chebyshev II Bandstop
out_chebiistop = filter(ChebyshevIIBandstop, s);
fft_chebiistop = fftshift(fft(out_chebiistop));

figure
plot(i,fft_chebiistop)
title('Fourier Transform of s through Chebyshev II Bandstop Filter')
xlabel('Frequency (Hz)')
ylabel('Signal Value')

%% Elliptic Bandpass
out_elpass = filter(EllipticalBandpass, s);
fft_elpass = fftshift(fft(out_elpass));

figure
plot(i,fft_elpass)
title('Fourier Transform of s through Elliptic Bandpass Filter')
xlabel('Frequency (Hz)')
ylabel('Signal Value')