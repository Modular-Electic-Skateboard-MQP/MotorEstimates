classdef Motor < handle
    
    properties (GetAccess = public, SetAccess = immutable)
        StallTorque
        StallAmp
        MaxEfficientTorque
        FreeRunSpeed
        FreeRunAmp
    end
    
    methods
        function obj = Motor(st, sa, frs, fra, met)
            obj.StallTorque = st;
            obj.StallAmp = sa;
            obj.FreeRunSpeed = frs;
            obj.FreeRunAmp = fra;
            obj.MaxEfficientTorque = met;
        end
        
        function efficient = isEfficient(obj, torque)
            % Returns true if we are within bounds of the max efficiency
            % and max power
            efficient = true;
            if torque > obj.StallTorque/2
                efficient = false;
            elseif torque < obj.MaxEfficientTorque
                efficient = false;
            end
        end
    end
end

