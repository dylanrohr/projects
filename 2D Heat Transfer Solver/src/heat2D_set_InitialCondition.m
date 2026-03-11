% Purpose: Set initial conditions for FTCS and BTCS simulations
% Inputs: configs structure
% Outputs: initialized temperature array, T, and thermal diffusivity constant, alpha
function [T, alpha] = heat2D_set_InitialCondition(configs)

%% Initializing Constants
xN = configs.grid.nodesX;
yN = configs.grid.nodesY;
T0 = configs.IC.T0; 

%% Applying Initial Conditions
T = ones(yN,xN)*T0;
alpha = configs.IC.alpha;

end