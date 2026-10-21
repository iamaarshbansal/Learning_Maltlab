t = -5:0.01:5;                % Define time span
ramp = t .* (t >= 0);         % Compute the ramp signal
plot(t, ramp);                % Plots the ramp func
title('Unit Ramp func');      % Define title
axis([-6 6 -1 6]);            % Define the visual boundaries
grid off;                     % grid is off
