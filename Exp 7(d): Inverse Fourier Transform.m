% Exp 7(d): Inverse Fourier Transform
a = 2;                      % Sets constant as a = 2
t = -1:0.01:10;             % Creates time vector
F = zeros(size(t));         % Creates an array to store values

for i = 1:length(t)         % Repeats calculation for every time value
    F(i) = real((1/(2*pi)) * integral(@(w) (1./(a + 1i*w)) .* exp(1i*w*t(i)), -500, 500));
end

plot(t, F);                 % Plot graph
title('Inverse Fourier transform'); % Gives title
xlabel('Time');             % Gives x-label
ylabel('Amplitude');        % Gives y-label
