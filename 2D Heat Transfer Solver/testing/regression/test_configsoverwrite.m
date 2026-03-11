% Sets path to access source files
projectRoot = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(projectRoot, '..', '..', 'src')));

% Calls configs function (accepts any random input)
configs = heat2D_configuration();

% Override Configs
configs.solver.type = 2;
configs.BC.Ttop    = 100;
configs.BC.Tbottom = 100;
configs.BC.Tleft   = 100;
configs.BC.Tright  = 100;
configs.IC.T0 = 0;
configs.grid.L = 3.5;
configs.grid.W = 3.5;
configs.grid.nodesX = 10;
configs.grid.nodesY = 10;
configs.units = 2; 
configs.IC.alpha = 0.645/3600;
configs.time.end = 70000;   
configs.time.step = 0.05;
configs.time.plottingfreq = 600;

% Solves solution with new configs
    
    solution = heat2D_FTCS(configs);   % or FTCS

    T_final = solution(end).Tn;

    assert(max(abs(T_final(:) - 100)) < 1e-5, 'Heat Regression failed exact relation');

    disp('PASS: test_configsoverwrite');