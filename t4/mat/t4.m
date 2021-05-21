%gain stage

printf("gscircuitvalues_TAB\n");
VT=25e-3
BFN=178.7
VAFN=69.7
RE1=100
RC1=400
RB1=50000
RB2=50000
VBEON=0.7
VCC=12
RS=100
C1=1
Cb=10
printf("gscircuitvalues_END\n");


printf("oscircuitvalues_TAB\n");
BFP = 227.3
VAFP = 37.2
RE2 = 100
VEBON = 0.7
Rout=100
Co=1
printf("oscircuitvalues_END\n");


printf("zongspice_TAB\n");
ZO = 2.743123e-01
printf("zongspice_END\n");

printf("zingspice_TAB\n");
ZI = 1.061204e-03
printf("zingspice_END\n");

printf("gsopoctave_TAB\n");
RB=1/(1/RB1+1/RB2)
VEQ=RB2/(RB1+RB2)*VCC
IB1=(VEQ-VBEON)/(RB+(1+BFN)*RE1)
IC1=BFN*IB1
IE1=(1+BFN)*IB1
VE1=RE1*IE1
VO1=VCC-RC1*IC1
VCE=VO1-VE1
gm1=IC1/VT
rpi1=BFN/gm1
ro1=VAFN/IC1
printf("gsopoctave_END\n");




AV1 = RC1*(RE1-gm1*rpi1*ro1)/((ro1+RC1+RE1)*(1/(1/RB+1/rpi1)+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)

AV1simple = gm1*RC1/(1+gm1*RE1)

RE1=0
AV1 = RC1*(RE1-gm1*rpi1*ro1)/((ro1+RC1+RE1)*(1/(1/RB+1/rpi1)+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)
AV1simple = gm1*RC1/(1+gm1*RE1)

%RE1=100

%ZI1 = ((ro1+RC1+RE1)*(1/(1/RB+1/rpi1)+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)/(ro1+RC1+RE1)
ZI1 = 1/(1/RB + 1/rpi1)
ZO1 = 1/(1/ro1+ 1/RC1)
%ZX = ro1*((RB+rpi1)*RE1/(RB+rpi1+RE1))/(1/(1/ro1+1/(rpi1+RB)+1/RE1+gm1*rpi1/(rpi1+RB)))

%ZO1 = 1/(1/ZX+1/RC1)


printf("gsoctave_TAB\n");
AV1
AV1db = 20*log(-AV1)
ZI1
ZO1
printf("gsoctave_END\n");


%ouput stage
BFP = 227.3
VAFP = 37.2
RE2 = 100
VEBON = 0.7
printf("osopoctave_TAB\n");
VI2 = VO1
IE2 = (VCC-VEBON-VI2)/RE2
IC2 = BFP/(BFP+1)*IE2
VO2 = VCC - RE2*IE2
printf("osopoctave_END\n");
gm2 = IC2/VT
go2 = IC2/VAFP
gpi2 = gm2/BFP
ge2 = 1/RE2


AV2 = gm2/(gm2+gpi2+go2+ge2)



ZI2 = (gm2+gpi2+go2+ge2)/gpi2/(gpi2+go2+ge2)

ZO2 = 1/(gm2+gpi2+go2+ge2)

printf("osoctave_TAB\n");
AV2
AV2db = 20*log(AV2)
ZI2
ZO2
printf("osoctave_END\n");

printf("gzoctave_TAB\n");
AV=20*log(-AV1)
ZI=ZI1
ZO=ZO2
printf("gzoctave_END\n");

printf("gzspice_TAB\n");
AV=37.44713
ZI=274.3123
ZO=1.061204
printf("gzspice_END\n");

printf("cost_TAB\n");
RESISTORS=200.4
CAPACITORS=12000
TRANSISTORS=0.2
printf("cost_END\n");

printf("fm_TAB\n");
GAIN=37.44713
FREQL=1.480389e+01
FREQU=1.981780e+06
BANDWITH=1.981765e+06
COST=12000+200.4+0.2
FM=GAIN*BANDWITH/COST/FREQL
printf("fm_END\n");


