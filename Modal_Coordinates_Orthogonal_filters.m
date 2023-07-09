%Computation of Modal Coordinates%
%%
%Reading Modal Acceleration
fid=fopen('20210616modalaccln_orthogonal_filter.CSV');
c=textscan(fid,'%f %f %f ','Delimiter',',','headerlines',0);
c=cell2mat(c);
qa=c;
qa1=c;
t=linspace(0,length(qa)*0.01,length(qa));
% t1=0:0.001:(length(qa)-0.01)*0.01;
% qa1=interp1(t,qa,t1);  
%%
%Applying filter just for acceleration 
%Filtering modal accln 1
srate=100;
frange=[0.1 30];
transw=0.001;

order=round(1500);
shape=[0 0 1 1 0 0];
frex=[0 frange(1)-frange(1)*transw frange(1) frange(2) frange(2)+frange(2)*transw srate/2]/(srate/2);
npnts=(length(qa));
% filter kernel %
filtkern=firls(order,frex,shape);
   % Power Spectrum %
filtkernX=abs(fft(filtkern)).^2;
hz=linspace(0, srate/2,floor(length(filtkern)/2)+1);
figure(10)
plot(hz,filtkernX(1:length(hz)),"LineWidth",3);
title("FIR Filter","fontsize",16);
xlabel("Frequency (Hz)","fontsize",16);
ylabel("abs(fft(filtkern)).^2","fontsize",16);

%%
%Filtering the acceleration
reflectsig=[qa(order:-1:1,1);qa(:,1);qa(end:-1:end-order+1,1)];
reflectsig=filter(filtkern,1,reflectsig);
reflectsig=filter(filtkern,1,reflectsig(end:-1:1));
reflectsig=reflectsig(end:-1:1);
fsignal=reflectsig(order+1:end-order);
qa(:,1)=fsignal;
%%
%Applying filter just for acceleration 
%Filtering modal accln 2
srate=100;
frange=[1.5 30];
transw=0.01;
order=round(1500);
shape=[0 0 1 1 0 0];
frex=[0 frange(1)-frange(1)*transw frange(1) frange(2) frange(2)+frange(2)*transw srate/2]/(srate/2);
npnts=(length(qa));
% filter kernel %
filtkern=firls(order,frex,shape);
   % Power Spectrum %
filtkernX=abs(fft(filtkern)).^2;
hz=linspace(0, srate/2,floor(length(filtkern)/2)+1);
figure(11)
plot(hz,filtkernX(1:length(hz)),"LineWidth",3);
title("FIR Filter","fontsize",16);
xlabel("Frequency (Hz)","fontsize",16);
ylabel("abs(fft(filtkern)).^2","fontsize",16);
%%
%Filtering the acceleration
reflectsig=[qa(order:-1:1,2);qa(:,2);qa(end:-1:end-order+1,2)];
reflectsig=filter(filtkern,1,reflectsig);
reflectsig=filter(filtkern,1,reflectsig(end:-1:1));
reflectsig=reflectsig(end:-1:1);
fsignal=reflectsig(order+1:end-order);
qa(:,2)=fsignal;


%%
%Applying filter just for acceleration 
%Filtering modal accln 3
srate=100;
frange=[5 30];
transw=0.01;
order=round(1500);
shape=[0 0 1 1 0 0];
frex=[0 frange(1)-frange(1)*transw frange(1) frange(2) frange(2)+frange(2)*transw srate/2]/(srate/2);
npnts=(length(qa));
% filter kernel %
filtkern=firls(order,frex,shape);
   % Power Spectrum %
filtkernX=abs(fft(filtkern)).^2;
hz=linspace(0, srate/2,floor(length(filtkern)/2)+1);
figure(12)
plot(hz,filtkernX(1:length(hz)),"LineWidth",3);
title("FIR Filter","fontsize",16);
xlabel("Frequency (Hz)","fontsize",16);
ylabel("abs(fft(filtkern)).^2","fontsize",16);
%%
%Filtering the acceleration
reflectsig=[qa(order:-1:1,3);qa(:,3);qa(end:-1:end-order+1,3)];
reflectsig=filter(filtkern,1,reflectsig);
reflectsig=filter(filtkern,1,reflectsig(end:-1:1));
reflectsig=reflectsig(end:-1:1);
fsignal=reflectsig(order+1:end-order);
qa(:,3)=fsignal;



%%
for m=1:1:3
    qv(:,m)=cumtrapz(t,qa(:,m));  %%%qv is the modal coordinate velocity
%     qv1(:,m)=cumtrapz(t1,qa1(:,m));
end
%%
%detrending the data
for m=1:3
%polynomial fit (returns coefficient)
p=polyfit(t',qv(:,m),100);
% p1=polyfit(t1',qv1(:,m),100);
%predicted data is evaluation of polynomial
yhat(:,m)= polyval(p,t);
% yhat1(:,m)= polyval(p1,t1);

%compute residual (the cleaned signal)
residual(:,m)=qv(:,m)-yhat(:,m);
% residual1(:,m)=qv1(:,m)-yhat1(:,m);
%plotting
figure(m)
% plot(t, yhat(:,m),'r','linew',4);
% hold on;
 plot(t, residual(:,m),'k');
% hold on;
% plot(t, qv(:,m),'k','linew',2);

end

qv=residual;
% qv1=residual1;

%%
for m=1:1:3
    q(:,m)=cumtrapz(t,qv(:,m));   %%%q is the modal coordinate
%     q1(:,m)=cumtrapz(t1,qv1(:,m));
end

%%
%detrending the data
for m=1:3
%polynomial fit (returns coefficient)
p=polyfit(t',q(:,m),100);
% p1=polyfit(t1',q1(:,m),100);

%predicted data is evaluation of polynomial
yhat(:,m)= polyval(p,t);
% yhat1(:,m)= polyval(p1,t1);

%compute residual (the cleaned signal)
residual(:,m)=q(:,m)-yhat(:,m);
% residual1(:,m)=q1(:,m)-yhat1(:,m);
%plotting
figure(m+3)
% plot(t, yhat(:,m),'r','linew',4);
% hold on;
 plot(t, residual(:,m),'k');
% hold on;
% plot(t, q(:,m),'k','linew',2);

end

q=residual;

 csvwrite('20210614_modalcoordinates_orthogonal_filters.csv',q);

%%
%%%FFT of Signal%%%
npnts=length(q);
srate=100;
for m=1:3
fftq(:,m)=fft(q(:,m));
fftqamp(:,m)=2*abs(fftq(:,m))/npnts;
hz=linspace(0,srate/2,floor(npnts/2)+1);

figure(m+6)
plot(hz,fftqamp(1:length(hz),m));
end
 csvwrite('20210614_modalaccln_filtered_orthogonal_filters.csv',qa);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%
% %Filtering the baseline corrected data
% srate=100;
% frange=[0.10 30];
% transw=0.001;
% 
% order=round(2500);
% shape=[0 0 1 1 0 0];
% frex=[0 frange(1)-frange(1)*transw frange(1) frange(2) frange(2)+frange(2)*transw srate/2]/(srate/2);
% npnts=(length(qa));
% % filter kernel %
% filtkern=firls(order,frex,shape);
%    % Power Spectrum %
% filtkernX=abs(fft(filtkern)).^2;
% hz=linspace(0, srate/2,floor(length(filtkern)/2)+1);
% figure(10)
% plot(hz,filtkernX(1:length(hz)));
% 
% %%
% %Filtering the acceleration
% reflectsig=[qa(order:-1:1,:);qa;qa(end:-1:end-order+1,:)];
% reflectsig=filter(filtkern,1,reflectsig);
% reflectsig=filter(filtkern,1,reflectsig(end:-1:1,:));
% reflectsig=reflectsig(end:-1:1,:);
% fsignal=reflectsig(order+1:end-order,:);









