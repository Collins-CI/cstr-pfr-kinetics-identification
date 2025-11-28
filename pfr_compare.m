clear; clc;

CA0 = 1.0;
k = 0.5; 
n = 1;

taus = linspace(0.1,10,200);
X_cstr = 1 ./ (1 + k * taus / CA0);

% PFR integration
X_pfr = zeros(size(taus));
for i = 1:length(taus)
    tau = taus(i);
    ode = @(V,X) k * (1-X).^n;
    [V,Xsol] = ode45(ode, [0 tau], 0);
    X_pfr(i) = Xsol(end);
end

plot(taus,X_cstr,'LineWidth',2)
hold on
plot(taus,X_pfr,'LineWidth',2)
xlabel('\tau'); ylabel('Conversion X');
legend('CSTR','PFR');
title('CSTR vs PFR Performance');
