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
coeffs = sys.A;
    
last = size(goog,1);
goog = [goog; zeros(10,1)];
for n = 1:10
    temp = goog(last+n-10:last+n-1);
    goog(last+n) = sum(sys.D + sys.NoiseVariance + sum(coeffs.*temp));
end

% that's a lot higher than I would expect given the previous values

%% Walking
walks = ones(50,300);
walks = -walks;
temp = 2*randi([0 1],50,300);
walks = walks + temp;

figure
n = 1:size(walks,2);
for i = 1:size(walks,1)
    plot(n,walks(i,:))
    hold on
end
title('Equal Probability Walks')

pmf = [0.25, 0.75];
population = [-1 1];
sample_size = 300;
walks2 = zeros(50,300);

for i=1:50
    walks2(i,:) = randsample(population,sample_size,true,pmf);
end

figure
for i = 1:size(walks2,1)
    plot(n,walks2(i,:))
    hold on
end
title('Weighted towards 1 (75%)')
% more spacing between points

