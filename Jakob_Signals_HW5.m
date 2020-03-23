clear all; close all; clc

%% 
% Alexa Jakob, ECE211 HW5 3/31/2020

%% Question 8

% set up windows
N =15;
r=30;
beta=3.05;
hr = rectwin(N); % rectangular window
hc = chebwin(N,r); % Chebyshev window
hk = kaiser(N,beta); % Kaiser window

hr = hr/sum(hr); % normalize windows
hc = hc/sum(hc);
hk = hk/sum(hk);

w = linspace(0,pi,1000);
Hr = freqz(hr,1,w); % find frequency responses
Hc = freqz(hc,1,w);
Hk = freqz(hk,1,w);
mag_Hr = 20*log10(abs(Hr)); % magnitude of frequency response
mag_Hc = 20*log10(abs(Hc));
mag_Hk = 20*log10(abs(Hk));

% plot magnitude of frequency responses on the same plot
plot(w,mag_Hr);
hold on
plot(w,mag_Hc);
hold on
plot(w,mag_Hk);

title('Magnitude response of various windows')
xlabel('Frequency (rad)')
ylabel('Magnitude (dB)')
legend('Rectangular window','Chebyshev window','Kaiser window','Location','northeast')
axis([0 pi -50 0])

% plot the three windows in time
figure
subplot(3,1,1)
stem(hr)
xlabel('n')
ylabel('w')
title('Rectangular window')

subplot(3,1,2)
stem(hc)
title('Chebyshev window')
xlabel('n')
ylabel('w')

subplot(3,1,3)
stem(hk)
title('Kaiser window')
xlabel('n')
ylabel('w')

sgtitle('Windows in the time domain')

% phase of frequency response of rectangular window and plot
ph_Hr = unwrap(angle(Hr)*180/pi);

figure
plot(w,ph_Hr);

title('Phase Response of Rectangular Window')
xlabel('Frequency (rad)')
ylabel('Unwrapped Phase (degrees)')

%% Question 9

fp = [12e3,15e3];
fs = [10e3,16e3];

rp = 1.5;
rs = 30;
[n,wn] = ellipord(2*pi*fp, 2*pi*fs, rp, rs, 's');
[z,p,k] = ellip(n,rp,rs,wn,'s');
[b,a] = zp2tf(z,p,k);

w = linspace(0,20e3,1000); % in Hertz
w = 2*pi*w; % in rad/sec
H = freqs(b,a,w);
mag_H = 20*log10(abs(H));
ph_H = unwrap(angle(H)*180/pi);

% plot magnitude and phase response
figure
subplot(2,1,1)
plot(w/(2*pi),mag_H)
title('Frequency response')
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
axis([0 2e4 -75 5])

subplot(2,1,2)
plot(w/(2*pi),ph_H)
title('Phase response')
xlabel('Frequency (Hz)')
ylabel('Unwrapped Phase (degrees)')
axis([0 2e4 -400 0])
sgtitle('Question 9')

% plot poles and zeros in the s plane
figure
plot(z,"o")
hold on
plot(p,"x")
plot([0 0], [-1.5e5 1.5e5]) % y axis
plot([-4000 100], [0 0]) % x axis
axis([-4000 100 -1.5e5 1.5e5])
legend('Zeros','Poles','Location','bestoutside')
title("Poles and Zeros of the elliptical filter's transfer function in the s-plane")
xlabel("\sigma")
ylabel("j\omega")
% Notice that all poles are in the LHP and zeros are on the jw axis 

%% Question 10
% define filter
fsamp = 40e3;
Bnyq = fsamp/2;
fpd = fp/Bnyq;
fsd = fs/Bnyq;
[nd,fnd] = ellipord(fpd,fsd,rp,rs); %frq specs normalized to Nyq BW
[zd,pd,kd] = ellip(nd,rp,rs,fnd);
[bd,ad] = zp2tf(zd,pd,kd);

w = w/(2*pi); % back to Hertz
wd = 2*pi*w/fsamp; % [radians]
Hd = freqz(bd,ad,wd);
mag_Hd = 20*log10(abs(Hd));
ph_Hd = unwrap(angle(Hd)*180/pi);

% plot magnitude and phase response
figure
subplot(2,1,1)
plot(w,mag_Hd)
title('Frequency response')
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')


subplot(2,1,2)
plot(w,ph_Hd)
title('Phase response')
xlabel('Frequency (Hz)')
ylabel('Unwrapped Phase (degrees)')
sgtitle('Question 10')

figure
zplane(zd,pd)
title('Zeros and Poles of the digital filter (10)')
% Notice how all zeros are on the unit circle and all poles are in the LHP

disp(nd)
disp(n) 
% Notice that the order of the filter in 10 is lower than the order of the
% filter in 9, allowing it to be built with fewer elements. The
% specifications are met in both cases, analog and digital.
