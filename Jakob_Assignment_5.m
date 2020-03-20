close all; clear all; clc
format short

%% 
% Alexa Jakob
% ECE210-A: MATLAB Seminar, Spring 2020
% Week 5 Homework: 3/25/2020

%% OOP
load fisheriris

for i = 1:150
    a = meas(i,1);
    b = meas(i,2);
    c = meas(i,3);
    d = meas(i,4);
    chars = species{i};
    flowers{i,1} = Flower(a,b,c,d,chars);
end

sepal_25 = getSLength(flowers{25});
if sepal_25 == meas(25,1)
    fprintf("Value for sepal length is correct.\n")
end

report(flowers{1}) % example of using report


%% Bonus Points
% 2
r = exp(pi*sqrt(163));
r_sym = sym(r);
r_30 = vpa(r_sym,30);
r_100 = vpa(r_sym,100);

table(r, r_30, r_100)

%% 3
vpaPi = vpa(pi,10001);
strPi = sym2cell(vpaPi);

digits = zeros(10,1);
for i = 1:10001
    j = str2num(strPi(i));
    digits(j) = digits(j)+1;
end
histogram(digits);
