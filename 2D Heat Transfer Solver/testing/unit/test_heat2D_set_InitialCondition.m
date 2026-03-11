% Sets path to access source files
projectRoot = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(projectRoot, '..', '..', 'src')));

% Hardcodes solution values
T_expected = zeros(5);
alpha_expected = 0.645;

% Sets configs values to be used by test function
configs.grid.nodesX = 5; 
configs.grid.nodesY = 5;
configs.BC.Ttop = 0;
configs.BC.Tbottom = 200;
configs.BC.Tleft = 200;
configs.BC.Tright = 0;
configs.IC.T0 = 0; 
configs.IC.alpha = 0.645;

% Calls test function
[T_actual, alpha_actual] = heat2D_set_InitialCondition(configs);

% Compare the expected vs. the actual value of T2
assert(all(all(abs(T_actual - T_expected) < 1e-5)), 'Initial temperature distribution failed exact relation');
assert(abs(alpha_actual - alpha_expected) < 1e-5, 'Initial alpha value failed exact relation');

disp('PASS: test_heat2D_set_InitialCondition');
