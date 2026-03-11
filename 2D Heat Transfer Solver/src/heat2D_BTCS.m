% Purpose: Use BTCS method to solve 2D heat transfer equations
% Inputs: configs structure
% Outputs: solution structure with temperature arrays, Tn, at each plotting time step
function solution = heat2D_BTCS(configs)

%% Initializing Constants

    dt = configs.time.step; 
    t_end = configs.time.end;
    freq = configs.time.plottingfreq;
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
   


%% Solving BTCS Simulation
   
    Tn1 = Tn;
    solution(1).Tn = Tn;
    interval = round(freq/dt);
    simulation_index = 1; 

    A = heat2D_setA_Matrix(Fx, Fy, xN, yN); 

    for t = dt:dt:t_end

        B = heat2D_setRHS_Vector(Fx, Fy, xN, yN, Tn); 
  
        if configs.solver.type == 1 
            x = inv(A)*B;
        end

        if configs.solver.type == 2
            x = A \ B;
        end

        if configs.solver.type == 3 
            [L,U] = lu(A);
            y = L\B;
            x = U\y;
        end
    
 
        Tn1(2:yN-1, 2:xN-1) = reshape(x, [xN-2, yN-2]).';
        Tn1 = heat2D_set_BoundaryConditions(configs,Tn1);


        if mod(simulation_index, interval) == 0
            plot_num = simulation_index / interval + 1;
            solution(plot_num).Tn = Tn1;
        end

        simulation_index = simulation_index + 1;

        Tn = Tn1; 

    end

end