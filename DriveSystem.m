classdef DriveSystem < handle
    
    properties (GetAccess = public, SetAccess = immutable)
        % Belt Efficiency assumes both flat and V belts (V belts prefered)
        beltEfficiency
        gearEfficiency
    end
    
    enumeration
        belt, gear, direct
    end
    
    properties (GetAccess = public, SetAccess = private)
        transmissionType
        transmissionRatio
    end
    
    methods
        function obj = DriveSystem()
            % Refering to my 1001 notes for usual efficiencies 
            obj.beltEfficiency = 0.85;
            obj.gearEfficiency = 0.90;
            obj.transmissionType = direct;
            obj.transmissionRatio = 1;
        end
        
        function obj = setTransmission(obj, type, ratio)
            obj.transmissionType = type;
            obj.transmissionRatio = ratio;
        end
        
        function torque = motorTorque(obj, OutputTorque)
            mu = 1;
            if obj.transmissionType == belt
                mu = obj.beltEfficiency;
            elseif obj.transmissionType == gear
                mu = obj.gearEfficiency ;
            end
            torque = OutputTorque/(obj.transmissionRatio * mu);
        end
    end
end

