clear all; close all; clc

%% Alexa Jakob
% ECE211: Signals and Systems
% Homework: 5/5/2020

%% Question 2
ts = -1;
num = [1 0.5 0.4];
denom = [1 0.2 0.8];
H = tf(num,denom,ts);

zp= roots(num);
pp = roots(denom);
zplane(zp,pp)
title('Pole-Zero Plot')

% Notice how the poles and zeros are all on or inside the unit circle; this
% confirms that the system is minimum-phase

%% Question 3

var = 4;
v = sqrt(var)*randn(10000,1);
x = filter(num,denom,v);

rx = zeros(1,6);

for m = 0:1:5
   rx(m+1) = mean(x(m+1:end).*x(1:end-m)); % use large # samples for more accuracy
end

minusr = fliplr(rx);
rs = [minusr rx(2:end)]; % don't doublecount 0
m = -5:1:5;

figure
stem(m,rs)
title('Stem Plot of r_x')

R = toeplitz(rx); % M is 6, because there are 6 samples

e = eig(R); % eigenvalues of R
% All eigenvalues > 0: R is Hermitian positive definite


%% Question 4
[s_est,w] = pwelch(x,hamming(512),256,512);
figure
plot(s_est)
title('Estimated Power Spectral Density')
xlabel('rad/sample')
ylabel('Power')

w0 = (find(s_est == max(s_est)))*pi/256; % find index of max and normalize to [0 pi]

ang = angle(zp);
diff = w0-ang;
% Note that the difference between w0 and the angle of the poles are very
% small - this pole is what's causing the spike in PSD
