


f = logspace(1, 8, 200);





C1=330*10^-9;
R1=1000;
R2=1000;
R3=100000;



Gain = 1 + (R3 / R2)

for i = 1:200


s(i) = 2*pi*f(i)*j
Tf(i) = Gain * ((R1 * C1 * s(i)) / (1 + (R1 * C1 * s(i)))) * ( 1e10 / ((s(i) + 1e4) * (s(i) + 1e6)))
Tf_abs(i)=20*log10(Tf(i));
Tf_fas(i)=arg(Tf(i))*180/pi;
endfor

b3 = figure ();
semilogx(f, Tf_abs,"-;Gain;");
xlabel ("Frequency [rad/s]");
ylabel ("Magnitude [dB]");
grid on;
print (b3, "b3.eps", "-depsc");

b4 = figure ();
semilogx(f, Tf_fas,"-;Phase;");
xlabel ("Frequency [rad/s]");
ylabel ("Phase [rad/s]");
grid on;
print (b4, "b4.eps", "-depsc");

