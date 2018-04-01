function [c, ceq] = nonlinear_constraints(x)

    F_load = 3500/50;
    E = 200 * 10^9;
    Y = 1500 * 10^6;

    c = [ ...
%         10*F_load*(x(2)^2) - 12*pi*E*(x(1)^4); ... % delta1 < l1 / 10
%         10*F_load*(x(3)^2) - (3/4)*pi*E*(x(1)^4); ... % delta2 < l2 / 10
%         F_load*(x(3)^2) - deg2rad(5.7)*2*E*pi/4*(x(1)^4); ... % theta < 5.7
        2*F_load*x(2)/(pi*x(1)^3) - Y; ... % yield stress on beam 1 
        4*F_load*x(3)/(pi*x(1)^3) - Y; ... % yield stress on beam 2
    ];
    ceq = [];

end

