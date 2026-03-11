% Purpose: plots the steady state solution to the 2D heat transfer case
% Inputs: configs structure, solution structure
% Outputs: one plot at estimated steady state time
function [] = heat2D_plotSteady(configs, solution)

%% Initializing Constants
    l = configs.grid.L;
    w = configs.grid.W;
    xN = configs.grid.nodesX;
    yN = configs.grid.nodesY;
    tend = configs.time.end;
    dt = configs.time.step;
    
    Tmin = min(solution(1).Tn(:));
    Tmax = max(solution(1).Tn(:));
%% Setting Initial Conditions (alpha is needed) 
    [T, alpha] = heat2D_set_InitialCondition(configs);

%% Estimating Time of Steady State Solution
    t_steady = max(l,w)^2 / alpha ; 
    
    if t_steady > tend
        disp(sprintf('Time for steady state diffusion = %.2f s, simulation only runs for %.2f s.', t_steady, tend));
        return; 
    end
    
%% Plotting Steady State Solution if Simulation Allows
    x = linspace(0, l, xN);
    y = linspace(w, 0, yN);
    
    index = length(solution);
    
    Tn = solution(index).Tn; 
    
    figure();
    imagesc(x, y', Tn);
    clim([Tmin Tmax]);
    set(gca,'YDir','normal');
    colormap(jet);
    colorbar;
    axis equal tight;

    if configs.units == 1
        xlabel('x (m)');
        ylabel('y (m)');
    end

    if configs.units ==2
        xlabel('x (ft)');
        ylabel('y (ft)');
    end

    title(sprintf('Temperature Distribution at Steady State Time Estimate of %.2f s', t_steady));

end
