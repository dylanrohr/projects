% Purpose: plots transient heat transfer states at user specified plotting frequency
% Inputs: configs structure, solution structure
% Outputs: plots at each user specified time step
function [] = heat2D_plotTransient(configs, solution)

%% Initializing Constants
    l = configs.grid.L;
    w = configs.grid.W;
    xN = configs.grid.nodesX;
    yN = configs.grid.nodesY;
    dt = configs.time.step; 
    freq = configs.time.plottingfreq; 

    Tmin = min(solution(1).Tn(:));
    Tmax = max(solution(1).Tn(:));

    index = length(solution);
    interval = round(freq/dt);

%% Plots Each Transient Case
    x = linspace(0, l, xN);
    y = linspace(w, 0, yN);
    for i = 1:index
    
        time = (i-1) * interval * dt;
    
        Tn = solution(i).Tn; 
    
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

        title(sprintf('Temperature Distribution at Time = %.2f s', time));
    
    end



end