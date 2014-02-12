figure
%Plot of shunt armature current if versus time 
plot(t1,out1(:,1),t2,out2(:,1),'linewidth',2),grid
xlabel('Time,s','fontweight','bold'),ylabel('ia,A','fontweight','bold')
----------------------------------------------------------
figure
%Plot of shunt field current if versus time 
plot(t1,out1(:,2),t2,out2(:,2),'linewidth',2),grid
xlabel('Time,s','fontweight','bold'),ylabel('If-A','fontweight','bold')

figure
%Plot of series field current ifs versus time 
plot(t1,Ifs1,t2,Ifs2,'linewidth',1),grid
xlabel('Time,s','fontweight','bold'),ylabel('ifs,A','fontweight','bold')
axis([0 10 20 100])
figure
%Plot of output voltage versus time
plot(t1,out1(:,3),t2,out2(:,3),'linewidth',2),grid
xlabel('Time,s','fontweight','bold'),ylabel('Vt,V','fontweight','bold')

figure
%Plot of electromechanical torque Te versus time
plot(t1,Te1,t2,Te2,'linewidth',2),grid
xlabel('Time,s','fontweight','bold'),ylabel('Te,N.m','fontweight','bold')

figure
%Plot of speed wr versus time
plot(t1,wr1*60/(2*pi),t2,wr2*60/(2*pi),'-','linewidth',1),grid
xlabel('Time,s','fontweight','bold'),ylabel('wr,rpm','fontweight','bold')

figure
%Plot of the flux linkage of the armature versus time
plot(t1,lambdaA1,t2,lambdaA2,'linewidth',2),grid
xlabel('Time,s','fontweight','bold'),ylabel('\lambda','fontweight','bold')

