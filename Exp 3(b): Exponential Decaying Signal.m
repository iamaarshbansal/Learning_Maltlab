t = 0:0.01:5;                 % start : step : end
r = -1.5;                     % Assign the decay rate
x = exp(r * t);               % Compute the exponential decaying func
plot(t, x);                   % Plot graph
title('exponential func');    % Display title
axis([0 3 0 2]);              % Constrain the visible x and y axis
