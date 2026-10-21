dt = 0.01;                    % define sample step
t1 = -3:dt:3;                 % time for func 1
t2 = -2:dt:2;                 % time for func 2

x1 = double(t1 >= -2 & t1 <= 2); % x1(t) = 1 from -2 to 2
x2 = double(t2 >= -1 & t2 <= 1); % x2(t) = 1 from -1 to 1

y = conv(x1, x2) * dt;        % Calculate the Conv.
ty = (t1(1) + t2(1)):dt:(t1(end) + t2(end)); % time vector for Convolution output

% Plotting the signals and convolved output
subplot(3, 1, 1);
plot(t1, x1);
title('First sq wave');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t2, x2);
title('2nd wave');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(ty, y);
title('Conv. Output');
xlabel('Time');
ylabel('Amp');
