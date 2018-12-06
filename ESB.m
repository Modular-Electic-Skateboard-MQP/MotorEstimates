classdef ESB < handle
    
    properties (GetAccess = public, SetAccess = private)
        Motors
        DriveTrain
        DriveEfficiency
        ESBWeight
        WheelDiameter
    end
    
    methods
        function obj = ESB(motors, drive_train, drive_efficiency, electronics_weight, wheel_diameter)
            obj.Motors = motors;
            obj.DriveTrain = drive_train;
            obj.DriveEfficiency = drive_efficiency;
            obj.ESBWeight = electronics_weight;
            obj.WheelDiameter = wheel_diameter;
        end
        
        % Assumes the following
        % - incline = radians
        % - userWeight = kilograms
        function currentPerMotor = staticDraw(obj, incline, userWeight)
            totalWeight = userWeight + obj.ESBWeight;
            
            g = 9.81;
            inclineStallTorque = @(theta, u_s, u_t, tr, r, mass) (-g*cos(theta)*u_s + g * sin(theta))/(-tr*u_t*r*(1/mass));
            % inclineAccelerationTorque =  = @(theta, u_s, u_t, tr, r, mass, acc) (acc-g*cos(theta)*u_s + g * sin(theta))/(-tr*u_t*r*(1/mass));
            
            % Assumes certain gearbox configuration for speed (12 to 36 mm)
            % https://www.amazon.com/Pulley-Flywheel-Retainer-Electric-Skateboard/dp/B07FCVY4SF/ref=asc_df_B07FCVY4SF/?tag=hyprod-20&linkCode=df0&hvadid=312120862527&hvpos=1o1&hvnetw=g&hvrand=9725577150713294647&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9001847&hvtargid=aud-466346483690:pla-568904559574&psc=1
            inclineStallTorque(incline, .8, .7, 3, .085, (obj.ESBWeight + userWeight)/g)
            
            currentPerMotor = obj.Motors(1, 1).currentAtTorque(inclineStallTorque(incline, .8, .7, 3, .085, (obj.ESBWeight + userWeight)/g))
        end
        
        function addBattery(mah, voltage)
            obj.batteryLife = mah;
            obj.batteryVoltage = voltage;
        end
        
        % With current setup, simulate board drive on set incline for set
        % time duration, and will return time on road and motor draw
        function [duration, draw] = rideSim(incline, time)
            % perform some conversion to amps that is drawn at the incline
            % for a given unit of time, then multiply by time
        end
    end
end

