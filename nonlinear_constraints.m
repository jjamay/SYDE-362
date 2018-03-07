function [c, ceq] = nonlinear_constraints(x)

F_load = 7000;
E = 71.7 * 10^9;

c = [ ...
    10*F_load*(x(2)^2) - 12*pi*E*(x(1)^4); ... % delta1 < l1 / 10
    10*F_load*(x(3)^2) - 3/4*pi*E*(x(1)^4); ... % delta2 < l2 / 10
    F_load*(x(3)^2) - deg2rad(5.7)*2*E*pi/4*(x(1)^4); ... % theta < 5.7
];
ceq = [];

end

