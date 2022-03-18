function snap(X, Y, Theta, dt, T)
% Plots a snapshot at a fixed generation.
% Inputs:
%        X: [t+1 x N] Matrix with x-axis positions of each oscillator 
%                      over time.
%        Y: [t+1 x N] Matrix with y-axis positions of each oscillator 
%                      over time.
%        Theta: [t+1 x N] Matrix with phases for each oscillator over time.
%        T : Time of snapshot.
%
% Outputs:
%        []: Snapshot with oscillators positioned in the x-y plane where
%        the phases are represented by a color between a specified range.

sz = 20; % Size of the dots
T = round(T/dt); % Scaling

col = Theta(T,:); % Vector of colors
scatter(X(T, :), Y(T, :), sz, col, 'filled')
axis([min(X(:))-0.1 max(X(:))+0.1 min(Y(:))-0.1 max(Y(:))+0.1])
axis square

%% Uncomment for exporting animations

colormap jet
h = colorbar;
h.Ticks = [0 pi 2*pi];
h.TickLabelInterpreter = 'latex';
h.TickLabels = ["0", "$\pi$", "$2\pi$"];
caxis([0 2*pi])

end