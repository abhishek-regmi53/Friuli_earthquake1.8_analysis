%Comparing strain from MDLim and strain gauge%
%This Program also contains the 
%%
%Extracting Strain Data%
%%% Reading the output file from experiment
clear all;
close all;
fid=fopen('Friuli_1.80000.CSV');
c=textscan(fid,'%f %f %f %f %f %f %f %f %f','Delimiter',',','headerlines',14);
c=cell2mat(c);
vg1=0.7304*c(:,6)/2;
rg1=c(:,7)/4;
vg2=0.6031*c(:,8)/2;
rg2=c(:,9)/4;
t=linspace(0,length(c)*0.01,length(c));
%%
%Reading strain results from orthogonal filter approach
mstr=(xlsread("20210619_bending_strain_from_disp_mdlim.xlsx","total"));
sstr=(xlsread("20210619_shear_strain_from_disp_mdlim.xlsx","total"));

%%
%Plotting
figure(1)
plot(t,vg1,'r');
hold on;
plot(t,mstr(:,9),'k');
title("Comparison of Bending Strain at base",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);
h1=legend('Strain Gage (VG1)','Orthogonal Filter');
h1.FontSize=16;

figure(2)
plot(t,rg1,'r');
hold on;
plot(t,sstr(:,8),'k');
title("Comparison of Shear Strain at base",'fontsize',20);
xlabel("Time(sec)",'fontsize',20);
ylabel("Micro-Strain",'fontsize',20);
h1=legend('Strain Gage (RG1)','Orthogonal Filter');
h1.FontSize=20;
ax=gca;
set(gca,'fontsize',20)

figure(3)
plot(t,vg2,'r');
hold on;
plot(t,mstr(:,5),'k');
title("Comparison of bending Strain at mid",'fontsize',20);
xlabel("Time(sec)",'fontsize',20);
ylabel("Micro-Strain",'fontsize',20);
h1=legend('Strain Gage (VG2)','Orthogonal Filter');
h1.FontSize=20;
ax=gca;
set(gca,'fontsize',20)

figure(4)
plot(t,rg2,'r');
hold on;
plot(t,sstr(:,5),'k');
title("Comparison of Shear Strain at mid",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);
h1=legend('Strain Gage (RG2)','Orthogonal Filter');
h1.FontSize=16;
%%
%Frequency Spectrum of Strain signals from strain gauge
%%%FFT of Signal%%%
npnts=length(vg1);
srate=100;
for m=1:4
fftq(:,m)=fft(c(:,m+5));
fftqamp(:,m)=2*abs(fftq(:,m))/npnts;
hz=linspace(0,srate/2,floor(npnts/2)+1);

figure(m+4)
plot(hz,fftqamp(1:length(hz),m));
title("Frequency Spectrum of Strain Signals from strain gauge","fontsize",16);
xlabel("Frequency (Hz)","fontsize",16);
ylabel("abs(fft(filtkern)).^2","fontsize",16);

end

%%
%Filtering the strain signals obtained from strain gage using high pass
%filter
srate=100;
frange=[0.1];
transw=0.001;

order=round(1500);
shape=[0 0 1 1];
frex=[0 frange(1)-frange(1)*transw frange(1) srate/2]/(srate/2);
npnts=(length(c));
% filter kernel %
filtkern=firls(order,frex,shape);
   % Power Spectrum %
filtkernX=abs(fft(filtkern)).^2;
hz=linspace(0, srate/2,floor(length(filtkern)/2)+1);
figure(9)
plot(hz,filtkernX(1:length(hz)),"LineWidth",3);
title("FIR Filter","fontsize",16);
xlabel("Frequency (Hz)","fontsize",16);
ylabel("abs(fft(filtkern)).^2","fontsize",16);

%%
%Filtering the strain signals

for m=1:4
reflectsig=[c(order:-1:1,m+5);c(:,m+5);c(end:-1:end-order+1,m+5)];
reflectsig=filter(filtkern,1,reflectsig);
reflectsig=filter(filtkern,1,reflectsig(end:-1:1));
reflectsig=reflectsig(end:-1:1);
fsignal=reflectsig(order+1:end-order);
cor(:,m)=fsignal;
end

%%
%Plotting and Comparison of filtered and unfiltered strain signals
for m=1:4
figure(9+m)
plot(t,c(:,5+m),'r');
hold on;
plot(t,cor(:,m),'k');
title("Comparison of Shear Strain before and after filtering",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);
h1=legend('Unfiltered','Filtered');
h1.FontSize=16;
end

%%
%Plotting
% figure(14)
% plot(t,0.5*cor(:,1),'r');  %0.3652 changed to 0.4
% hold on;
% plot(t,-mstr(:,9),'k');
% title("Comparison of Bending Strain at base",'fontsize',20);
% xlabel("Time(sec)",'fontsize',20);
% ylabel("Micro-Strain",'fontsize',20);
% h1=legend('Strain Gage (VG1)','Orthogonal Filter');
% h1.FontSize=20;
% ax=gca;
% set(gca,'fontsize',20)
% 
% figure(15)
% plot(t,0.25*cor(:,2),'r');   
% hold on;
% plot(t,sstr(:,8),'k');
% title("Comparison of Shear Strain at base",'fontsize',20);
% xlabel("Time(sec)",'fontsize',20);
% ylabel("Micro-Strain",'fontsize',20);
% h1=legend('Strain Gage (RG1)','Orthogonal Filter');
% h1.FontSize=20;
% ax=gca;
% set(gca,'fontsize',20)
% 
% figure(16)
% plot(t,0.5*cor(:,3),'r'); %0.30155 changed to 0.31
% hold on;
% plot(t,-mstr(:,5),'k');
% title("Comparison of bending Strain at mid",'fontsize',20);
% xlabel("Time(sec)",'fontsize',20);
% ylabel("Micro-Strain",'fontsize',20);
% h1=legend('Strain Gage (VG2)','Orthogonal Filter');
% h1.FontSize=20;
% ax=gca;
% set(gca,'fontsize',20)
% 
% figure(17)
% plot(t,0.25*cor(:,4),'r');
% hold on;
% plot(t,sstr(:,5),'k');
% title("Comparison of Shear Strain at mid",'fontsize',20);
% xlabel("Time(sec)",'fontsize',20);
% ylabel("Micro-Strain",'fontsize',20);
% h1=legend('Strain Gage (RG2)','Orthogonal Filter');
% h1.FontSize=20;
% ax=gca;
% set(gca,'fontsize',20)

figure(14)
a=figure;
a.Color='white';
subplot(4,1,1)
plot(t,0.3652*cor(:,1),'r');
hold on;
plot(t,-mstr(:,9),'k');
title("Comparison of Bending Strain at base",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);
h1=legend('Strain Gage (VG1)','Orthogonal Filter');
h1.FontSize=16;

subplot(4,1,2)
plot(t,0.25*cor(:,2),'r');
hold on;
plot(t,sstr(:,8),'k');
title("Comparison of Shear Strain at base",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);
h1=legend('Strain Gage (RG1)','Orthogonal Filter');
h1.FontSize=16;

subplot(4,1,3)
plot(t,0.30155*cor(:,3),'r');
hold on;
plot(t,-mstr(:,5),'k');
title("Comparison of Bending Strain at mid",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);
h1=legend('Strain Gage (VG2)','Orthogonal Filter');
h1.FontSize=16;

subplot(4,1,4)
plot(t,0.25*cor(:,4),'r');
hold on;
plot(t,sstr(:,5),'k');
title("Comparison of Shear Strain at mid",'fontsize',18);
xlabel("Time(sec)",'fontsize',14);
ylabel("Micro-Strain",'fontsize',14);
h1=legend('Strain Gage (RG2)','Orthogonal Filter');
h1.FontSize=16;
