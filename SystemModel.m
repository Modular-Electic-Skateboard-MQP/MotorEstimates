lb_to_kg = @(lb) lb * 0.45359237;

turnigy_Aerodrive_sk3_190kv_LW = Motor(torqueFromMaxPower(2450, rpm(36, 190)), 65, rpm(36, 190), 0, 36);
turnigy_Aerodrive_sk3_190kv_LW.setName('Turnigy Aerodrive 190kv Left Wheel');

turnigy_Aerodrive_sk3_190kv_RW = Motor(torqueFromMaxPower(2450, rpm(36, 190)), 65, rpm(36, 190), 0, 36);
turnigy_Aerodrive_sk3_190kv_RW.setName('Turnigy Aerodrive 190kv Right Wheel');

MESB_VBELT_TR3_D85_DM = ESB([turnigy_Aerodrive_sk3_190kv_LW, turnigy_Aerodrive_sk3_190kv_RW], 3, .9, lb_to_kg(20), 85);

incline = 0;
userWeight = lb_to_kg(175);
MESB_VBELT_TR3_D85_DM.staticDraw(incline, userWeight);

% maxSpeed_RPM_wheel = 2103.7;
% speedRatioMotor = 3;
% % Assumes speed is given as an rpm
% motor_RPM = speed * speedRatioMotor;