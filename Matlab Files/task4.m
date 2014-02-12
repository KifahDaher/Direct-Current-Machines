%Dynamic behavior of the DC Generator during a temporary change in speed
clear all
clc
%Initializing some values
p=4;       %number of poles
n=300;     %generator speed(rpm)
Vf=250;    %shunt field voltage(V)
If=1;      %shunt field current (A)
Vfs=0.5;   %series field voltage (V)
Ifs=1;     %series field current (A)
 
%resistances in ohms
rf=130;    %shunt field resistance
rfs=0.14;  %series field resistance 
ra=1.65;   %armature resistance 
 
LFs=0.154;     %Mutual Inductance between the shunt and seies field (H)
Bm=0.25;       %Damping coefficient (N.m.s)%
J=11;          %Inertia (Kg.m^2)    
tauf=0.36;     %Shunt field time constant (sec)
taufs=0.005;   %Series field time constant (sec)
taua=0.02;     %Armature winding time constant (sec)
 %R:Vector for all resistances
R=[rf rfs ra]; 
%Calculating the electric speed
We=2*(pi/60)*(p/2)*n; 
%Calculating the mutual inducatance between the shunt field and armature winding (H)
LAF=Vf/(If*We);
%Calculating the mutual inductance between armature and series field (H)
LAFs=Vfs/(Ifs*We); 
%Calculating the self inductance of the armature winding (H)
LAA=taua*ra;
%Calculating the self inductance of the shunt field (H)
LFF=tauf*rf;
%Calculating the mutual inductance between the shunt and series field (H)
LFFs=taufs*rfs; 
%L:Vector for all self and mutual inductance
L=[LAF LAFs LFF LFFs LAA LFs];
Ifs1=50;
wr=29.8395;
wr1=wr;
%Dynamic behavior of the DC Generator for 50% decrease of initial torque
%with constant load
t01=0;
tfinal1=2.5;
tspan1=[t01,tfinal1];
I01=[42.706 -7.2932 -955.116];
 
[t1,out1]=ode23(@dyn2,tspan1,I01,[],R,L,wr,Ifs1);
 
 
Te1=2*(-LAF.*out1(:,1).*out1(:,2)+LAFs*Ifs1*out1(:,1));
 
 Ifs2=50;
 wr=29.8395;
 wr2=wr;
%Dynamic behavior of the DC generator for a restablishment in torque to 95% 
t02=tfinal1;
tfinal2=5;
tspan2=[t02,tfinal2];
I02=[42.706 -7.2932 -955.116];
 
  rf=150;
 %rfs=10;
%  ra=1.65;
 R=[rf rfs ra]; 
[t2,out2]=ode23(@dyn2,tspan2,I02,[],R,L,wr,Ifs2);
 
Te2=2*(-LAF.*out2(:,1).*out2(:,2)+LAFs*Ifs2*out2(:,1));
 
 
%Plot of armature current ia versus time
subplot(7,1,1),plot(t1,out1(:,1),t2,out2(:,1),'linewidth',2),grid
xlabel('Time,s','fontweight','bold'),ylabel('ia,A','fontweight','bold')
 
 
%Plot of shunt field current if versus time 
subplot(7,1,2),plot(t1,out1(:,2),t2,out2(:,2),'linewidth',2),grid
xlabel('Time,s','fontweight','bold'),ylabel('If-A','fontweight','bold')
 
 
%Plot of series field current ifs versus time 
subplot(7,1,3),plot(t1,Ifs1,t2,Ifs2,'linewidth',1),grid
xlabel('Time,s','fontweight','bold'),ylabel('ifs,A','fontweight','bold')
 
 
%Plot of output voltage versus time
subplot(7,1,4),plot(t1,out1(:,3),t2,out2(:,3),'linewidth',2),grid
xlabel('Time,s','fontweight','bold'),ylabel('Vt,V','fontweight','bold')
 
%Plot of electromechanical torque Te versus time
subplot(7,1,5),plot(t1,Te1,t2,Te2,'linewidth',2),grid
xlabel('Time,s','fontweight','bold'),ylabel('Te,N.m','fontweight','bold')
 
 
%Plot of speed wr versus time
subplot(7,1,6),plot(t1,wr1*60/(2*pi),t2,wr2*60/(2*pi),'-','linewidth',1),grid
xlabel('Time,s','fontweight','bold'),ylabel('wr,rpm','fontweight','bold')
 
 
lambdaA1=LAF*out1(:,2)+LAA*out1(:,1)+LAFs*Ifs1;
lambdaA2=LAF*out2(:,2)+LAA*out2(:,1)+LAFs*Ifs1;
 
%Plot of the flux linkage of the armature versus time
subplot(7,1,7),plot(t1,lambdaA1,t2,lambdaA2,'linewidth',2),grid
xlabel('Time,s','fontweight','bold'),ylabel('\lambda','fontweight','bold')
