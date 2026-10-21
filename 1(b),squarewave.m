A = 5;                        % Amplitude
f = 5;                        % freq
t = 0:0.001:1;                % time
y = A * square(2 * pi * f * t); % square wave

plot(t, y);
xlim([0 1]);                  % x-axis limit
ylim([-5, 5]);                % y-axis limit
xlabel('time');               % give name to x-axis
ylabel('amp');                % give name to y-axis
title('Square Wave');         % give title
grid on;                      % turned grid on (must be lowercase 'on')
