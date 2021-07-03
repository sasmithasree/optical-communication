
clear;
close;
clc;
//physical constants
h=6.624e-34; //plank&#39;s constant
c=3e8; //speed of light in free space - constant
e=1.6e-19; //charge of electron
//Input
lambda=1.31e-6; 
tr=30e-9; 
tnr=100e-9;
t=(tr*tnr)/(tr+tnr);
printf( The bulk recombination lifetime is %0.1f ns,t*1e9);
Nint=t/tr; //Internal Quantum Efficiency
printf(Internal Quantum Efficiency is %0.3f,Nint);
for i=1:40 //current in milliamperes
L(i)=i;
pint(i)=(Nint*L(i)*h*c)/(e*lambda); //Internally generated power
end
printf(Internally generated power is %0.1f mW, pint(i));
//Assume the refractive index of LED material is n=3.5
// External Quantum Efficiency
n=3.5;
//Refractive index of LED material
Next=1/(n*(n+1)^2)*100;
printf( External Quantum Efficiency is %0.3f, Next);
//Optical power emitted from LED
P=(pint*1e-3*Next);

plot2d(L,P,-3);
xtitle(DC Characteristics of LED,Current(mA),Power(mW));
