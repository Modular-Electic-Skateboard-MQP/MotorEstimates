classdef Motor < handle
    
    properties (GetAccess = public, SetAccess = immutable)
        StallTorque
        StallAmp
        FreeRunSpeed
        FreeRunAmp
        OperatingVoltage
    end

    properties (GetAccess = public, SetAccess = private)
        Name
    end
    
    methods
        % Assumes speed is in RPM
        function obj = Motor(stallTorque, stallAmp, freeRunSpeed, freeRunAmp, operatingVoltage)
            obj.StallTorque = stallTorque;
            obj.StallAmp = stallAmp;
            obj.FreeRunSpeed = freeRunSpeed;
            obj.FreeRunAmp = freeRunAmp;
            obj.OperatingVoltage = operatingVoltage;
            obj.Name = '';
        end

        function setName(obj, name)
            obj.Name = name;
        end
        
        function plotProperties(obj)
            torque = @(amp) (obj.StallTorque/obj.StallAmp) * amp;
            speed = @(amp) obj.FreeRunSpeed - ((obj.FreeRunSpeed/obj.StallAmp) * amp);
            powerOut = @(amp) torque(amp) * speed(amp) * (pi/30);
            powerIn = @(amp) amp * obj.OperatingVoltage;
            efficiency = @(amp) powerOut(amp) * powerIn(amp)^(-1);
            
            % Torque vs Speed
            figure;
            fplot(torque, [0, obj.StallAmp]);
            hold on;
            ylabel('Torque (n*m)');
            yyaxis right;
            fplot(speed, [0, obj.StallAmp]);
            hold off;
            grid on;
            legend('Torque', 'Speed');
            if strlength(obj.Name) > 0
               title({obj.Name,'Torque and Speed vs Amps'})
            else
                title('Torque and Speed vs Amps');
            end
            xlabel('Amps');
            ylabel('Speed (rpm)');
            
            % Efficiency Curves
            figure;
            fplot(powerOut, [0, obj.StallAmp]);
            hold on;
            fplot(powerIn, [0, obj.StallAmp]);
            hold on;
            ylabel('Power (Watts)');
            yyaxis right;
            fplot(efficiency, [0, obj.StallAmp]);
            hold off;
            grid on;
            legend('Power Out', 'Power In', 'Effiency');
            if strlength(obj.Name) > 0
                title({obj.Name,'Power In, Power Out, and Efficiency vs Amps'})
            else
                title('Power In, Power Out, and Efficiency vs Amps');
            end            
            ylabel('Efficiency Ratio');
            xlabel('Amps')
        end
    end
end

