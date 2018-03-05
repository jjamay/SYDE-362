function [c, ceq] = nonlinear_constraints(x)

F_load = 3500;
E = 71.7 * 10^9;

c = [ ...
    10*F_load*(x(2)^2) - 12*pi*E*(x(1)^4); ... % delta1 < l1 / 10
    10*F_load*(x(3)^2) - (3/4)*pi*E*(x(1)^4); ... % delta2 < l2 / 10
];
ceq = [];

end

