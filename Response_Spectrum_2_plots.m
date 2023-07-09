% To plot the Response Spectra of given Seismic Input
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
clear ; 
clc ;
%%
%%% Read the input ground acceleration file
% ugi=ground motion input
%ti= input time
fid=fopen('Friuli_0.3513g_40.67mm_accln.CSV');
c=textscan(fid,'%f %f  ','Delimiter',',','headerlines',1);
c=cell2mat(c);
t=c(:,1);
a=c(:,2)*1.8;

%%
%%% Read the input ground acceleration file
% ugi=ground motion input
%ti= input time
fid=fopen('Friuli_1.80000.CSV');
c=textscan(fid,'%f %f %f %f %f %f %f %f %f ','Delimiter',',','headerlines',14);
c=cell2mat(c);
t1=c(:,1);
a1=-9.81*c(:,2);

%%
% load EINS.dat ;  % load the Seismic data
% t = EINS(:,1) ;  % time intervel
% a = EINS(:,2) ;  % acceleration for respective time step
%--------------------------------------------------------------------------
% Plot the Accelerogram
%--------------------------------------------------------------------------
h = figure ;
set(h,'name','Accelerogram','numbertitle','off')
plot(t,a) ;
grid ;
title('EL centro Earthquake') ;
xlabel('time (Sec)') ;
ylabel('acceleration (g)') ;
a = a*9.81 ; % Changing Acceleration to m/s/s
%--------------------------------------------------------------------------
% Plot the Response Spectra of the given Seismic Input
%--------------------------------------------------------------------------
disp('Please wait, it will take time to plot the response spectra ')
TnInitial = 0.01 ;
TnFinal = 3 ;
stepTn = 0.005 ;
Tn = TnInitial:stepTn:TnFinal ; % Natural periods of SDOF oscillator's
xi = 0.25/100 ;
y0 = [0;0] ;
Ymax = zeros(1,length(Tn)) ;
Ymax1 = zeros(1,length(Tn)) ;
nsdof = 1 ;
for Tn = TnInitial:stepTn:TnFinal
    %Response of each SDOF system to the given Seismic Input
    [t,Y] = ode45(@odefun,t,y0,[],xi,Tn,t,a); 
    [t1,Y1] = ode45(@odefun1,t1,y0,[],xi,Tn,t1,a1); 
    ymax = max(abs(Y(:,1))); % max. displacement
     ymax1 = max(abs(Y1(:,1))); % max. displacement
    Ymax(nsdof) = ymax;
    Ymax1(nsdof) = ymax1;
    nsdof = nsdof+1 ;
end
Tn = TnInitial:stepTn:TnFinal ;
h = figure ;
set(h,'name','ResponseSpectrum','numbertitle','off')
plot(Tn,Ymax);
hold on;
plot(Tn,Ymax1);
grid;
title('Displacement Response Spectrum of EL Centro Earthquake',"fontsize",20)
ylabel('displacement (m)',"fontsize",20)
xlabel('T (s)',"fontsize",20)
axis tight ;
L=legend("Input Motion","Output Motion");
L1.FontSize=20;
ax=gca;
set(gca,'fontsize',20)
%
% Plot Response Spectrum on loglog scale
h = figure ;
set(h,'name','Log ResponseSpectrum','numbertitle','off')
loglog(Tn,Ymax,'r');
grid;
title('Displacement Response Spectrum of EL Centro Earthquake')
ylabel('displacement (m)')
xlabel('T (s)')
axis tight ;
%--------------------------------------------------------------------------   
% Pseudo-velocity response spectrum
h = figure ;
set(h,'name','PseudoVelocity','numbertitle','off')
V = (2*pi./Tn).*Ymax;
V1 = (2*pi./Tn).*Ymax1;
plot(Tn,V);
hold on;
plot(Tn,V1);
grid;
title('PseudoVelocity Response Spectrum EL Centro Earthquake')
ylabel('PseudoVelocity (m/s)')
xlabel('T (s)')
axis tight ;
L=legend("Input Motion","Output Motion");
L1.FontSize=14;
%
% Pseudo-velocity response spectrum on log scale
h = figure ;
set(h,'name','Log PseudoVelocity','numbertitle','off')
loglog(Tn,V,'r');
grid;
title('PseudoVelocity Response Spectrum of EL Centro Earthquake')
ylabel('PseudoVelocity (m/s)')
xlabel('T(s)')
axis tight ;
%--------------------------------------------------------------------------
% Pseudo-acceleration response spectrum
h = figure ;
set(h,'name','PseudoAcceleration','numbertitle','off')
A = (2*pi./Tn).*V;
A1 = (2*pi./Tn).*V1;
plot(Tn,A);
hold on;
plot(Tn,A1);
grid;
title('PseudoAcceleration Response Spectrum of EL Centro Earthquake',"fontsize",20)
ylabel('PseudoAcceleration (m/s/s)',"fontsize",20)
xlabel('T (s)',"fontsize",20)
axis tight ;
L=legend("Input Motion","Output Motion");
L1.FontSize=20;
ax=gca;
set(gca,'fontsize',20)

%
% Pseudo-acceleration response spectrum on log scale
h = figure ;
set(h,'name','Log PseudoAcceleration','numbertitle','off')
loglog(Tn,A,'r');
grid;
title('PseudoAcceleration Response Spectrum of EL Centro Earthquake')
ylabel('Pseudo Acceleration (m/s/s)')
xlabel('T (s)')
axis tight ;    
%--------------------------------------------------------------------------
    