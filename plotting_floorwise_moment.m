%Comparison of Floor Moment%

%%
%Moment from MRHA
% acc_MRHA1=xlsread("20210623_bending_moment_from_disp_MRHA_3modes_updated.xlsx","mode1");
% acc_MRHA2=xlsread("20210623_bending_moment_from_disp_MRHA_3modes_updated.xlsx","mode2");
% acc_MRHA3=xlsread("20210623_bending_moment_from_disp_MRHA_3modes_updated.xlsx","mode3");
% acc_MRHA=xlsread("20210623_bending_moment_from_disp_MRHA_3modes_updated.xlsx","total");
% to=linspace(0,length(acc_MRHA)*0.001,length(acc_MRHA));
% 
% %%
% %Moment from Orthogonal Filter
% acc_Mdlim1=xlsread("20210619_bending_moment_from_disp_mdlim.xlsx","mode1");
% acc_Mdlim2=xlsread("20210619_bending_moment_from_disp_mdlim.xlsx","mode2");
% acc_Mdlim3=xlsread("20210619_bending_moment_from_disp_mdlim.xlsx","mode3");
% acc_Mdlim=xlsread("20210619_bending_moment_from_disp_mdlim.xlsx","total");
% t1=linspace(0,length(acc_Mdlim)*0.01,length(acc_Mdlim));
% 
% %%
% floor=8:-1:0;
% %%
% % MRHA
% for f=1:9
%     acc_MRHA1max(f)=max(acc_MRHA1(:,f));
% %     acc_MRHA1max(9)=0;
%     acc_MRHA2max(f)=max(acc_MRHA2(:,f));
% %     acc_MRHA2max(9)=0;
%     acc_MRHA3max(f)=max(acc_MRHA3(:,f));
% %     acc_MRHA3max(9)=0;
%     acc_MRHAmax(f)=max(acc_MRHA(:,f));
% %     acc_MRHAmax(9)=0;
%     
%     
%     acc_MRHA1min(f)=min(acc_MRHA1(:,f));
% %     acc_MRHA1min(9)=0;
%     acc_MRHA2min(f)=min(acc_MRHA2(:,f));
% %     acc_MRHA2min(9)=0;
%     acc_MRHA3min(f)=min(acc_MRHA3(:,f));
% %     acc_MRHA3min(9)=0;
%     acc_MRHAmin(f)=min(acc_MRHA(:,f));
% %     acc_MRHAmin(9)=0;
% end
% %%
% %MDlim
% for f=1:9
%     acc_Mdlim1max(f)=max(acc_Mdlim1(:,f));
% %     acc_Mdlim1max(9)=0;
%     acc_Mdlim2max(f)=max(acc_Mdlim2(:,f));
% %     acc_Mdlim2max(9)=0;
%     acc_Mdlim3max(f)=max(acc_Mdlim3(:,f));
% %     acc_Mdlim3max(9)=0;
%     acc_Mdlimmax(f)=max(acc_Mdlim(:,f));
% %     acc_Mdlimmax(9)=0;
%     
%     
%     acc_Mdlim1min(f)=min(acc_Mdlim1(:,f));
% %     acc_Mdlim1min(9)=0;
%     acc_Mdlim2min(f)=min(acc_Mdlim2(:,f));
% %     acc_Mdlim2min(9)=0;
%     acc_Mdlim3min(f)=min(acc_Mdlim3(:,f));
% %     acc_Mdlim3min(9)=0;
%     acc_Mdlimmin(f)=min(acc_Mdlim(:,f));
% %     acc_Mdlimmin(9)=0;
% end
% 
% %%
% %Plotting
% 
% %%
% %Mode 1
% figure (1)
% p1=plot(acc_MRHA1max,floor,'-*k');
% hold on;
% plot(acc_MRHA1min,floor,'-*k');
% hold on;
% p2=plot(acc_Mdlim1max,floor,'r');
% hold on;
% plot(acc_Mdlim1min,floor,'r');
% hold on;
% % Adding Marker on floor with accelerometers
% % plot(acc_Mdlim1max(1),8,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim1max(4),5,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim1max(7),2,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim1min(1),8,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim1min(4),5,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim1min(7),2,'ob','LineWidth',3);
% % hold on;
% h=[p1;p2];
% h1=legend(h,'MRHA','Orthogonal Filter');
% title("Comparison of Mode wise floor Moment, Mode1","fontsize",18);
% xlabel("Moment","fontsize",16);
% ylabel("Floor","fontsize",16);
% h1.FontSize=16;
% ax=gca;
% ax.XAxisLocation='origin';
% ax.XAxis.LineWidth=2;
% ax.YAxisLocation='origin';
% ax.YAxis.LineWidth=2;
% ax.XAxis.FontSize=16;
% ax.YAxis.FontSize=16;
% ylim=[0 10];
% 
% %%
% %Mode 2
% figure (2)
% p1=plot(acc_MRHA2max,floor,'-*k');
% hold on;
% plot(acc_MRHA2min,floor,'-*k');
% hold on;
% p2=plot(acc_Mdlim2max,floor,'r');
% hold on;
% plot(acc_Mdlim2min,floor,'r');
% hold on;
% % Adding Marker on floor with accelerometers
% % plot(acc_Mdlim2max(1),8,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim2max(4),5,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim2max(7),2,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim2min(1),8,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim2min(4),5,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim2min(7),2,'ob','LineWidth',3);
% % hold on;
% h=[p1;p2];
% h1=legend(h,'MRHA','Orthogonal Filter');
% title("Comparison of Mode wise floor Moment, Mode2","fontsize",18);
% xlabel("Moment","fontsize",16);
% ylabel("Floor","fontsize",16);
% h1.FontSize=16;
% ax=gca;
% ax.XAxisLocation='origin';
% ax.XAxis.LineWidth=2;
% ax.YAxisLocation='origin';
% ax.YAxis.LineWidth=2;
% ax.XAxis.FontSize=16;
% ax.YAxis.FontSize=16;
% ylim=[0 10];
% 
% %%
% %Mode 3
% figure (3)
% p1=plot(acc_MRHA3max,floor,'-*k');
% hold on;
% plot(acc_MRHA3min,floor,'-*k');
% hold on;
% p2=plot(acc_Mdlim3max,floor,'r');
% hold on;
% plot(acc_Mdlim3min,floor,'r');
% hold on;
% % Adding Marker on floor with accelerometers
% % plot(acc_Mdlim3max(1),8,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim3max(4),5,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim3max(7),2,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim3min(1),8,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim3min(4),5,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlim3min(7),2,'ob','LineWidth',3);
% % hold on;
% h=[p1;p2];
% h1=legend(h,'MRHA','Orthogonal Filter');
% title("Comparison of Mode wise floor Moment, Mode3","fontsize",18);
% xlabel("Moment","fontsize",16);
% ylabel("Floor","fontsize",16);
% h1.FontSize=16;
% ax=gca;
% ax.XAxisLocation='origin';
% ax.XAxis.LineWidth=2;
% ax.YAxisLocation='origin';
% ax.YAxis.LineWidth=2;
% ax.XAxis.FontSize=16;
% ax.YAxis.FontSize=16;
% ylim=[0 10];
% 
% %%
% %Total
% figure (4)
% p1=plot(acc_MRHAmax,floor,'-*k');
% hold on;
% plot(acc_MRHAmin,floor,'-*k');
% hold on;
% p2=plot(acc_Mdlimmax,floor,'r');
% hold on;
% plot(acc_Mdlimmin,floor,'r');
% hold on;
% % Adding Marker on floor with accelerometers
% % plot(acc_Mdlimmax(1),8,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlimmax(4),5,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlimmax(7),2,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlimmin(1),8,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlimmin(4),5,'ob','LineWidth',3);
% % hold on;
% % plot(acc_Mdlimmin(7),2,'ob','LineWidth',3);
% % hold on;
% h=[p1;p2];
% h1=legend(h,'MRHA','Orthogonal Filter');
% title("Comparison of Mode wise floor Moment, Total","fontsize",18);
% xlabel("Moment","fontsize",16);
% ylabel("Floor","fontsize",16);
% h1.FontSize=16;
% ax=gca;
% ax.XAxisLocation='origin';
% ax.XAxis.LineWidth=2;
% ax.YAxisLocation='origin';
% ax.YAxis.LineWidth=2;
% ax.XAxis.FontSize=16;
% ax.YAxis.FontSize=16;
% ylim=[0 10];


clear all;
close all;

%%
%Moment from MRHA
acc_MRHA1=xlsread("20210623_bending_moment_from_disp_MRHA_3modes.xlsx","mode1");
acc_MRHA2=xlsread("20210623_bending_moment_from_disp_MRHA_3modes.xlsx","mode2");
acc_MRHA3=xlsread("20210623_bending_moment_from_disp_MRHA_3modes.xlsx","mode3");
acc_MRHA=xlsread("20210623_bending_moment_from_disp_MRHA_3modes.xlsx","total");
to=linspace(0,length(acc_MRHA)*0.001,length(acc_MRHA));

%%
%Moment from Orthogonal Filter
acc_Mdlim1=xlsread("20210619_bending_moment_from_disp_mdlim.xlsx","mode1");
acc_Mdlim2=xlsread("20210619_bending_moment_from_disp_mdlim.xlsx","mode2");
acc_Mdlim3=xlsread("20210619_bending_moment_from_disp_mdlim.xlsx","mode3");
acc_Mdlim=xlsread("20210619_bending_moment_from_disp_mdlim.xlsx","total");
t1=linspace(0,length(acc_Mdlim)*0.01,length(acc_Mdlim));

%%
floor=8:-1:0;
%%
% MRHA
for f=1:9
    acc_MRHA1max(f)=max(acc_MRHA1(:,f));
%     acc_MRHA1max(9)=0;
    acc_MRHA2max(f)=max(acc_MRHA2(:,f));
%     acc_MRHA2max(9)=0;
    acc_MRHA3max(f)=max(acc_MRHA3(:,f));
%     acc_MRHA3max(9)=0;
    acc_MRHAmax(f)=max(acc_MRHA(:,f));
%     acc_MRHAmax(9)=0;
    
    
    acc_MRHA1min(f)=min(acc_MRHA1(:,f));
%     acc_MRHA1min(9)=0;
    acc_MRHA2min(f)=min(acc_MRHA2(:,f));
%     acc_MRHA2min(9)=0;
    acc_MRHA3min(f)=min(acc_MRHA3(:,f));
%     acc_MRHA3min(9)=0;
    acc_MRHAmin(f)=min(acc_MRHA(:,f));
%     acc_MRHAmin(9)=0;
end
%%
%MDlim
for f=1:9
    acc_Mdlim1max(f)=max(acc_Mdlim1(:,f));
%     acc_Mdlim1max(9)=0;
    acc_Mdlim2max(f)=max(acc_Mdlim2(:,f));
%     acc_Mdlim2max(9)=0;
    acc_Mdlim3max(f)=max(acc_Mdlim3(:,f));
%     acc_Mdlim3max(9)=0;
    acc_Mdlimmax(f)=max(acc_Mdlim(:,f));
%     acc_Mdlimmax(9)=0;
    
    
    acc_Mdlim1min(f)=min(acc_Mdlim1(:,f));
%     acc_Mdlim1min(9)=0;
    acc_Mdlim2min(f)=min(acc_Mdlim2(:,f));
%     acc_Mdlim2min(9)=0;
    acc_Mdlim3min(f)=min(acc_Mdlim3(:,f));
%     acc_Mdlim3min(9)=0;
    acc_Mdlimmin(f)=min(acc_Mdlim(:,f));
%     acc_Mdlimmin(9)=0;
end

%%
%Plotting

%%
%Mode 1
figure (1)
a=figure;
a.Color='white';
subplot (2,2,1)
p1=plot(acc_MRHA1max,floor,'-*k');
hold on;
plot(acc_MRHA1min,floor,'-*k');
hold on;
p2=plot(acc_Mdlim1max,floor,'r');
hold on;
plot(acc_Mdlim1min,floor,'r');
hold on;
% Adding Marker on floor with accelerometers
plot(acc_Mdlim1max(1),8,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim1max(4),5,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim1max(7),2,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim1min(1),8,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim1min(4),5,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim1min(7),2,'ob','LineWidth',3);
hold on;
h=[p1;p2];
h1=legend(h,'MRHA','Orthogonal Filter');
title("Mode1","fontsize",18);
xlabel("Moment (N.m)","fontsize",16);
ylabel("Floor","fontsize",16);
h1.FontSize=16;
ax=gca;
ax.XAxisLocation='origin';
ax.YAxisLocation='origin';
ax.XAxis.FontSize=16;
ax.YAxis.FontSize=16;
ylim=[0 10];
axis tight;

%%
%Mode 2
subplot (2,2,2)
p1=plot(acc_MRHA2max,floor,'-*k');
hold on;
plot(acc_MRHA2min,floor,'-*k');
hold on;
p2=plot(acc_Mdlim2max,floor,'r');
hold on;
plot(acc_Mdlim2min,floor,'r');
hold on;
% Adding Marker on floor with accelerometers
plot(acc_Mdlim2max(1),8,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim2max(4),5,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim2max(7),2,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim2min(1),8,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim2min(4),5,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim2min(7),2,'ob','LineWidth',3);
hold on;
h=[p1;p2];
h1=legend(h,'MRHA','Orthogonal Filter');
title("Mode2","fontsize",18);
xlabel("Moment (N.m)","fontsize",16);
ylabel("Floor","fontsize",16);
h1.FontSize=16;
ax=gca;
ax.XAxisLocation='origin';
ax.YAxisLocation='origin';
ax.XAxis.FontSize=16;
ax.YAxis.FontSize=16;
ylim=[0 10];
axis tight;

%%
%Mode 3
subplot (2,2,3)
p1=plot(acc_MRHA3max,floor,'-*k');
hold on;
plot(acc_MRHA3min,floor,'-*k');
hold on;
p2=plot(acc_Mdlim3max,floor,'r');
hold on;
plot(acc_Mdlim3min,floor,'r');
hold on;
% Adding Marker on floor with accelerometers
plot(acc_Mdlim3max(1),8,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim3max(4),5,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim3max(7),2,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim3min(1),8,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim3min(4),5,'ob','LineWidth',3);
hold on;
plot(acc_Mdlim3min(7),2,'ob','LineWidth',3);
hold on;
h=[p1;p2];
h1=legend(h,'MRHA','Orthogonal Filter');
title("Mode3","fontsize",18);
xlabel("Moment (N.m)","fontsize",16);
ylabel("Floor","fontsize",16);
h1.FontSize=16;
ax=gca;
ax.XAxisLocation='origin';
ax.YAxisLocation='origin';
ax.XAxis.FontSize=16;
ax.YAxis.FontSize=16;
ylim=[0 10];
axis tight;

%%
%Total
subplot (2,2,4)
p1=plot(acc_MRHAmax,floor,'-*k');
hold on;
plot(acc_MRHAmin,floor,'-*k');
hold on;
p2=plot(acc_Mdlimmax,floor,'r');
hold on;
plot(acc_Mdlimmin,floor,'r');
hold on;
% Adding Marker on floor with accelerometers
plot(acc_Mdlimmax(1),8,'ob','LineWidth',3);
hold on;
plot(acc_Mdlimmax(4),5,'ob','LineWidth',3);
hold on;
plot(acc_Mdlimmax(7),2,'ob','LineWidth',3);
hold on;
plot(acc_Mdlimmin(1),8,'ob','LineWidth',3);
hold on;
plot(acc_Mdlimmin(4),5,'ob','LineWidth',3);
hold on;
plot(acc_Mdlimmin(7),2,'ob','LineWidth',3);
hold on;
h=[p1;p2];
h1=legend(h,'MRHA','Orthogonal Filter');
title("Total","fontsize",18);
xlabel("Moment (N.m)","fontsize",16);
ylabel("Floor","fontsize",16);
h1.FontSize=16;
ax=gca;
ax.XAxisLocation='origin';
ax.YAxisLocation='origin';
ax.XAxis.FontSize=16;
ax.YAxis.FontSize=16;
ylim=[0 10];
axis tight;