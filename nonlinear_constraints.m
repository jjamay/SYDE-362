function [c, ceq] = nonlinear_constraints(x)

F_load = 7000;
E = 71.7 * 10^9;
Y = 503 * 10^6;

c = [ ...
%     10*F_load*(x(2)^2) - 12*pi*E*(x(1)^4); ... % delta1 < l1 / 10
%     10*F_load*(x(3)^2) - (3/4)*pi*E*(x(1)^4); ... % delta2 < l2 / 10
    F_load*x(2)/((pi/2)*x(1)^3) - Y; ... % yield stress on beam 1 
    F_load*x(3)/((pi/4)*x(1)^3) - Y; ... % yield stress on beam 2
];
ceq = [];

end
