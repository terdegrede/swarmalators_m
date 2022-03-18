clc, clearvars, close all

%% Definition of parameters:
% Model
N= 50;

J= 1;
k= 0;
F= 0; 
omega= 3*pi/2;

% Computation time
t0= 0;
dt= 0.1;
tf= 100;

% Initial conditions
[x0, y0, theta0] = ic_gen(N);

%% Computation of the model:
[tv, X, Y, Theta]= swarma2D(x0, y0, theta0, N, J, k, F, omega, t0, dt, tf);
disp('a')

% %% Plotting:
% for n = dt:1: tf
%    
%     snap(X, Y, Theta, dt, n)
%     drawnow
%     pause(0.1)
%     saveas(gcf,['temp' num2str(n) '.jpg']);
% 
% end


%% Video
v = VideoWriter('test.avi');
open(v);
an = [];
for n = dt:0.1:tf

    snap(X, Y, Theta, dt, n)
    dim = [0.2 0.1 0.1 0.1];
    str=sprintf('$F = 0.01\\Omega t$, $t= $%.2f',n); %if No floting varibale number, use %d
    delete(an)
    an = annotation('textbox',dim,'String',str,'FitBoxToText','on','Interpreter','latex');
    frame = getframe(gcf);
    writeVideo(v, frame);
end
close(v)