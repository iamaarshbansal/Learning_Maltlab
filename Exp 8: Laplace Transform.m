% Exp 8: Laplace Transform of f(t) = e^(-at)
a = 2;                      % Constant a = 2
s = 0:0.01:10;              % Create s vector
F = zeros(size(s));         % Create array of zeros

for i = 1:length(s)         % Evaluates the integral from t = 0 to infinity
    F(i) = integral(@(t) exp(-a*t) .* exp(-s(i)*t), 0, inf);
end

plot(s, F);                 % Plot graph
title('Laplace');           % Gives title
xlabel('Freq');             % Gives x-label
ylabel('F(s)');             % Gives y-label
