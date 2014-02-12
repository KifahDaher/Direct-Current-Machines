function [DCGEN]=dyn2(~,I0,R,L,wr,Ifs)

%Inductances 
LAF=L(1);LAFs=L(2);LFF=L(3); LFFs=L(4);LAA=L(5);LFs=L(6);
%Resistances
rf=R(1);rfs=R(2);ra=R(3);
 
%Initial condition Ia,If & wr
Ia=I0(1);
If=I0(2);
Vt=I0(3);

%Parameters for equation simplification
C=LFs/(LFs^2-LAA*LFF-LAA*LFs-LFFs*LFF);
D=wr*LAF+wr*LAFs+rfs-((LAA*rf)/LFs)-(LFFs*rf/LFs);
E=wr*LAFs+rfs+ra;
F=(LAA+LFFs)/LFs;
G=(LFF+LFs)/LFs;
K=wr*LAF+rfs+(LFF+LFs)*(C*E-C*D)-ra-(((LAA*rfs)/LFs)+(LFF*LAA+LFs*LAA)*(C*E-C*D)/LFs);
L1=-wr*LAF-rf+(LFF+LFs)*C*D-wr*LAFs-rfs-((-rfs*LAA/LFs)+((LFF*LAA+LFs*LAA)*(C*D)/LFs));
M=-1-(LFF+LFs)*C*E-((-LAA/LFs)-((LFs*LAA+LFs*LAA)*(C*E)/LFs));
N=1-(LFF+LFs)*C+((LFF*LAA+LAA*LFs)*C/LFs);
A1=1+(LFF/LFs)+((LFF^2+LFs*LFF)*(C*E)/LFs)-M;
B1=rf+(LFF*rfs/LFs)+((LFF^2+LFs*LFF)/LFs)*(C*E-D*C)+K/N;
C1=-rf-((rfs*LFF)/LFs)+((LFF^2+LFF*LFs)*(C*D)/LFs)+L1/N;
D1=K/N+(M*B1)/(N*A1);


%equation of derivatives dif, dia & dwr

%dia=(rfs/LFs +G.*(C.*(E-D))).*Ia + (-rfs/LFs+G.*C.*D).*Ifs+(G.*C).*Vt+(-1/LFs-G.*C.*E).*(rf*If+LFF*(1./(F+LFF)).*(C.*Vt-(F.*rf+C.*D).*If+E.*Ia));
dia=(-1/LAA)*(((LFs/LFF)-1)*Vt+(wr*LAF-(rf*LFs/LFF))*If+((LFs*rfs/LFF)-wr*LAFs-rfs)*Ifs+ra*Ia);
dif=(1/LFF)*(Vt+rfs*Ifs-rf*(Ia-Ifs));
%dvf=(1./A1).*(((rfs/LFs)+G.*C.*(E-D)+K/N).*Ia+((-rfs/LFs)+G.*C.*D+L1/N).*Ifs+(M/N-(1/LFs)-G.*C.*E).*Vf);
%dvt=(D1.*(((rfs/LFs)+G.*C.*(E-D)-(B1./A1).*((-1/LFs)-G.*C.*E)).*Ia+ ((-rfs/LFs)+G.*C.*D+(C1./A1).*((-1/LFs)-G.*C.*E)).*Ifs+(G.*C).*Vt));
dvt=(-LFF/LFs)*(rf-(rf/LFF))*(1/LFF)*(Vt+rfs*Ifs-rf*If);
DCGEN=[dia;dif;dvt];


