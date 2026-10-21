x = [1 2 3 4];                % Define first input seq
h = [2 1 0];                  % Define second input seq
y = conv(x, h);               % Calculate discrete convolution

n = 0:(length(y) - 1);        % Creates x-axis index vector
figure;                       % opens new plot window
stem(n, y);                   % Plot discrete Graph
title('Convolution');         % Add title
xlabel('n');                  % Label x-axis
ylabel('amplitude');          % Label y-axis
