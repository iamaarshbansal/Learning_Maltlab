t = -3:0.01:3;                % start : step : end
x = 0.5 * t.^2 .* (t >= 0);   % The logical condition
figure;                       % open a new blank figure
plot(t, x);                   % Plot graph
title('Parabolic func');      % title for Parabolic function
axis([-2 3 -1 5]);            % manually sets the limits of x-y axis
grid off;                     % grid is off
