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

% Number of Elements (N), Elements' Spacing (d), and Progressive Phase Shift (alpha)
N = input('Enter the Number of Elements (N): ');
alpha = input('Enter the Progressive Phase Shift (alpha): ');
d = input('Enter the Spacing between Elements w.r.t Lambda (d): ');
d = d * lambda;

% Defining psi && u
psi = alpha + (beta * d * cos(theta));
u = psi / 2;

%% Normalized Array Factor (AF_n)
AF_n = cos(u) .^ (N - 1);

%% Plotting AF_n vs u
figure(1)
plot(u , abs(AF_n));
title('AF vs. u');

%% Plotting 2D Radiation Pattern of the Array
figure(2)
polarplot(theta, abs(AF_n));
title('Binomial Array - 2D Radiation Pattern');

%% Plotting 3D Radiation Pattern
[THETA PHI] = meshgrid(theta , phi);
psi = alpha + (beta * d * cos(THETA));
u = psi / 2;
AF_n = cos(u) .^ (N - 1);

X = AF_n .* sin(THETA) .* cos(PHI);
Y = AF_n .* sin(THETA) .* sin(PHI);
Z = AF_n .* cos(THETA);

figure(3)
mesh(X,Y,Z)
title('Binomial Array - 3D Radiation Pattern');