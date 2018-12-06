torqueFromMaxPower = @(power, freeRun) power/freeRun;
rpm = @(volts, rpm_v) rpm_v * volts;
rad_s = @(volts, rpm_v) rpm_v * volts * (1/9.5492965964254);

turnigy_Aerodrive_sk3_190kv = Motor(torqueFromMaxPower(2450, rad_s(36, 190)), 65, rpm(36, 190), 0, 36);
turnigy_Aerodrive_sk3_190kv.setName('Turnigy Aerodrive 190kv');

turnigy_Aerodrive_sk3_245kv = Motor(torqueFromMaxPower(2700, rad_s(36, 245)), 70, rpm(36, 245), 0, 36);
turnigy_Aerodrive_sk3_245kv.setName('Turnigy Aerodrive 245kv');

Tacon_110_295kv = Motor(torqueFromMaxPower(2000, rad_s(55, 295)), 36, rpm(55, 295), 0, 55);
Tacon_110_295kv.setName('Tacon 110 295kv');

ProDrive_v2_5060_270kv = Motor(torqueFromMaxPower(2400, rad_s(29.60, 270)), 90, rpm(29.60, 270), 0, 29.6);
ProDrive_v2_5060_270kv.setName('ProDrive v2 5060 270kv');

turnigy_Aerodrive_sk3_190kv.plotProperties();
% turnigy_Aerodrive_sk3_245kv.plotProperties();
% Tacon_110_295kv.plotProperties();
% ProDrive_v2_5060_270kv.plotProperties();