% Purpose: Allow user input to initialize a specific configure for simulation.
% Inputs: No function input, only user inputs for all configuration variables defined in Homework3_MATLAB_Part1.pdf 
% Outputs: configs structure containing all configuration variables
function configs = heat2D_configuration()

%% User Input: Solver Method (and type if BTCS)

solver.method = input("What solver would you like to use: heat2D_FTCS.m OR heat2D_BTCS.m (type file name)... ", "s");

if (solver.method ~= "heat2D_FTCS.m" && solver.method ~= "heat2D_BTCS.m")
   solver.method = input("Please input either heat2D_FTCS.m OR heat2D_BTCS.m: ", "s");

   while (solver.method ~= "heat2D_FTCS.m" && solver.method ~= "heat2D_BTCS.m")
   solver.method = input("Please input either heat2D_FTCS.m OR heat2D_BTCS.m: ", "s");
   end
end

if (solver.method == "heat2D_BTCS.m")
   disp("Which BTCS solver method would you like to use:");
   disp("1. inverse A (A−1b)");
   disp("2. built-in A (A\b)");
   disp("3. LU Decomposition of A (A = LU)");
   solver.type = input("Input Solver Method # (1,2,3): ");
  
   if (solver.type ~= 1 && solver.type ~= 2 && solver.type ~= 3)
       solver.type = input("Input Solver Method # (1,2,3): ");
      
       while (solver.type ~= 1 && solver.type ~= 2 && solver.type ~= 3)
        solver.type = input("Input Solver Method # (1,2,3): ");
       end
   end
end

configs.solver = solver;

%% User Input: Time Values

time.step = input("What time step value (dt) would you like to use (seconds): ");
time.end = input("How long would you like to run the simulation for (seconds): ");
time.plottingfreq = input("What time step value for plotting frequency (transient solution) would you like to use (seconds): ");
configs.time = time;

%% User Input: Metric or Imperial Units

disp("Will you be using:  ");
disp("1. Metric Units");
disp("2. Imperial Units");
units = input("Input Units Type #: ");
configs.units = units; 

if (units ~= 1 && units ~= 2)
   units = input("Please input a units type value of 1 or 2: ");
   while (units ~= 1 && units ~= 2)
   units = input("Please input a units type value of 1 or 2: ");
   end
end

%% User Input: Grid Values

if (units == 1)
   grid.L = input("What is the length of your 2D domain (m): ");
   grid.W = input("What is the width of your 2D domain (m): ");
elseif (units == 2)
   grid.L = input("What is the length of your 2D domain (ft): ");
   grid.W = input("What is the width of your 2D domain (ft): ");
end

grid.nodesX = input("How many nodes in the X direction would you like to use: ");
grid.nodesY = input("How many nodes in the Y direction would you like to use: ");
configs.grid = grid;

%% User Input: Initial Conditions

if (units == 1)
   IC.alpha = input("What initial condition of thermal diffusivity (m^2/s) would you like to use: ");
   IC.T0 = input("What is the initial temperature of all nodes (deg_C): ");
elseif (units == 2)
   IC.alpha = input("What initial condition of thermal diffusivity (ft^2/hr) would you like to use: ") / 3600;
   IC.T0 = input("What is the initial temperature of all nodes (deg_F): ");

end

configs.IC = IC; 

%% User Input: Boundary Conditions
if (units == 1)
   BC.Ttop = input("What is the temperature at the top boundary (deg_C): ");
   BC.Tbottom = input("What is the temperature at the bottom boundary (deg_C): ");
   BC.Tleft = input("What is the temperature at the left boundary (deg_C): ");
   BC.Tright = input("What is the temperature at the right boundary (deg_C): ");
elseif (units == 2)
   BC.Ttop = input("What is the temperature at the top boundary (deg_F): ");
   BC.Tbottom = input("What is the temperature at the bottom boundary (deg_F): ");
   BC.Tleft = input("What is the temperature at the left boundary (deg_F): ");
   BC.Tright = input("What is the temperature at the right boundary (deg_F): ");
end

configs.BC = BC;

end
