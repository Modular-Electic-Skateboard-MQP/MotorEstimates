classdef DriveSystem < handle
    
    properties (GetAccess = public, SetAccess = immutable)
        % Efficiency of the system (either flat belt, V belt, or gear
        efficiency
    end
    
    enumeration
        belt, gear, direct
    end
    
    properties (GetAccess = public, SetAccess = private)
        transmissionType
        transmissionRatio
    end
    
    methods
        function obj = DriveSystem(eff)
            % Efficiency is parameterized
            obj.efficiency = eff;
            obj.transmissionType = direct;
            obj.transmissionRatio = 1;
        end
        
        function obj = setTransmission(obj, type, ratio)
            obj.transmissionType = type;
            obj.transmissionRatio = ratio;
        end
        
        function torque = motorTorque(obj, OutputTorque)
            mu = obj.efficiency;
            torque = OutputTorque/(obj.transmissionRatio * mu);
        end
    end
end

