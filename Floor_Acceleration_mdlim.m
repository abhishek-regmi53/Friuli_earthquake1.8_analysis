%Computing Floor Acceleration
%%
%Modal Coordinates
fid=fopen('20210614_modalaccln_filtered_orthogonal_filters.CSV');
c=textscan(fid,'%f %f %f','Delimiter',',','headerlines',0);
c=cell2mat(c);
qa=c;                                                                                                             %q=modal coordinates
to=linspace(0,length(c)*0.01,length(c));

%%
%Modal Properties
PHI=xlsread('20210616_modal_properties_lab.xlsx','B2:D10');
phi(1,:)=PHI(1,:);
phi(2,:)=PHI(4,:);
phi(3,:)=PHI(7,:);
%Modal Mass
mn=xlsread('20210616_modal_properties_lab.xlsx','F28:F30');
%Angular Frequency
w=xlsread('20210616_modal_properties_lab.xlsx','J1:J3');
%Joint Mass 
m=xlsread('20210616_modal_properties_lab.xlsx','K17:K24');

%%
%Acceleration Computaion

%First Mode%
    i=0;
for t=0:0.01:(length(to)-1)*0.01
    i=i+1;
    for f=1:1:8
        a1(i,f)=qa(i,1)*PHI(f,1);
    end
end
xlswrite('20210617_accln_orthogonal_filter.xlsx',a1,'mode1');

%Second Mode%
    i=0;
for t=0:0.01:(length(to)-1)*0.01
    i=i+1;
    for f=1:1:8
        a2(i,f)=qa(i,2)*PHI(f,2);
    end
end
xlswrite('20210617_accln_orthogonal_filter.xlsx',a2,'mode2');


%Third Mode%
    i=0;
for t=0:0.01:(length(to)-1)*0.01
    i=i+1;
    for f=1:1:8
        a3(i,f)=qa(i,3)*PHI(f,3);
    end
end
xlswrite('20210617_accln_orthogonal_filter.xlsx',a3,'mode3');

a=a1+a2+a3;
xlswrite('20210617_accln_orthogonal_filter.xlsx',a,'total');

