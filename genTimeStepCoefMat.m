function coefMat = genTimeStepCoefMat(meshSize, epsilon, Dt, stepSize)
%GENTIMESTEPCOEFMAT Generate the matrix for the backward Euler method in time.
%   Output:: coefMat: 2D matrix that is the LHS matrix in the backward Euler time method 

M = meshSize(1) - 1;  % iMax
N = meshSize(2) - 1;  % jMax
MN = M * N;

D = gallery('tridiag', N, -1, 4, -1);  % Block Poisson matrix
DPoisson = kron(spdiags(ones(M, 1), 0, M, M), D);  % Tridiagonal block matrix; note that speye does not support gpuArray
offDiagArr = repmat(-1, MN, 1);
DPoisson = DPoisson + spdiags(offDiagArr, N, MN, MN) + spdiags(offDiagArr, -N, MN, MN);
DPoisson = -DPoisson;

coefMat = spdiags(ones(MN, 1), 0, MN, MN) - (epsilon * Dt / stepSize ^ 2) .* DPoisson;  % note that speye does not support gpuArray

class(coefMat)

end

