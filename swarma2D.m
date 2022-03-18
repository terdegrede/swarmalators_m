function [tv, X, Y, Theta]= swarma2D(x0, y0, theta0, N, J, k, F, omega, t0, dt, tf)
%
% This function allows to compute the forced swarmalators model.
%
%
% Inputs:
%       N: Number of swarmalators
%       x0: Vector of x-position initial conditions (Nx1)
%       y0: Vector of y-position initial conditions (Nx1)
%       theta0: Vector of phase initial conditions (Nx1)
%       J: Position coupling parameter 
%       k: Phase Coupling parameter
%       F: External force 
%       omega: Frequency of the external force 
%       t0: Initial time (usually 0)
%       dt: Time steps for numerical integration.
%       tf: Time span. Computation from t0 to tf with steps dt.
% Output:
%       tv: Vector of time
%       X: Matrix with x-axis positions of each oscillator over time. (tf+1 x N)
%       Y: Matrix with y-axis positions of each oscillator over time. (tf+1 x N)
%       Theta: Matrix with phases for each oscillator over time.      (tf+1 x N)
%
% Example:
%
% clc, clearvars, close all
% 
% %% Definition of parameters:
% % Model
% N= 50;
% 
% J= 0.1;
% k= 1;
% F= 0; 
% omega= 3*pi/2;
% 
% % Computation time
% t0= 0;
% dt= 0.1;
% tf= 200;
% 
% % Initial conditions
% [x0, y0, theta0] = ic_gen(N);
% 
% %% Computation of the model:
% [tv, X, Y, Theta]= swarma2D(x0, y0, theta0, N, J, k, F, omega, t0, dt, tf);
% disp('a')
% 
% %% Plotting:
% for n = dt:dt: tf
%     snap(X, Y, Theta, dt, n)
%     drawnow
%     pause(0.1)
% end

tspan= t0: dt: tf;

y0= [x0; y0; theta0]';

[tv, yv]= ode45(@(t, y) eq_def(t, y, N, k, omega, J, F), tspan, y0);

X= yv(:, 1: N); Y= yv(:, N+ 1:2*N); Theta= wrapTo2Pi(yv(:, 2*N+ 1: 3*N));
   
    
end