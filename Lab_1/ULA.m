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
gamma = 0 : 0.01 : (2 * pi);

% Array Spacing
d = input('Enter the Array Spacing w.r.t Lambda: ');
d = d * lambda;

% Number of Elements
n = input('Enter the Number of Elements: ');

% Progressive Phase Shift
alpha = input('Enter the Progressive Phase Shift w.r.t pi: ');
alpha = alpha * pi;

% Defining psi
psi = alpha + (beta * d * cos(gamma));

%% Normalized Array Factor (AF_n)

AF_n = sin(n * psi / 2) ./ (n * sin(psi / 2));


%% Plotting AF_n vs psi

figure(1)
plot(psi , abs(AF_n));
title('Array Factor vs Psi');


%% Plotting 2D Radiation Pattern

figure(2)
polarplot(gamma , abs(AF_n))
title('Uniform Linear Array - 2D');


%% Plotting 3D Radiation Pattern

[THETA PHI] = meshgrid(theta , phi);
psi = alpha + (beta * d * cos(THETA));
AF_n = sin(n * psi / 2) ./ (n * sin(psi / 2));

X = AF_n .* sin(THETA) .* cos(PHI);
Y = AF_n .* sin(THETA) .* sin(PHI);
Z = AF_n .* cos(THETA);

figure(3)
mesh(X,Y,Z)
title('Uniform Linear Array - 3D');
