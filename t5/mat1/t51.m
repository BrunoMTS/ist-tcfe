
f = logspace(1, 8, 200);





C1=1.5*10^-6;
R1=1000;
R2=1000;
R3=100000;



Gain = 1 + (R3 / R2)

for i = 1:200

s(i) = 2*pi*f(i)*j
Tf(i) = Gain * ((R1 * C1 * s(i)) / (1 + (R1 * C1 * s(i))))


Tf_abs(i)=20*log10(Tf(i));
Tf_fas(i)=arg(Tf(i))*180/pi;
endfor



b1 = figure ();
semilogx(f, Tf_abs,"-;Gain;");
xlabel ("Frequency [rad/s]");
ylabel ("Magnitude [dB]");
grid on;
print (b1, "b1.eps", "-depsc");

b2 = figure ();
semilogx(f, Tf_fas,"-;Phase;");
xlabel ("Frequency [rad/s]");
ylabel ("Phase [rad/s]");
grid on;
print (b2, "b2.eps", "-depsc");


printf("Cost_TAB\n");
OPAMP=13322.58
CIRCUIT=105
TOTAL=OPAMP+CIRCUIT
printf("Cost_END\n");

printf("fm_TAB\n");
GAIN=9.987576e+01
GAINDEV=abs(100-GAIN)
CENTRALFREQ=1.030792e+03
CENTRALFREQDEV=abs(1000-CENTRALFREQ)
COST=TOTAL
FM=1/(COST*(GAINDEV+CENTRALFREQDEV+10^(-6)))
printf("fm_END\n");

printf("comp_TAB\n");
R1=1
R2=1
R3=100
C1=1
C2=1
C3=1
printf("comp_END\n");
