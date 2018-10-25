classdef ESB < handle
    
    properties (GetAccess = public, SetAccess = immutable)
        Width
        Thickness
        Length
        BoardWeight
        WheelRadius
    end
    
    properties (GetAccess = public, SetAccess = private)
        DriveSystem
        RiderWeight
    end
    
    methods
        % Construction and setters
        function obj = ESB(w, th, l, weight)
            obj.Width = w;
            obj.Thickness = h;
            obj.Length = l;
            obj.BoardWeight = weight;
        end
        
        function obj = setDriveSystem(ds)
            obj.DriveSystem = ds;
        end
        
        function obj = setRiderWeight(weight)
            obj.RiderWeight = weight;
        end
        
        % Calculates required power to drive system
        function powerConsumption = powerAtState(obj, incline, linearAcceleration, linearSpeed)
            requiredTorque = (linearAcceleration - 9.81 * cos(incline) * frictionCoefficient + 9.81 * sin(incline))/(- obj.WheelRadius * (1/(obj.BoardWeight/9.81)));
            
            powerConsumption = (linearSpeed / obj.WheelRadius) * requiredTorque;           
        end
    end
end

