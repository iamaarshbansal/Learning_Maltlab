t = -2:0.01:2;                % Create a time vector
impulse = (t == 0);           % Define impulse func
plot(t, impulse);             % Plot graph
title('Unit impulse');        % Shows title of graph
axis([-1 2 -0.5 1.2]);        % It limits the x-y axis
