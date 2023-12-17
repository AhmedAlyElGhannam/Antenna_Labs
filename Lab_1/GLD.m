%% Prepreparations

clear
close all
clc 


%% Initial Parameters

% Wavelength
f=3e8;
c=3e8;
lambda=c/f;

beta = (2 * pi) / lambda;
theta = 0 : 0.01 : (2 * pi);
phi = 0 : 0.01 : (2 * pi);

% Length of Dipole
x = input('Enter the Length of Dipole w.r.t Lambda: ');
l = x * lambda;

%% Normalized Electric Field (far field approximation)

if (l <= lambda/10) % short and infinitismal dipole have the same expression
    En = sin(theta);
elseif (l > lambda/10) % using the expression for general length dipole
    En = (cos((beta*l/2)*cos(theta)) - cos(beta*l/2)) ./ sin(theta); 
end


%% Plotting 2D Radiation Pattern
figure(1)
polarplot(theta , abs(En))
title('General Length Dipole - 2D');

%% Plotting 3D Radiation Pattern

[THETA PHI] = meshgrid(theta , phi);
En = (cos((beta*l/2)*cos(THETA)) - cos(beta*l/2))./ sin(THETA);

X = En .* sin(THETA) .* cos(PHI);
Y = En .* sin(THETA) .* sin(PHI);
Z = En .* cos(THETA);

figure(2)
mesh(X,Y,Z)
title('General Length Dipole - 3D');