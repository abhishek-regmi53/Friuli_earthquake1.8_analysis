clear all
close all
%%% Read the input ground acceleration file
% ugi=ground motion input
%ti= input time
fid=fopen('Friuli_0.3513g_40.67mm_accln.CSV');
c=textscan(fid,'%f %f  ','Delimiter',',','headerlines',1);
c=cell2mat(c);
ti=c(:,1);
ugi=c(:,2)*1.8;
srate=100; %100 Hz sampling frequency

%%
%%% Reading the output file from experiment
%  ugo=output ground motion
%to= output time
fid=fopen('Friuli_1.80000.CSV');
c=textscan(fid,'%f %f %f %f %f %f %f %f %f','Delimiter',',','headerlines',14);
c=cell2mat(c);
srate=100; %100 Hz sampling frequency
ugo=-c(:,2);
to=c(:,1);
npnts=length(ugo);
ugo1=ugo;
%%
%%%FFT of Signal%%%
fftugo=fft(ugo);
fftugoamp=2*abs(fftugo)/npnts;
hz=linspace(0,srate/2,floor(npnts/2)+1);

figure(4)
plot(hz,fftugoamp(1:length(hz),1));

fftugi=fft(ugi);
fftugiamp=2*abs(fftugi)/length(ugi);
hz=linspace(0,srate/2,floor((length(ugi))/2)+1);

figure(5)
plot(hz,fftugiamp(1:length(hz),1));

%%
%%%Filtering the obtained signal %%%
fcutoff=15; %cuttoff frequency
transw=0.2;
shape=[1 1 0 0];
order=round(50*srate/fcutoff);
frex=[0 fcutoff fcutoff+fcutoff*transw srate/2]/(srate/2);
    % filter kernel %
filtkern=firls(order,frex,shape);
   % Power Spectrum %
filtkernX=abs(fft(filtkern,npnts)).^2;
 hz=linspace(0, srate,npnts);
figure(1)
plot(hz,filtkernX);
reflectsig=[ugo(order:-1:1);ugo;ugo(end:-1:end-order+1)];
reflectsig=filter(filtkern,1,reflectsig);
reflectsig=filter(filtkern,1,reflectsig(end:-1:1));
reflectsig=reflectsig(end:-1:1);
fsignal=reflectsig(order+1:end-order);
figure(2)
plot(to,ugo);
hold on;
plot(to,fsignal);
hold on;
plot(ti,ugi);

%%
%%%Matching time step
ugo=fsignal;
[valugi idxugi]=max((ugi));
maxugi=ugi(idxugi,1);

[valugo idxugo]=max((ugo));
maxugo=ugo(idxugo,1);


ugom=ugo(idxugo-idxugi+1:end,1);
tm=linspace(0,length(ugom)/100,length(ugom));

ugo1=ugo1(idxugo-idxugi+1:end,1);
tm=linspace(0,length(ugom)/100,length(ugom));

figure(3)
plot(tm,ugo1-mean(ugo1),'r');
hold on;
plot(tm,ugom,'b');
hold on;
plot(ti,ugi,'k');
legend('unfiltered','filtered','input');

[val idx]=max(abs(ugom));
maxugom=ugom(idx,1);


fftugom=fft(ugom-mean(ugom));
fftugomamp=2*abs(fftugom)/length(ugom);
hz=linspace(0,srate/2,floor((length(ugom))/2)+1);

figure(6)
plot(hz,fftugomamp(1:length(hz),1));

% %%%Butterworth Filter
% [fkernB, fkernA]=butter(4,fcutoff/srate/2,'low');
% 
% filtpow=abs(fft(fkernB)).^2;
% 
% butsig=filtfilt(fkernB,fkernA,ugo1);
% figure(8)
% freqz(fkernB,fkernA);
% 
% %%
% %%%Matching time step
% ugo=fsignal;
% [valugi idxugi]=max(abs(ugi));
% maxugi=ugi(idxugi,1);
% 
% [valugo idxugo]=max(abs(butsig));
% maxugo=butsig(idxugo,1);
% 
% 
% butsig=butsig(idxugo-idxugi+1:end,1);
% tm=linspace(0,length(butsig)/100,length(butsig));
% 
% figure(7)
% plot(tm,butsig);
% hold on;
% plot(ti,ugi);
plot(ti,ugi);
hold on;
plot(tm,ugo1);
L1=legend('input motion','ouput motion');
L1.FontSize=14;
ax=gca;
set(gca,'fontsize',18)
title("Comparison of Input and Output Ground motion","FontSize",18);
xlabel("Time(sec)","FontSize",18,"FontWeight",'bold');
ylabel("Acceleration(g)","FontSize",18,"FontWeight",'bold');
