ASEN 4057

Homework 3 Part 1

Author: Dylan Rohr

Purpose: Protoype of a modular 2D transient heat conduction solver using either FTCS or BTCS methods. 

Inputs: Configuration parameters for simulation including solver type/method, TIME info, GRID info, aswell as initial conditions and boundary conditions. 

Outputs: 2D heat map plots of transient time steps as well as a steady state solution if simulation run time allows. Also outputs total simulation runtime. 

To Run: run Heat2D_GUI.mlapp and input configuration parameters into GUI and hit run! 






Function Descriptions: 

heat2D_configuration.m: Allows user input to initialize a specific configure for simulation.

heat2D_set_BoundaryConditions.m: Set boundary conditions for FTCS and BTCS simulations.

heat2D_set_InitialCondition.m: Set initial conditions for FTCS and BTCS simulations. 

heat2D_FTCS.m: Use FTCS method to solve 2D heat transfer equations.

heat2D_BTCS.m: Use BTCS method to solve 2D heat transfer equations.

heat2D_setA_Matrix.m: Sets A Matrix for BTCS solver.

heat2D_setRHS_Vector.m: Sets RHS b vector for BTCS method.

heat2D_plotSteady.m: Plots the steady state solution to the 2D heat transfer case.

heat2D_plotTransient.m: Plots transient heat transfer states at user specified plotting frequency.

