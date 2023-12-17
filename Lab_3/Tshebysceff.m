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

% Number of Elements (N), Elements' Spacing (d), Progressive Phase Shift (alpha), and Main-lobe to Side-lobe Level (Ro) 
N = input('Enter the Number of Elements (N): ');
Ro = input('Enter the Main-lobe to Side-lobe Level (Ro): ');
zo = cosh( (1 / (N - 1)) * acosh(Ro) );
alpha = input('Enter the Progressive Phase Shift (alpha): ');
d = input('Enter the Spacing between Elements w.r.t Lambda (d): ');
d = d * lambda;

% Defining psi && u && z
psi = alpha + (beta * d * cos(theta));
u = psi / 2;
z = zo .* cos(u);

%% Normalized Array Factor (AF_n)
AF = abs(chebyshevT(N-1, z));

%% Plotting AF vs z
figure(4)
plot(z, AF)
title('AF vs Z');

%% Plotting 2D Radiation Pattern of the Array
figure(5)
polarplot(theta, AF)
title('Tshebysceff Array - 2D Radiation Pattern');

%% Plotting 3D Radiation Pattern
[THETA PHI] = meshgrid(theta , phi);
psi = alpha + (beta * d * cos(THETA));
u = psi / 2;
z = zo .* cos(u);
AF = chebyshevT(N-1, z);

X = AF .* sin(THETA) .* cos(PHI);
Y = AF .* sin(THETA) .* sin(PHI);
Z = AF .* cos(THETA);

figure(3)
mesh(X,Y,Z)
title('Tshebysceff Array - 3D Radiation Pattern');