N = 3;
model = createpde(N);
importGeometry(model,'gate_guard.stl');

figure
pdegplot(model,'FaceLabels','on')
view(30,30);
title('Gate guard')
figure
pdegplot(model,'FaceLabels','on')
view(-134,-32)
title('Gate guard, Rear View')

E = 200e9; % elastic modulus of steel in Pascals
nu = 0.26; % Poisson's ratio

c = elasticityC3D(E,nu);
a = 0;
f = [0;0;0]; % Assume all body forces are zero

specifyCoefficients(model,'m',0,'d',0,'c',c,'a',a,'f',f);

applyBoundaryCondition(model,'dirichlet','Face',1,'u',[0,0,0]);
applyBoundaryCondition(model,'dirichlet','Face',2,'u',[0,0,0]);

distributedLoad = 1e4; % Applied load in Pascals
applyBoundaryCondition(model,'neumann','Face',3,'g',[0,0,-distributedLoad]);

gateThickness = 1e-2; % Thickness of wire, meters
hmax = gateThickness; % Maximum element length for a moderately fine mesh
generateMesh(model, 'Hmax', hmax, 'GeometricOrder', 'quadratic');
figure
pdeplot3D(model)
title('Mesh with Quadratic Tetrahedral Elements');