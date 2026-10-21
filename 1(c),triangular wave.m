A = 1;                        % amplitude
f = 5;                        % freq
t = 0:0.001:1;                % time
y = A * sawtooth(2 * pi * f * t, 0.5); 

plot(t, y);
xlabel('Time (s)');           % name x-axis
ylabel('Amplitude');          % name y-axis
grid on;                      % must be lowercase 'on'
