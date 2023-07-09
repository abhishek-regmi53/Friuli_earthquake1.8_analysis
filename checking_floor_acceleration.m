%%
clear all;
close all;
%%% Reading the output file from experiment
%  ugo=output ground motion
%to= output time
fid=fopen('Friuli_1.80000.CSV');
c=textscan(fid,'%f %f %f %f %f %f %f %f %f','Delimiter',',','headerlines',14);
c=cell2mat(c);
srate=100; %100 Hz sampling frequency
ugo=-c(:,3);
to = linspace(0,length(c)*0.01,length(c));
npnts=length(ugo);
ugo1=ugo;

%%
%Reading acceleration from total response obtained from orthogonal filter
acc=xlsread('20210619_accln_MRHA_3modes_updated.xlsx','total');
t1=linspace(0,length(acc)*0.001,length(acc));

figure(1)
a=figure;
a.Color='white';
subplot(3,1,1)
plot(to,c(:,3)*9.81);
hold on;
plot(t1,-acc(:,1));
title("Comparison of Floor Acceleration (Floor 8)","fontsize",20,'FontWeight','bold');
h1=legend("Accelerometer", "Orthogonal Filter");
h1.FontSize=20;
h1.FontWeight='bold';
ax=gca;
ax.FontWeight='bold';
ax.FontSize=18;
xlabel("Time(sec)",'FontWeight','bold',"fontsize",18);
ylabel("Acceleration (m/s/s)",'FontWeight','bold',"fontsize",18);

subplot(3,1,2)
plot(to,c(:,4)*9.81);
hold on;
plot(t1,-acc(:,4));
title("Comparison of Floor Acceleration (Floor 5)","fontsize",20,'FontWeight','bold');
h1=legend("Accelerometer", "Orthogonal Filter");
h1.FontSize=20;
h1.FontWeight='bold';
ax=gca;
ax.FontWeight='bold';
ax.FontSize=18;
xlabel("Time(sec)",'FontWeight','bold',"fontsize",18);
ylabel("Acceleration (m/s/s)",'FontWeight','bold',"fontsize",18);

subplot(3,1,3)
plot(to,c(:,5)*9.81);
hold on;
plot(t1,-acc(:,7));
title("Comparison of Floor Acceleration (Floor 2)","fontsize",20,'FontWeight','bold');
h1=legend("Accelerometer", "Orthogonal Filter");
h1.FontSize=20;
h1.FontWeight='bold';
ax=gca;
ax.FontWeight='bold';
ax.FontSize=18;
xlabel("Time(sec)",'FontWeight','bold',"fontsize",18);
ylabel("Acceleration (m/s/s)",'FontWeight','bold',"fontsize",18);




