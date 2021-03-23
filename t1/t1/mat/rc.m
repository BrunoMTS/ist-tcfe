close all
clear all

%%EXAMPLE SYMBOLIC COMPUTATIONS

pkg load symbolic

syms R1
syms R2
syms R3
syms R4
syms R5
syms R6
syms R7
syms Va
syms Vb
syms Id
syms Kb
syms Kc
syms Ja
syms Jb
syms Jc
syms Jd


printf("\n\n Mesh metode:\n");

Ja*R1 + Va + R4*(Ja-Jb) + R3*(Ja-Jb) = 0

vi(t) = R*i(t)+vo(t)

syms vo_n(t) %natural solution
syms vo_f(t) %forced solution

printf("\n\nSolution is of the form");

v(t) = vo_n(t) + vo_f(t)

printf("\n\nNatural solution:\n");
syms A
syms wn

vi(t) = 0 %no excitation
i_n(t) = C*diff(vo_n, t)


printf("\n\n Natural solution is of the form");
vo_n(t) = A*exp(wn*t)

R*i_n(t)+vo_n(t) == 0

R*C*wn*vo_n(t)+vo_n(t) == 0

R*C*wn+1==0

solve(ans, wn)


%%EXAMPLE NUMERIC COMPUTATIONS

R=1e3 %Ohm
C=100e-9 %F

f = 1000 %Hz
w = 2*pi*f; %rad/s

%time axis: 0 to 10ms with 1us steps
t=0:1e-6:10e-3; %s

Zc = 1/(j*w*C)
Cgain = Zc/(R+Zc)
Gain = abs(Cgain)
Phase = angle(Cgain)

vi = 1*cos(w*t);
vo = Gain*cos(w*t+Phase);

hf = figure ();
plot (t*1000, vi, "g");
hold on;
plot (t*1000, vo, "b");

xlabel ("t[ms]");
ylabel ("vi(t), vo(t) [V]");
print (hf, "forced.eps", "-depsc");
%print forced.eps
