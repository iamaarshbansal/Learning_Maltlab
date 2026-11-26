%% Heart Rate from ECG Periodicity (Autocorrelation vs R-Peak Counting)
clear; clc; close all; rng(1);              % Reset workspace & fix random seed

% 1. Setup parameters and target heart rates for 3 test ECG segments
fs = 250; dur = 5; t = 0 : 1/fs : dur-1/fs; % 250 Hz sampling, 5-sec window
true_HR = [60, 75, 90];                     % Ground-truth heart rates (BPM)
HR_ac = zeros(1, 3); HR_rp = zeros(1, 3);   % Arrays to store estimated HR
figure('Color', 'w', 'Name', 'ECG Periodicity & Autocorrelation');

for s = 1:3
    % 2. Generate 5-second ECG segment (P-QRS-T waves + slight noise)
    T0 = 60 / true_HR(s);                   % Beat-to-beat period (seconds)
    ecg = 0.05 * randn(size(t));            % Initialize with small noise
    for tb = 0.3 : T0 : dur - 0.1           % Add Gaussian P, Q, R, S, T waves
        ecg = ecg + 0.15*exp(-((t-(tb-0.16))/0.02).^2) - 0.15*exp(-((t-(tb-0.03))/0.008).^2) ...
            + 1.20*exp(-((t-tb)/0.01).^2) - 0.25*exp(-((t-(tb+0.03))/0.009).^2) ...
            + 0.30*exp(-((t-(tb+0.24))/0.045).^2);
    end
    % 3. Method 1: Heart rate from first autocorrelation periodicity peak
    x = ecg - mean(ecg);                    % Remove DC offset (zero mean)
    N = length(x); maxL = round(1.5 * fs);  % Compute lags up to 1.5 seconds
    Rxx = zeros(1, maxL + 1);
    for k = 0:maxL                          % Discrete autocorrelation Rxx[k]
        Rxx(k+1) = sum(x(1:N-k) .* x(1+k:N));
    end
    Rxx = Rxx / Rxx(1);                     % Normalize so zero-lag peak = 1
    lags = (0:maxL) / fs;                   % Convert sample lags to seconds
    idx = round(0.3*fs)+1 : round(1.5*fs)+1;% Search 0.3-1.5 s (40-200 BPM)
    [pk_val, rel] = max(Rxx(idx));          % Find first periodicity peak
    tau1 = lags(idx(rel));                  % Lag of first peak (seconds)
    HR_ac(s) = 60 / tau1;                   % Convert repeat period to BPM
    % 4. Method 2: Heart rate from R-peak counting (average R-R interval)
    thr = 0.6 * max(ecg);                   % Threshold = 60% of max height
    cand = find(ecg(2:end-1)>ecg(1:end-2) & ecg(2:end-1)>=ecg(3:end) & ecg(2:end-1)>thr) + 1;
    pks = cand(1);                          % Store first R-peak index
    for c = cand(2:end)                     % Enforce 0.3 s minimum spacing
        if c - pks(end) >= round(0.3 * fs)
            pks(end+1) = c; %#ok<AGROW>
        elseif ecg(c) > ecg(pks(end))
            pks(end) = c;
        end
    end
    HR_rp(s) = 60 / mean(diff(pks) / fs);   % HR from average R-R interval
    % 5. Blue & Red Plots (Blue signal curves, Red peaks & drop-line)
    subplot(3, 2, 2*s - 1);
    plot(t, ecg, 'b-', t(pks), ecg(pks), 'ro', 'MarkerFaceColor', 'r', 'LineWidth', 1.1); grid on;
    title(sprintf('Seg %d ECG (True=%d) | R-Peak=%.2f BPM', s, true_HR(s), HR_rp(s)));
    xlabel('Time (s)'); ylabel('Amplitude');
    subplot(3, 2, 2*s);
    plot(lags, Rxx, 'b-', [tau1 tau1], [min(Rxx) pk_val], 'r--', tau1, pk_val, 'rp', ...
        'MarkerFaceColor', 'r', 'MarkerSize', 9, 'LineWidth', 1.1); grid on;
    title(sprintf('Seg %d Autocorr | \\tau_1=%.3fs -> %.2f BPM', s, tau1, HR_ac(s)));
    xlabel('Lag \tau (s)'); ylabel('R_{xx}(\tau)');
end

% 6. Print comparison table in Command Window
fprintf('\nSeg | True HR | Autocorr HR | R-Peak HR | Diff (BPM)\n');
for s = 1:3
    fprintf(' %d  |  %5.1f  |    %6.2f   |   %6.2f  |   %.2f\n', s, true_HR(s), HR_ac(s), HR_rp(s), abs(HR_ac(s)-HR_rp(s)));
end
