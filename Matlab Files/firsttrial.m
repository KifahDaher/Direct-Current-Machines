%the voltage vs current & torque vs speed steady state plot characteristic
%of a cumulatively compounded DC generator
%Initializing some values
p=4;       %number of poles
n=1000;    %generator speed(rpm)
VF=250;    %shunt field voltage(V)
IF=1;      %shunt field current (A)
VFs=0.5;   %series field voltage (V)
IFs=1;     %series field current (A)
%Vt=300;    %generator rated voltage (V)
 
%resistances in ohms
rf=130;    %shunt field resistance
rfs=0.14;  %series field resistance 
ra=1.65;   %armature resistance 
 
%Calculating the electric speed
We=((2*pi)/60)*(p/2)*n;  
%Calculating the mutual inductance between the shunt field and armature winding
LAF=VF/(IF*We);   
%Calculating the mutual inductance between armature and series field
LAFs=VFs/(IFs*We);
 
%Calculation of the induced torque and voltage 
wr=104.71;
O=-rf*ra+rfs*wr*LAF-ra*rfs-rf*wr*LAFs-rf*rfs; %parameters for simplification
P=rf-wr*LAF-wr*LAFs;                          %parameters for simplification
Ia=(0:60);
Vt=(O./P).*(Ia-IF);
wr2=[0:60];
Te2=-wr*LAF*IF*Ia+wr*LAFs*IFs*Ia
Te=2.*(P.^2./O.^2).*Vt.*(-LAF+(rf.*LAF-Vt.*LAFs+rf.*LAFs)./(rf+rfs))-((2.*Vt.*LAF.*P)./(O.*(rf+rfs)));

 
%Plot the torque-speed characteristic
plot(wr2*60/(2*pi),Te2,'b','linewidth',2),grid
xlabel('Speed,rpm','fontweight','bold')
ylabel('Torque,N.m','fontweight','bold')
title('the torque-speed characteristic')
figure
%Plot the voltage-current characteristic
plot(Ia,Vt,'b','linewidth',2),grid
xlabel('current,A','fontweight','bold') 
ylabel('Voltage,V','fontweight','bold')
title('the voltage-current characteristic')
%axis([-30 30 -300 300]); 
