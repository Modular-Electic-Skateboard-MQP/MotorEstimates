% Test motor script
clear all

ov = 12;
frs = 60;
st = 70;
fra = 0;
sa = 2;

sampleMotor = Motor(st, sa, frs, fra, ov);

sampleMotor.plotProperties();