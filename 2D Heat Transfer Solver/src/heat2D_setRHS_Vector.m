% Purpose: sets RHS b vector for BTCS method
% Inputs: Fx, Fy, xN, yN, T (x and y fourier number, grid node information and current temperature distribution)
% Outputs: RHS b vector
function b = heat2D_setRHS_Vector(Fx, Fy, xN, yN, T)

    N = (xN - 2)*(yN - 2); 
    b = zeros(N,1);                             % Initializes b vector

    for j = 2:(yN-1)
        for i = 2:(xN-1)
            k = (j - 2)*(xN - 2) + (i - 1);     % Flattens interior grid nodes into an integer vector, k is node index

            b(k) = T(j, i);                     

            if i == 2                           % Enforces boundary condition
                b(k) = b(k) + Fx * T(j,1);
            end

            if i == (xN - 1)                    % Enforces boundary condition
                b(k) = b(k) + Fx * T(j,xN);
            end

            if j == (2)                         % Enforces boundary condition
                b(k) = b(k) + Fy * T(1,i);
            end

            if j == (yN -1)                     % Enforces boundary condition
                b(k) = b(k) + Fy * T(yN,i);
            end
        end
    end
end