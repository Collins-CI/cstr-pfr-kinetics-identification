%% --- CSTR Model Script (Single Script) ---

% --- Parameters ---
CA0 = 1.0;        % inlet concentration [mol/L]
k0  = 0.8;        % pre-exponential factor
Ea  = 40000;      % activation energy [J/mol]
T   = 350;        % temperature [K]
R   = 8.314;      % gas constant [J/mol*K]

% --- Time / Residence time vector ---
t = linspace(0, 10, 100);   % seconds

% --- Calculate rate constant and conversion ---
k = k0 * exp(-Ea/(R*T));    % first-order approximation
X = 1 - exp(-k * t);        % simple first-order CSTR conversion

% --- Plot the results ---
figure;
plot(t, X, 'LineWidth', 2)
xlabel('Time / Residence Time (\tau) [s]')
ylabel('Conversion X')
title('CSTR Conversion vs Time')
grid on
