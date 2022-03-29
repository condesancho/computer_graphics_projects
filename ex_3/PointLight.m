classdef PointLight
    
    properties
        pos
        intensity        
    end
    
    methods
        
        % The constructor of the class
        function obj = PointLight(pos,intensity)
            if nargin == 0
                obj.pos = zeros(1,3);
                obj.intensity = zeros(1,3);
            else
                obj.pos = pos;
                obj.intensity = intensity;
            end
        end
        
    end
end

