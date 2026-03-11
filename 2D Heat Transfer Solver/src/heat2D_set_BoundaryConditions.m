% Purpose: Set boundary conditions for FTCS and BTCS simulations
% Inputs: configs structure and initialized temperature array, T
% Outputs: temperature array, T, with applied boundary conditions
function T = heat2D_set_BoundaryConditions(configs, T)

%% Initializing Constants
    xN = configs.grid.nodesX;
    yN = configs.grid.nodesY;

    Ttop= configs.BC.Ttop;
    Tbottom = configs.BC.Tbottom;
    Tleft = configs.BC.Tleft;
    Tright = configs.BC.Tright;
    
%% Applying Boundary Conditions to Temperature Array
    for i = 1:xN
        T(yN,i) = Tbottom;
        T(1,i) = Ttop; 
    end

    for j = 1:yN
        T(j,1) = Tleft; 
        T(j,xN) = Tright;
    end

end

