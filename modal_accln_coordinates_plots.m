%Modal Acceleration Plots
%%
%Modal Acceleration from MRHA
% fid=fopen('20210619_modal_accln_MRHA_3modes.CSV');
% c=textscan(fid,'%f %f %f ','Delimiter',',','headerlines',0);
% c=cell2mat(c);
% qaMRHA=c;                                                                                                             
% to=linspace(0,length(c)*0.001,length(c));
% %%
% %Modal Acceleration from Orthogonal Filter_MDlim
% fid=fopen('20210614_modalaccln_filtered_orthogonal_filters.CSV');
% c=textscan(fid,'%f %f %f','Delimiter',',','headerlines',0);
% c=cell2mat(c);
% qaMdlim=c;                                                                                                             
% t1=linspace(0,length(c)*0.01,length(c));
% 
% %%
% % Plotting and Comparison
% 
% for m=1:3
% figure(m)
% plot(t1',qaMdlim(:,m),'r');
% hold on;
% plot(to',qaMRHA(:,m),'k');
% s1=strcat("Comparison of Modal Acceleration(qa)"," ","(Mode",num2str(m),")");
% title(s1,"fontsize",18);
% xlabel("Time(sec)","fontsize",18);
% ylabel("Modal Acceleration","fontsize",18);
% ax=gca;
% set(gca,'fontsize',18)
% h1=legend("Orthogonal Filter", "MRHA");
% h1.FontSize=18;
% end
% 
% %%
% %Modal Coordinates from MRHA
% fid=fopen('20210619_modal_coordinate_MRHA_3modes.CSV');
% c=textscan(fid,'%f %f %f','Delimiter',',','headerlines',0);
% c=cell2mat(c);
% qaMRHA=c;                                                                                                             
% to=linspace(0,length(c)*0.001,length(c));
% %%
% %Modal Coordinates from Orthogonal Filter_MDlim
% fid=fopen('20210614_modalcoordinates_orthogonal_filters.CSV');
% c=textscan(fid,'%f %f %f','Delimiter',',','headerlines',0);
% c=cell2mat(c);
% qaMdlim=c;                                                                                                             
% t1=linspace(0,length(c)*0.01,length(c));
% 
% %%
% % Plotting and Comparison
% 
% for m=1:3
%     figure(m+3)
%     plot(t1',qaMdlim(:,m),'r');
%     hold on;
%     plot(to',qaMRHA(:,m),'k');
%     s1=strcat("Comparison of Modal Coordinates(q)"," ","(Mode",num2str(m),")");
%     title(s1,"fontsize",18);
%     xlabel("Time(sec)","fontsize",18);
%     ylabel("Modal Coordinates","fontsize",18);
%     ax=gca;
%     set(gca,'fontsize',18)
%     h1=legend("Orthogonal Filter", "MRHA");
%     h1.FontSize=18;
% end
clear all;
close all;
%Modal Acceleration from MRHA
fid=fopen('20210619_modal_accln_MRHA_3modes_updated.CSV');
c=textscan(fid,'%f %f %f ','Delimiter',',','headerlines',0);
c=cell2mat(c);
qaMRHA=c;                                                                                                             
to=linspace(0,length(c)*0.001,length(c));
%%
%Modal Acceleration from Orthogonal Filter_MDlim
fid=fopen('20210614_modalaccln_filtered_orthogonal_filters.CSV');
c=textscan(fid,'%f %f %f','Delimiter',',','headerlines',0);
c=cell2mat(c);
qaMdlim=c;                                                                                                             
t1=linspace(0,length(c)*0.01,length(c));

%%
% Plotting and Comparison
figure(1)
a=figure;
a.Color='white';
for m=1:3
 subplot(3,1,m)
plot(t1',qaMdlim(:,m),'r');
hold on;
plot(to',qaMRHA(:,m),'k');
s1=strcat("Comparison of Modal Acceleration"," ","(Mode",num2str(m),")");
title(s1,"fontsize",20,'FontWeight','bold');
% xlabel("Time(sec)","fontsize",20,'FontWeight','bold');
% ylabel("Modal Acceleration (m/s/s)","fontsize",20,'FontWeight','bold');
h1=legend("Orthogonal Filter", "MRHA");
h1.FontSize=20;
h1.FontWeight='bold';
ax=gca;
ax.FontWeight='bold';
ax.FontSize=18;
end
xlabel("Time(sec)",'FontWeight','bold',"fontsize",18);
ylabel("Modal Acceleration (m/s/s)",'FontWeight','bold',"fontsize",18);

%%
%Modal Coordinates from MRHA
fid=fopen('20210619_modal_coordinate_MRHA_3modes_updated.CSV');
c=textscan(fid,'%f %f %f','Delimiter',',','headerlines',0);
c=cell2mat(c);
qaMRHA=c;                                                                                                             
to=linspace(0,length(c)*0.001,length(c));
%%
%Modal Coordinates from Orthogonal Filter_MDlim
fid=fopen('20210614_modalcoordinates_orthogonal_filters.CSV');
c=textscan(fid,'%f %f %f','Delimiter',',','headerlines',0);
c=cell2mat(c);
qaMdlim=c;                                                                                                             
t1=linspace(0,length(c)*0.01,length(c));

%%
% Plotting and Comparison
figure (2)
a=figure;
a.Color='white';
for m=1:3
%     figure(m+3)
%     plot(t1',qaMdlim(:,m),'r');
%     hold on;
%     plot(to',qaMRHA(:,m),'k');
%     s1=strcat("Comparison of Modal Coordinates(q)"," ","(Mode",num2str(m),")");
%     title(s1,"fontsize",18);
%     xlabel("Time(sec)","fontsize",16);
%     ylabel("Modal Coordinates","fontsize",16);
%     h1=legend("Orthogonal Filter", "MRHA");
%     h1.FontSize=16;
 subplot(3,1,m)
plot(t1',qaMdlim(:,m),'r');
hold on;
plot(to',qaMRHA(:,m),'k');
s1=strcat("Comparison of Modal Coordinates "," ","(Mode",num2str(m),")");
title(s1,"fontsize",20,'FontWeight','bold');
% xlabel("Time(sec)","fontsize",20,'FontWeight','bold');
% ylabel("Modal Coordinate (m)","fontsize",20,'FontWeight','bold');
h1=legend("Orthogonal Filter", "MRHA");
h1.FontSize=20;
h1.FontWeight='bold';
ax=gca;
ax.FontWeight='bold';
ax.FontSize=18;
end
xlabel("Time(sec)",'FontWeight','bold',"fontsize",18);
ylabel("Modal Coordinate (m)",'FontWeight','bold',"fontsize",18);

