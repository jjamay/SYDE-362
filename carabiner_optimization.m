rho = 2810; % kg/m^3
F_load = 7000;
E = 71.7 * 10^9;

delta1_fun = @(l, r) (F_load * l^3) / (48 * E * ((pi / 4) * r^4));
delta2_fun = @(l, r) (F_load * l^3) / (3 * E * ((pi / 4) * r^4));

% x = (r, l1, l2)
C = 1;
obj_fun = @(x) ...
    + 3.27 * rho * pi * x(1)^2 * (x(2) + x(3)) ...
    + 3.24 / (x(2) + x(3));

% Ax <= b
A = [];
b = [];
Aeq = [];
beq = [];

% lower and upper bounds
lb = [0 0 0];
ub = [0.0065 0.05 0.05];

% initial conditions
x0 = [0.0065 0.05 0.05];

optimal_x = fmincon(obj_fun, x0, A, b, Aeq, beq, lb, ub, @nonlinear_constraints);
optimal_x
