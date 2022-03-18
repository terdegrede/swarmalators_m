function [x0, y0, theta0] = ic_gen(N)
% This function allows to generate uniform initial conditions for the
% swarmalators model between a specified range.
% Inputs:
%         N : Number of particles;
%
% Outputs:
%         x0:
%         y0:
%         theta0:
%

pmax = 1;                       pmin = -1;
thmax = pi;                     thmin = -pi;


x0 = (pmax-pmin).*rand(N,1) + pmin;
y0 = (pmax-pmin).*rand(N,1) + pmin;
theta0 = (thmax-thmin).*rand(N,1) + thmin;
end