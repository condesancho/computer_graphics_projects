classdef PhongMaterial
    
    properties
        ka
        kd
        ks
        nPhong
    end
    
    methods
        
        % The constructor of the class
        function obj = PhongMaterial(ka,kd,ks,nPhong)
            if nargin == 0
                obj.ka = 0;
                obj.kd = 0;
                obj.ks = 0;
                obj.nPhong = 0;
            else                
                obj.ka = ka;
                obj.kd = kd;
                obj.ks = ks;
                obj.nPhong = nPhong;
            end
        end
        
    end
end

