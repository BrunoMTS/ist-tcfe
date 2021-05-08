

n=0.356085;
A=230*n;
t=linspace(0, 10e-2, 1000);
f=50;
w=2*pi*f;
vS = A * sin(w*t);
vOfr = zeros(1, length(t));
vO = zeros(1, length(t));

R=170*10^3+1229.17;
C=305*10^-6;
tOFF = 1/w * atan(1/w/R/C) +1/4/f;

vOnexp = (A-0.7)*sin(w*tOFF)*exp(-(t-tOFF)/R/C);

figure
for i=1:length(t) 
  if (vS(i) > 1.4)
    vOfr(i) = vS(i)-0.7;
  else if (vS(i) < -1.4)
    vOfr(i) = -vS(i)-0.7;
  else 
    vOfr(i) = 0;
  endif
  endif
endfor




nr = figure ();
plot(t*1000, vOfr);
hold on;
xlabel ("t[ms]");
ylabel ("VOfr(t) [V]");
print (nr, "vOfr.eps", "-depsc");



for i=1:length(t) 
  if t(i) < tOFF
    vO(i) = vOfr(i);
  elseif vOnexp(i) > vOfr(i)
    vO(i) = vOnexp(i);
  else 
    vO(i) = vOfr(i);
    tOFF=tOFF+1/2/f;
    vOnexp = abs((A-0.7)*sin(w*tOFF)*exp(-(t-tOFF)/R/C));
  endif
endfor

for i=200:length(t) 
vOmin=vO(i);
if(vOmin<vO(i))
vOmin=vO(i);
endif
endfor


nt = figure ();
plot(t*1000, vOfr);
hold;
plot(t*1000, vO);
hold on;
xlabel ("t[ms]");
legend("rectified","envelope")
print (nt, "envelope.eps", "-depsc");




rippleED=max(vO)-vOmin;
ripple=rippleED*1229.17/(1229.17+170*10^3);
format short e
printf("ripple_TAB\n");
Ripple = ripple
printf("ripple_END\n");

vOfinal=vO*12/81.192;
nw = figure ();
plot(t*1000, vOfinal) ;
hold on;
xlabel ("t[ms]");
print (nw, "vofinal.eps", "-depsc");


format short g
printf("costs_TAB\n");
Diodes = 2.3
Resistance = 170
Capacitor = 305
printf("costs_END\n");

printf("fm_TAB\n");
Msimulation = 1/(2.3+170+305)/(1.8*10^-4+10^-6)
Mtheoretical = 1/(2.3+170+305)/(ripple+10^-6)
printf("fm_END\n");


