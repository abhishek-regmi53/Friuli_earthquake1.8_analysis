%%pROGRAM FOR ANIMATING THE EARTHQUAKE SIGNAL
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
ugo=-c(:,2);
to=c(:,1);
to1=to(4519:7119);  %4519
ugo1=ugo(4519:7119);
[val idx]=max(abs(ugo));

%%
curve=animatedline;
set(gca, 'XLim',[0 26],'YLim',[-0.6 0.6]);
obj = VideoWriter('animation.avi');
obj.Quality=100;
obj.FrameRate=100;
open(obj);
xlabel('Time(sec)','FontSize', 16);
ylabel('Acceleration (g)','FontSize', 16);
title('Friuli Ground Motion X 1.8','FontSize',20);
for i = 1:length(to1)
    addpoints(curve,to(i),ugo1(i));
    drawnow; 
    f= getframe(gcf);
    writeVideo(obj,f);
    
end
obj.close();

