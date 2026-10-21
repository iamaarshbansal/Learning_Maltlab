% Aim: To calculate and plot the Fourier Transform (Magnitude and Phase
% spectrum) of a decaying exponential signal e^(-at) u(t) using MATLAB.

a = 2;                        % decay rate
w = -10:0.1:10;               % frequency range from -10 to 10

F = zeros(size(w));           % Array to store result for each frequency

for i = 1:length(w)
    F(i) = integral(@(t) exp(-a*t).*exp(-1i*w(i)*t), 0, inf);
end                           % Formula = F(w) = int_0^inf e^(-at) e^(-jwt) dt

magnitude = abs(F);           % Magnitude of Fourier Transform
phase = angle(F);             % Phase in radians

% Magnitude spectrum
subplot(2, 1, 1);
plot(w, magnitude, 'LineWidth', 1.5);
title('Fourier Transform Magnitude Spectrum');
xlabel('Frequency (\omega)');
ylabel('|F(\omega)|');

% Phase spectrum
subplot(2, 1, 2);
plot(w, phase, 'LineWidth', 1.5);
title('Fourier Transform Phase Spectrum');
xlabel('Frequency (\omega)');
ylabel('Phase \angle F(\omega) (radians)');
