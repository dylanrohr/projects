
% Purpose: Use FTCS or BTCS method to solve 2D heat transfer equations


%% Housekeeping
clear; clc; close all; tic;

%% Set Path for source files
projectRoot = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(projectRoot,'src')));
addpath(genpath(fullfile(projectRoot,'plotting')));


%% Calls configuration file for User Input
configs = heat2D_configuration();

%% Calls heat2D_FTCS simulation if chosen
if (configs.solver.method == "heat2D_FTCS.m")
    solution = heat2D_FTCS(configs);
end

%% Calls heat2D_BTCS simulation if chosen
if (configs.solver.method == "heat2D_BTCS.m")
    solution = heat2D_BTCS(configs);    
end

%% Plots transient solution at user specified time steps 
heat2D_plotTransient(configs, solution); 

%% Plots steady state solution if simulation time allows
heat2D_plotSteady(configs, solution);

%% Outputs total runtime

runtime = toc;

fprintf("Total Runtime: %.2f s", runtime);
