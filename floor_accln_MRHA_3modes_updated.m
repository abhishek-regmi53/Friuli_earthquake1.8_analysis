%Computing Floor Acceleration
%%
%Modal Coordinates
fid=fopen('20210619_modal_accln_MRHA_3modes_updated.CSV');
c=textscan(fid,'%f %f %f','Delimiter',',','headerlines',0);
c=cell2mat(c);
qa=c;                                                                                                             %q=modal coordinates
to=linspace(0,length(c)*0.001,length(c));

%%
%Modal Properties
PHI=xlsread('20210702_modal_properties_lab_with_updated_model.xlsx','B2:D9');
phi(1,:)=PHI(1,:);
phi(2,:)=PHI(4,:);
phi(3,:)=PHI(7,:);
% %Modal Mass
% %Angular Frequency
% w=xlsread('20210616_modal_properties_lab.xlsx','J1:J3');
% %Joint Mass 
% m=xlsread('20210616_modal_properties_lab.xlsx','K17:K24');
% mn=xlsread('20210616_modal_properties_lab.xlsx','F28:F30');

m=xlsread('20210702_modal_properties_lab_with_updated_model.xlsx','K17:K24');
w=xlsread('20210702_modal_properties_lab_with_updated_model.xlsx','J1:J3');
mn=xlsread('20210702_modal_properties_lab_with_updated_model.xlsx','F28:F30');
%%
%Acceleration Computaion

%First Mode%
    i=0;
for t=0:0.001:(length(to)-1)*0.001
    i=i+1;
    for f=1:1:8
        a1(i,f)=qa(i,1)*PHI(f,1);
    end
end
xlswrite('20210619_accln_MRHA_3modes_updated.xlsx',a1,'mode1');

%Second Mode%
    i=0;
for t=0:0.001:(length(to)-1)*0.001
    i=i+1;
    for f=1:1:8
        a2(i,f)=qa(i,2)*PHI(f,2);
    end
end
xlswrite('20210619_accln_MRHA_3modes_updated.xlsx',a2,'mode2');


%Third Mode%
    i=0;
for t=0:0.001:(length(to)-1)*0.001
    i=i+1;
    for f=1:1:8
        a3(i,f)=qa(i,3)*PHI(f,3);
    end
end
xlswrite('20210619_accln_MRHA_3modes_updated.xlsx',a3,'mode3');

% %Fourth Mode%
%     i=0;
% for t=0:0.001:(length(to)-1)*0.001
%     i=i+1;
%     for f=1:1:8
%         a4(i,f)=qa(i,4)*PHI(f,4);
%     end
% end
% xlswrite('20210619_accln_MRHA.xlsx',a4,'mode4');
% 
% %Fifth Mode%
%     i=0;
% for t=0:0.001:(length(to)-1)*0.001
%     i=i+1;
%     for f=1:1:8
%         a5(i,f)=qa(i,5)*PHI(f,5);
%     end
% end
% xlswrite('20210619_accln_MRHA.xlsx',a5,'mode5');
% 
% %Sixth Mode%
%     i=0;
% for t=0:0.001:(length(to)-1)*0.001
%     i=i+1;
%     for f=1:1:8
%         a6(i,f)=qa(i,6)*PHI(f,6);
%     end
% end
% xlswrite('20210619_accln_MRHA.xlsx',a6,'mode6');
% 
% %Seventh Mode%
%     i=0;
% for t=0:0.001:(length(to)-1)*0.001
%     i=i+1;
%     for f=1:1:8
%         a7(i,f)=qa(i,7)*PHI(f,7);
%     end
% end
% xlswrite('20210619_accln_MRHA.xlsx',a7,'mode7');
% 
% %Eight Mode%
%     i=0;
% for t=0:0.001:(length(to)-1)*0.001
%     i=i+1;
%     for f=1:1:8
%         a8(i,f)=qa(i,8)*PHI(f,8);
%     end
% end
% xlswrite('20210619_accln_MRHA.xlsx',a8,'mode8');



a=a1+a2+a3;
xlswrite('20210619_accln_MRHA_3modes_updated.xlsx',a,'total');

%%
%%
%%%FFT of Signal%%%
npnts=length(qa);
srate=1000;
for m=1:3
fftqa(:,m)=fft(qa(:,m));
fftqaamp(:,m)=2*abs(fftqa(:,m))/npnts;
hz=linspace(0,srate/2,floor(npnts/2)+1);

figure(m)
plot(hz,fftqaamp(1:length(hz),m));
end

