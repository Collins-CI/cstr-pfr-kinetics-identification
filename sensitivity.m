clear; clc;

CA0_values = [0.5, 1.0, 2.0];
tau_values = linspace(0.1, 10, 200);
k = 0.5; n = 1;

figure; hold on;

for CA0 = CA0_values
    X = 1 ./ (1 + k * tau_values / CA0);
    plot(tau_values, X, 'LineWidth', 2);
end

xlabel('\tau'); ylabel('X');
legend('CA0=0.5','CA0=1.0','CA0=2.0');
title('Sensitivity of Conversion to CA0');
