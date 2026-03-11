% Sets path to access source files
projectRoot = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(projectRoot, '..', '..', 'src')));

% Hardcodes solution
T_expected = [200,0,0,0,0 ; 200,0,0,0,0 ; 200,0,0,0,0 ; 200,0,0,0,0 ; 200, 200,200,200,0];

% Sets configs values to be used by test function
configs.grid.nodesX = 5; 
configs.grid.nodesY = 5;
configs.BC.Ttop = 0;
configs.BC.Tbottom = 200;
configs.BC.Tleft = 200;
configs.BC.Tright = 0;
configs.IC.T0 = 0; 
configs.IC.alpha = 0.645;

[T, alpha] = heat2D_set_InitialCondition(configs);

% Calls function to test
T_actual = heat2D_set_BoundaryConditions(configs, T);

% Compare the expected vs. the actual value of T2
assert(all(all(abs(T_actual - T_expected) < 1e-5)), 'Initial Temperature Distribution with BCs failed exact relation');

disp('PASS: test_heat2D_set_BoundaryConditions');

