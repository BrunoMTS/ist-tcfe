%Primeiro ponto-----------------------------------------------------------------

R1 = 1.03034608494*10^3 ;
R2 = 2.03076273175*10^3 ;
R3 = 3.09442618781*10^3 ;
R4 = 4.08713017488*10^3 ;
R5 = 3.00518812223*10^3 ;
R6 = 2.03106965039*10^3 ;
R7 = 1.04759435052*10^3 ;
G1=1/R1;
G2=1/R2;
G3=1/R3;
G4=1/R4;
G5=1/R5;
G6=1/R6;
G7=1/R7;
Vs = 5.01015797903;
vs1 = 5.01015797903;
C = 1.02637626609*10^-6;
Kb = 7.27607852163*10^-3 ; 
Kd = 8.13697715515*10^3 ;



A=[
G1,-G1-G2-G3,G2,G3,0,0,0;
0,-Kb,0,Kb+G5,-G5,0,0;
0,G2+Kb,-G2,-Kb,0,0,0;
0,0,0,0,0,-G6-G7,G7;
1,0,0,0,0,0,0;
0,0,0,1,0,Kd*G6,-1;
0,G3,0,-G4-G5-G3,G5,G7,-G7];
B=[0;0;0;0;Vs;0;0];
N=A\B;
v61=N(5);
printf("octavevalues1_TAB\n");
V1=N(1)
V2=N(2)
V3=N(3)
V5=N(4)
V6=N(5)
V7=N(6)
V8=N(7)
I1=(N(1)-N(2))*G1
I2=(N(3)-N(2))*G2
I3=(N(2)-N(4))*G3
I4=(N(4))*G4
I5=(N(4)-N(5))*G5
I6=-(N(6)-N(7))*G7
I7=(N(6)-N(7))*G7
Id=(-N(6))*G6
Ic=0
printf("octavevalues1_END\n");

%Segundo Ponto-----------------------------------------------------------------------

Vs = 0;
Vx = N(5)-N(7);


A=[
G1,-G1-G2-G3,G2,G3,0,0,0;
0,G2+Kb,-G2,-Kb,0,0,0;
0,0,0,0,1,0,-1;
0,0,0,0,0,-G6-G7,G7;
1,0,0,0,0,0,0;
0,0,0,1,0,Kd*G6,-1;
0,G3-Kb,0,-G4-G3+Kb,0,G7,-G7];
B=[0;0;Vx;0;Vs;0;0];
N=A\B;

Ix=(N(4)-N(5))*G5;
Req=-Vx/Ix;
Tau=Req*C;

printf("octavevalues2_TAB\n");
V1=N(1)
V2=N(2)
V3=N(3)
V5=N(4)
V6=N(5)
V7=N(6)
V8=N(7)
I1=(N(1)-N(2))*G1
I2=(N(3)-N(2))*G2
I3=(N(2)-N(4))*G3
I4=(N(4))*G4
I5=(N(4)-N(5))*G5
I6=-(N(6)-N(7))*G7
I7=(N(6)-N(7))*G7
Id=(-N(6))*G6
Vx
Ix
Req
Tau
printf("octavevalues2_END\n");

%Terceiro Ponto---------------------------------------------------------------------------

pkg load symbolic


syms t
syms V6n(t)


t=0:1e-5:20e-3; 

V6n = Vx * exp( -t / Tau );

nr = figure ();
plot (t*1000, V6n, "b");
hold on;
xlabel ("t[ms]");
ylabel ("V6n(t) [V]");
print (nr, "natural_response.eps", "-depsc");


%Quarto Ponto-----------------------------------------------------------------------------

Vs = 1;

Zc = -j/(2*pi*1000*C);

A=[
G1,-G1-G2-G3,G2,G3,0,0,0;
0,-Kb,0,Kb+G5,-G5-1/Zc,0,1/Zc;
0,G2+Kb,-G2,-Kb,0,0,0;
0,0,0,0,0,-G6-G7,G7;
1,0,0,0,0,0,0;
0,0,0,1,0,Kd*G6,-1;
0,G3,0,-G4-G5-G3,G5+1/Zc,G7,-G7-1/Zc];
B=[0;0;0;0;Vs;0;0];
N=A\B;

printf("octavevalues3_TAB\n");
V1=N(1)
V2=N(2)
V3=N(3)
V5=N(4)
V6=N(5)
V7=N(6)
V8=N(7)
printf("octavevalues3_END\n");

t=0:1e-6:20e-3; %s

vs = sin(2 * pi * 1000 * t);
v6f=abs(N(6))*sin(2 * pi * 1000 * t+arg(N(6)));


fr = figure ();
plot (t*1000, vs, "-;vs;", t*1000, v6f, "-;v6f;");
hold on;
xlabel ("t[ms]");
ylabel ("Vs(t) [V]");
print (fr, "forced_response.eps", "-depsc");

%Quinto Ponto-----------------------------------------------------------------------------

t1=-5e-3:1e-5:0;
t2=0:1e-5:20e-3; 



vs2 = sin(2 * pi * 1000 * t2);


v62 = Vx*exp(-t2/Tau) + abs(N(6))*sin(2*pi*1000*t2+arg(N(6)));

ts = figure ();
plot (t1*1000, vs1,"b", t2*1000, vs2, "b");
hold on;
plot (t1*1000, v61,"r", t2*1000, v62,"r");
xlabel ("t[ms]");
ylabel ("v(t) [V]");
print (ts, "total_solution.eps", "-depsc");


%Quinto Ponto-----------------------------------------------------------------------------


syms f

f = logspace(-1, 6, 7*5);


for i = 1:35
Zc(i) = -j/(2*pi*f(i)*C);
A=[
G1,-G1-G2-G3,G2,G3,0,0,0;
0,-Kb,0,Kb+G5,-G5-1/Zc(i),0,1/Zc(i);
0,G2+Kb,-G2,-Kb,0,0,0;
0,0,0,0,0,-G6-G7,G7;
1,0,0,0,0,0,0;
0,0,0,1,0,Kd*G6,-1;
0,G3,0,-G4-G5-G3,G5+1/Zc(i),G7,-G7-1/Zc(i)];
B=[0;0;0;0;Vs;0;0];
N=A\B;
V01(i) = N(1);
V02(i) = N(2);
V03(i) = N(3);
V05(i) = N(4);
V06(i) = N(5);
V07(i) = N(6);
V08(i) = N(7);
V06_abs(i)=20*log10(V06(i));
V06_arg(i)=arg(V06(i))*180/pi;
VS_abs(i)=20*log10(V01(i));
VS_arg(i)=arg(V01(i))*180/pi;
VC_abs(i)=20*log10(V06(i)-V08(i));
VC_arg(i)=arg(V06(i)-V08(i))*180/pi;
endfor


at51 = figure ();
semilogx(f, V06_abs,"-;V6;");
xlabel ("Frequency [rad/s]");
ylabel ("Magnitude [dB]");
print (at51, "at51.eps", "-depsc");

at52 = figure ();
semilogx(f, V06_abs,"-;V6;", f, VC_abs,"-;VC;");
xlabel ("Frequency [rad/s]");
ylabel ("Magnitude [dB]");
print (at52, "at52.eps", "-depsc");

at53 = figure ();
semilogx(f, V06_arg,"-;V6;", f, VC_arg,"-;VC;");
xlabel ("Phase [deg]");
ylabel ("Magnitude [dB]");
print (at53, "at53.eps", "-depsc");

at54 = figure ();
semilogx(f, V06_abs,"-;V6;", f, VS_abs,"-;VS;", f, VC_abs,"-;VC;");
xlabel ("Frequency [rad/s]");
ylabel ("Magnitude [dB]");
print (at54, "at54.eps", "-depsc");

