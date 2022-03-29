classdef transformation_matrix < handle
    
    properties
        T
    end
    
    methods
        % The constructor of the class
        function obj = transformation_matrix  
            obj.T = eye(4);
        end
        
        % Function for rotation
        function rotate(obj, theta, u)
            % Normalize vector
            u = u/norm(u);
            
            % Find the rotation matrix with Rodrigues' rotation formula
            R1 = (1-cos(theta)).*(u*u');
            R2 = cos(theta).*eye(3);
            R3 = sin(theta).*[0 -u(3) u(2); u(3) 0 -u(1); -u(2) u(1) 0];
            R = R1 + R2 + R3;
            
            % Put the rotation matrix in the correct position of T
            obj.T(1:3,1:3) = R;
        end
        
        % Function for translation
        function translate(obj, t)
           obj.T(1:3,4) = t;
        end
    end
end

