dt = 0.01;                    % define sample step
t1 = -2:dt:2;                 % time for func 1
t2 = -2:dt:2;                 % time for func 2

x1 = double(t1 >= -1 & t1 <= 1); % x1(t) = 1 from -1 to 1
x2 = double(t2 >= -1 & t2 <= 1); % x2(t) = 1 from -1 to 1

y = conv(x1, x2) * dt;        % Cal. the Convo.
ty = (t1(1) + t2(1)):dt:(t1(end) + t2(end)); % time for Conv. Output

subplot(3, 1, 1);             % Plot first wave
plot(t1, x1);                 % Plot graph
title('First sq wave');       % title
xlabel('Time');               % give x-label
ylabel('Amplitude');          % give y-label

subplot(3, 1, 2);             % Plot 2nd wave
plot(t2, x2);                 % Plot graph
title('2nd wave');            % title
xlabel('Time');               % x-label
ylabel('Amplitude');          % y-label

subplot(3, 1, 3);             % Plot Output
plot(ty, y);                  % Plot graph
title('Conv. Output');        % title
xlabel('Time');               % x-label
ylabel('Amp');                % y-label
