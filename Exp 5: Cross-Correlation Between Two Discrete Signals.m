x1 = [1 2 3 4];               % Defines the first signal
x2 = [2 3];                   % Defines the second signal

[r, index] = xcorr(x1, x2);   % Computes Cross-Corr
stem(index, r);               % Plot the graph
xlabel('Lag');                % Defines xlabel
ylabel('Corr.');              % Defines ylabel
title('Cross Correlation');   % Defines title
