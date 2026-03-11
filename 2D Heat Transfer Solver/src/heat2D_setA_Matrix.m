% Purpose: sets A Matrix for BTCS solver
% Inputs: Fx, Fy, xN, yN (x and y fourier number and grid node information)
% Outputs: A matrix
function A = heat2D_setA_Matrix(Fx, Fy, xN, yN)
    
%% Setting A Matrix

    for j = 2:(yN-1)
        for i = 2:(xN-1)
            
            k = (j - 2)*(xN - 2) + (i - 1); % Flattens interior grid nodes into an integer vector, k is node index
       
            A(k,k) = 1 + 2*Fx + 2*Fy;       % Sets diagonal of A matrix   

            if i > 2                        % Sets other A matrix values IF not a boundary condition node
                A(k,k-1) = -Fx;
            end

            if i < (xN -1)                  % Sets other A matrix values IF not a boundary condition node
                A(k,k+1) = -Fx;
            end

            if j > 2                        % Sets other A matrix values IF not a boundary condition node
                A(k,k-(xN-2)) = -Fy;
            end

            if j < (yN -1)                  % Sets other A matrix values IF not a boundary condition node
                A(k,k+(xN-2)) = -Fy;
            end
         end      
    end

end
