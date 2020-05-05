clear all; close all; clc

%% Alexa Jakob
% ECE210-A: MATLAB Seminar, Spring 2020
% Week 9 Homework: 5/6/2020

%% Google Stock

goog = readmatrix("GOOG.csv");
goog(:,1) = []; % drop all dates
n = 1:size(goog,1);

plot(n,goog)

sys = ar(goog,10,'ls');
coeffs = -1*sys.A(2:end);
    
last = size(goog,1);
goog = [goog; zeros(10,1)];
for n = 1:10
    temp = goog(last+n-10:last+n-1);
    goog(last+n) = sys.D + sum(coeffs.*temp');
end


%% Walking
walks = zeros(50,300);
for i = 1:50
    current = 0;
    for j = 1:300
        walks(i,j) = current + randsrc;
        current = walks(i,j);
    end
end

figure
plot(walks)
title('Equal Probability Walks')

walks2 = zeros(50,300);
for i = 1:50
    current = 0;
    for j = 1:300
        walks2(i,j) = current + randsrc(1,1,[-1 1; 0.25 0.75]);
        current = walks2(i,j);
    end
end

figure
plot(walks2)
title('Weighted towards 1 (75%)')

% upper half-plane, whereas equal goes up and down

