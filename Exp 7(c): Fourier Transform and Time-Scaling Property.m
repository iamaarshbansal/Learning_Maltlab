% Exp 7(c): Magnitude and Phase Spectra with Time Scaling
a = 2;                      % Decay rate
w = -10:0.01:10;            % Frequency range -10 to 10
b = 5;                      % Scaling parameter
F = zeros(size(w));         % Create array
F2 = zeros(size(w));        % Create array

for i = 1:length(w)         % Find F(w) at each frequency
    F(i) = integral(@(t) exp(-a*t) .* exp(-1i*w(i)*t), 0, inf);
    F2(i) = integral(@(t) exp(-a*b*t) .* exp(-1i*w(i)*t), 0, inf);
end

magnitude = abs(F);         % Magnitude
phase = angle(F);           % Phase
magnitude2 = abs(F2);       % Scaled magnitude
phase2 = angle(F2);         % Scaled phase

subplot(2,2,1);             % 1st graph
plot(w, magnitude);         % Plot graph
title('Magnitude spectrum'); % Title
xlabel('Freq');             % x-label
ylabel('Magnitude');        % y-label

subplot(2,2,2);             % 2nd graph
plot(w, phase);             % Plot graph
title('Phase spectrum');    % Title
xlabel('Freq');             % x-label
ylabel('Phase');            % y-label

subplot(2,2,3);             % 3rd graph
plot(w, magnitude2);        % Plot graph
title('Scaled magnitude spectrum'); % Title
xlabel('Freq');             % x-label
ylabel('Scaled Magnitude'); % y-label

subplot(2,2,4);             % 4th graph
plot(w, phase2);            % Plot graph
title('Scaled phase spectrum'); % Title
xlabel('Freq');             % x-label
ylabel('Scaled Phase');     % y-label
