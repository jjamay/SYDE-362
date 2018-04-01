rho = 7830; % kg/m^3
F_load = 3500/50;
E = 200 * 10^9;

% x = (r, l1, l2)

obj_fun = @(x) ...
    + 3.27 * rho * pi * x(1)^2 * (x(2) + x(3)) ...
    + 3.24 / (x(2) + x(3));

% Ax <= b
A = [];
b = [];
Aeq = [];
beq = [];

% lower and upper bounds
lb = [0 0.05 0.02];
ub = [0.0012 0.1 0.05];

% initial conditions
x0 = [0.0012 0.1 0.05];

optimal_x = fmincon(obj_fun, x0, A, b, Aeq, beq, lb, ub, @nonlinear_constraints);
optimal_x

I = (pi/4)*optimal_x(1)^4;
sigma_1 = F_load*0.5*optimal_x(2)*optimal_x(1)/I;
sigma_2 = F_load*0.03201*optimal_x(1)/I;
delta_1 = F_load*optimal_x(2)^3/(48*E*I);
delta_2 = F_load*0.03201^3/(3*E*I);
theta = F_load*0.03201^2/(2*E*I);

sigma_1
sigma_2
delta_1
delta_2
rad = rad2deg(theta)