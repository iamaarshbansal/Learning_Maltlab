t = -5:0.01:5;                % Define time limits
u = t >= 0;                   % Create the step signals
plot(t, u);                   % Plot graph
title('Unit step signal');    % Define title
axis([-5 5 -0.5 1.5]);        % Define axis bounds of x-y axis
grid off;                     % off the grid
