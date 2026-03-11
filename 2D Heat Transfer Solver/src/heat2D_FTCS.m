
% Purpose: Use FTCS method to solve 2D heat transfer equations
% Inputs: configs structure
% Outputs: solution structure with temperature arrays, Tn, at each plotting time step
function solution = heat2D_FTCS(configs)

%% Initializing Constants
    dt = configs.time.step; 
    freq = configs.time.plottingfreq;
    t_end = configs.time.end;
    l = configs.grid.L; 
    w = configs.grid.W; 
    xN = configs.grid.nodesX;
    yN = configs.grid.nodesY;
    xC = xN - 1; 
    yC = yN -1;
    dx = l/xC; 
    dy = w/yC;

%% Calling Initial Conditions function
    [T, alpha] = heat2D_set_InitialCondition(configs); 

%% Determining Solution Stabilty
    Fx = alpha*dt/(dx^2);
    Fy = alpha*dt/(dy^2);

    Fo = Fx + Fy;

    if (Fo > 0.5)
        disp("Combined Fourier Number > 0.5, solution is unstable"); 
    end

%% Finding X and Y node positions
    for i = 1:xN
        xi(i) = (i - 1)/xC * l ; 
    end

    for j = 1:yN
        yi(j) = (j - 1)/yC * w ; 
    end
%% Setting Boundary Conditions
    Tn = heat2D_set_BoundaryConditions(configs, T); 
  

%% Solving FTCS Simulation
   
    Tn1 = Tn; 
    solution(1).Tn = Tn;
    interval = round(freq/dt);
    simulation_index = 1; 

    for t = dt:dt:t_end
 
  
        for (i = 2:xC)
            for (j = 2:yC)
                Tn1(j,i) = Tn(j,i) + Fx*( Tn(j,i+1) - 2*Tn(j,i) + Tn(j,i-1) ) + Fy*( Tn(j+1,i) - 2*Tn(j,i) + Tn(j-1,i));
            end
        end

    
        if mod(simulation_index, interval) == 0
            plot_num = simulation_index / interval + 1;
            solution(plot_num).Tn = Tn1;
        end

        simulation_index = simulation_index + 1;
    
        Tn = Tn1; 

    end

end
