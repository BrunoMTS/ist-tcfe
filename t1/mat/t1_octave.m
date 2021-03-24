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
Va = 5.01015797903;
Id = 1.02637626609*10^-3 ;
Kb = 7.27607852163*10^-3 ; 
Kc = 8.13697715515*10^3 ;

printf("input_values_TAB\n");
R1  
R2 
R3 
R4 
R5 
R6 
R7 
Va 
Id 
Kb 
Kc
printf("input_values_END\n");

A=[R1+R3+R4,-R3,-R4,0;Kb*R3,1-Kb*R3,0,0;-R4,0,R6+R4-Kc+R7,0;0,0,0,1];
B=[-Va;0;0;Id];
M=A\B;
printf("octavecurrent_TAB\n");
Ja=M(1)
Jb=M(2)
Jc=M(3)
Jd=M(4)
printf("octavecurrent_END\n");

C=[-G1,G1+G2+G3,-G2,0,-G3,0,0;0,-Kb,0,-G5,Kb+G5,0,0;0,-G2-Kb,G2,0,Kb,0,0;0,0,0,0,0,G6+G7,-G7;1,0,0,0,0,0,0;0,0,0,0,1,Kc*G6,-1;0,G3,0,G5,-G4-G5-G3,G7,-G7];
D=[0;-Id;0;0;Va;0;Id];
N=C\D;

printf("octavevoltage_TAB\n");
V1=N(1)
V2=N(2)
V3=N(3)
V4=N(4)
V5=N(5)
V6=N(6)
V7=N(7)
printf("octavevoltage_END\n");


