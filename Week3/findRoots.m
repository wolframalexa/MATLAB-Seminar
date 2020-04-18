%%
% Alexa Jakob
% ECE210A: MATLAB Seminar
% Week 3 Homework, due 2/12/2020

function roots = findRoots(x);
    % Finds indices of roots of a given vectorized function. We know the
    % endpoints are roots in this case, but we won't count them here.
    y = (x >= 0); % creates logical array with 1 where x>=0
    origin = y(1:end-1);
    shift = y(2:end);
    y = xor(origin, shift);
    roots = find(y);
    
end