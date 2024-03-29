%% This is an example of the boundary layer element theta^0
% Summary of example objective

%% This section graphs \bar{theta}_1^0
% Description of first code block

clear; clc

t = 0.9;
epsilon = 1e-4;

% Domain settings
xRange = [0, 1];
yRange = [0, 1];

% Mesh settings
Nx = 2^7;
Ny = Nx;
meshSize = [Nx, Ny];
[meshX, meshY] = genMesh(xRange, yRange, meshSize);

% Time steps
n = 100;
Dt = t / n;

tic
soln = zeros(size(meshX));

% for i = 1:Nx+1
%     fprintf("Progress: %1.2f%%\n", i / (Nx + 1) * 100);
%     for j = 1:Ny+1
%         x = meshX(i, j);
%         soln(i, j) = sum(Phi_rDer(x, t - (Dt:Dt:t), epsilon));
%     end
% end

for j = 1:Ny+1
    x = meshX(1, j);
    soln(:, j) = sum(Phi_rDer(x, t - (Dt:Dt:t), epsilon));
end

toc
surf(meshX, meshY, soln);


%%

clear; clc

a = [0:0.2:1]
[x, y] = meshgrid(a, a)




