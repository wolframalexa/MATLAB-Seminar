%%
% Alexa Jakob
% ECE210A: MATLAB Seminar
% Week 3 Homework, due 2/12/2020

function [val, ind] = findClosest(x, desiredValue);
    % Finds the closest value in x to the desiredValue
    y = x(:);
    diff = abs(x - desiredValue);
    ind = find(diff == min(diff));
    val = y(ind);
end
