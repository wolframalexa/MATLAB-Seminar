%%
% Alexa Jakob
% ECE210A: MATLAB Seminar
% Week 3 Homework, due 2/12/2020
% Bonus Problem

%%
function linearInd = sub2ind(matrixSize, rowSub, colSub)
    % Implementation of the sub2ind function in 2d: takes row and column
    % indices and matrix size, and returns the associated linear index
    linearInd = rowSub + matrixSize(1)*(colSub-1)
end
