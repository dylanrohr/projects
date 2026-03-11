clc; clear; 

% Get the full filepath of this current file (but not the filename)
thisFile = fileparts(mfilename('fullpath'));

%Sets full path of source files based on current location of this script
addpath(genpath(fullfile(thisFile, '..', 'src')));

% Manually run each test case in test suite
run('regression/test_configsoverwrite.m');
run('unit/test_heat2D_set_InitialCondition.m');
run('integration/test_heat2D_set_BoundaryConditions.m');

disp('ALL TESTS COMPLETED');