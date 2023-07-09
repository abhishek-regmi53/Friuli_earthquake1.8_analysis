%%
clear all;
close all;
%Displacement from Orthogonal Filter
dis_Mdlim1=xlsread("20210617_disp_orthogonal_filter.xlsx","mode1");
dis_Mdlim1(:,9)=zeros(length(dis_Mdlim1),1);
dis_Mdlim2=xlsread("20210617_disp_orthogonal_filter.xlsx","mode2");
dis_Mdlim2(:,9)=zeros(length(dis_Mdlim2),1);
dis_Mdlim3=xlsread("20210617_disp_orthogonal_filter.xlsx","mode3");
dis_Mdlim3(:,9)=zeros(length(dis_Mdlim3),1);
dis_Mdlim=xlsread("20210617_disp_orthogonal_filter.xlsx","total");
dis_Mdlim(:,9)=zeros(length(dis_Mdlim),1);
t1=linspace(0,length(dis_Mdlim)*0.01,length(dis_Mdlim));

%%
%Computing inter-story drift from Orthogonal filter
for f=1:8
    acc_Mdlim1(:,f)=((dis_Mdlim1(:,f)-dis_Mdlim1(:,f+1))/0.25)*100;
    acc_Mdlim2(:,f)=((dis_Mdlim2(:,f)-dis_Mdlim2(:,f+1))/0.25)*100;
    acc_Mdlim3(:,f)=((dis_Mdlim3(:,f)-dis_Mdlim3(:,f+1))/0.25)*100;
    acc_Mdlim(:,f)=((dis_Mdlim(:,f)-dis_Mdlim(:,f+1))/0.25)*100;
end

%%
%Displacement from MRHA
dis_MRHA1=xlsread("20210623_disp_MRHA_3modes.xlsx","mode1");
dis_MRHA1(:,9)=zeros(length(dis_MRHA1),1);
dis_MRHA2=xlsread("20210623_disp_MRHA_3modes.xlsx","mode2");
dis_MRHA2(:,9)=zeros(length(dis_MRHA2),1);
dis_MRHA3=xlsread("20210623_disp_MRHA_3modes.xlsx","mode3");
dis_MRHA3(:,9)=zeros(length(dis_MRHA3),1);
dis_MRHA=xlsread("20210623_disp_MRHA_3modes.xlsx","total");
dis_MRHA(:,9)=zeros(length(dis_MRHA),1);
to=linspace(0,length(dis_MRHA)*0.001,length(dis_MRHA));

%%
%Computing inter-story drift from MRHA
for f=1:8
    acc_MRHA1(:,f)=((dis_MRHA1(:,f)-dis_MRHA1(:,f+1))/0.25)*100;
    acc_MRHA2(:,f)=((dis_MRHA2(:,f)-dis_MRHA2(:,f+1))/0.25)*100;
    acc_MRHA3(:,f)=((dis_MRHA3(:,f)-dis_MRHA3(:,f+1))/0.25)*100;
    acc_MRHA(:,f)=((dis_MRHA(:,f)-dis_MRHA(:,f+1))/0.25)*100;
end

%%
floor=8:-1:0;
%%
% MRHA
for f=1:8
    acc_MRHA1max(f)=max(acc_MRHA1(:,f));
    acc_MRHA1max(9)=0;
    acc_MRHA2max(f)=max(acc_MRHA2(:,f));
    acc_MRHA2max(9)=0;
    acc_MRHA3max(f)=max(acc_MRHA3(:,f));
    acc_MRHA3max(9)=0;
    acc_MRHAmax(f)=max(acc_MRHA(:,f));
    acc_MRHAmax(9)=0;
    
    
    acc_MRHA1min(f)=min(acc_MRHA1(:,f));
    acc_MRHA1min(9)=0;
    acc_MRHA2min(f)=min(acc_MRHA2(:,f));
    acc_MRHA2min(9)=0;
    acc_MRHA3min(f)=min(acc_MRHA3(:,f));
    acc_MRHA3min(9)=0;
    acc_MRHAmin(f)=min(acc_MRHA(:,f));
    acc_MRHAmin(9)=0;
end
%%
%MDlim
for f=1:8
    acc_Mdlim1max(f)=max(acc_Mdlim1(:,f));
    acc_Mdlim1max(9)=0;
    acc_Mdlim2max(f)=max(acc_Mdlim2(:,f));
    acc_Mdlim2max(9)=0;
    acc_Mdlim3max(f)=max(acc_Mdlim3(:,f));
    acc_Mdlim3max(9)=0;
    acc_Mdlimmax(f)=max(acc_Mdlim(:,f));
    acc_Mdlimmax(9)=0;
    
    
    acc_Mdlim1min(f)=min(acc_Mdlim1(:,f));
    acc_Mdlim1min(9)=0;
    acc_Mdlim2min(f)=min(acc_Mdlim2(:,f));
    acc_Mdlim2min(9)=0;
    acc_Mdlim3min(f)=min(acc_Mdlim3(:,f));
    acc_Mdlim3min(9)=0;
    acc_Mdlimmin(f)=min(acc_Mdlim(:,f));
    acc_Mdlimmin(9)=0;
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
xlabel("Inter-Story Drift(%)","fontsize",16);
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
xlabel("Inter-Story Drift(%)","fontsize",16);
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
xlabel("Inter-Story Drift(%)","fontsize",16);
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
xlabel("Inter-Story Drift(%)","fontsize",16);
ylabel("Floor","fontsize",16);
h1.FontSize=16;
ax=gca;
ax.XAxisLocation='origin';
ax.YAxisLocation='origin';
ax.XAxis.FontSize=16;
ax.YAxis.FontSize=16;
ylim=[0 10];
axis tight;
