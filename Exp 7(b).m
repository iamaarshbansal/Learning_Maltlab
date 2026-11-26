% Exp 7(b): Magnitude and Phase Spectrum of Exponential Function
w = -10:0.01:10;            % Frequency range
F = zeros(size(w));         % Define array

for i = 1:length(w)
    F(i) = exp(-1i*w(i)*2) + exp(1i*w(i)*2); % Calculates the function
end

magnitude = abs(F);         % Magnitude
phase = angle(F);           % Phase angle

subplot(2,1,1);             % Plot 1st graph
plot(w, magnitude);         % Plot between w and magnitude
title('Magnitude spectrum'); % Gives title
xlabel('Freq');             % Gives x-label
ylabel('Magnitude');        % Gives y-label

subplot(2,1,2);             % Plot 2nd graph
plot(w, phase);             % Plot between w and phase
title('Phase spectrum');    % Gives title
xlabel('Freq');             % Gives x-label
ylabel('Phase');            % Gives y-label
