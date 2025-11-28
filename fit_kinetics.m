clear; clc;

% Load conversion vs tau data
data = readtable('conversion_data.csv');

tau_exp = data.tau;
X_exp   = data.X_noisy;   % correct column

CA0 = 1.0;   % feed concentration

% --- Safe model-predicted conversion ---
model_fun = @(p, tau) 1 - p(1) ./ (p(1) + tau .* p(2) .* real(p(1)).^(p(3)));

% Initial guesses: [CA0 k n]
p0 = [CA0, 0.5, 1];

% Bounds to ensure positive real parameters
lb = [0, 0, 0];   % lower bounds
ub = [];           % no upper bounds

opts = optimoptions('lsqnonlin','Display','iter');

[p_fit, resnorm, residual, exitflag, output, lambda, jacobian] = ...
    lsqnonlin(@(p) real(model_fun(p, tau_exp) - X_exp), p0, lb, ub, opts);

disp('Fitted parameters:')
disp(p_fit)

% Confidence intervals (optional)
try
    ci = nlparci(p_fit, residual, 'jacobian', jacobian);
    disp('95% CI:')
    disp(ci)
catch
    disp('Cannot compute CI: parameters may be complex. Ignoring CI.')
end

% Plot residuals
figure;
plot(tau_exp, residual, 'o', 'MarkerSize',6);
xlabel('\tau'); ylabel('Residual');
title('Residuals After Fitting');
grid on
