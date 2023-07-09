%Modewise Strain Plot for Bending and shear strain at base and at mid
%%
%Reading strain results from orthogonal filter approach
mstr1=(xlsread("20210619_bending_strain_from_disp_mdlim.xlsx","mode1"));
mstr2=(xlsread("20210619_bending_strain_from_disp_mdlim.xlsx","mode2"));
mstr3=(xlsread("20210619_bending_strain_from_disp_mdlim.xlsx","mode3"));
mstr=(xlsread("20210619_bending_strain_from_disp_mdlim.xlsx","total"));

sstr1=(xlsread("20210619_shear_strain_from_disp_mdlim.xlsx","mode1"));
sstr2=(xlsread("20210619_shear_strain_from_disp_mdlim.xlsx","mode2"));
sstr3=(xlsread("20210619_shear_strain_from_disp_mdlim.xlsx","mode3"));
sstr=(xlsread("20210619_shear_strain_from_disp_mdlim.xlsx","total"));

t=linspace(0,length(mstr)*0.01,length(mstr));

%Plotting bending strain at base
figure(1)
plot(t,mstr1(:,9));
title("Bending Strain at base (Mode 1)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);

figure(2)
plot(t,mstr2(:,9));
title("Bending Strain at base (Mode 2)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);

figure(3)
plot(t,mstr3(:,9));
title("Bending Strain at base (Mode 3)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);


%Plotting shear strain at base
figure(4)
plot(t,sstr1(:,8));
title("Shear Strain at base (Mode 1)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);

figure(5)
plot(t,sstr2(:,8));
title("Shear Strain at base (Mode 2)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);

figure(6)
plot(t,sstr3(:,8));
title("Shear Strain at base (Mode 3)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);


%Plotting bending strain at mid
figure(7)
plot(t,mstr1(:,5));
title("Bending Strain at mid (Mode 1)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);

figure(8)
plot(t,mstr2(:,5));
title("Bending Strain at mid (Mode 2)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);

figure(9)
plot(t,mstr3(:,5));
title("Bending Strain at mid (Mode 3)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);


%Plotting shear strain at mid
figure(10)
plot(t,sstr1(:,5));
title("Shear Strain at mid (Mode 1)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);

figure(11)
plot(t,sstr2(:,5));
title("Shear Strain at mid (Mode 2)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);

figure(12)
plot(t,sstr3(:,5));
title("Shear Strain at mid (Mode 3)",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);

