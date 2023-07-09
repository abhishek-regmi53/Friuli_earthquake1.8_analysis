%This Program Calculates the mode wise displacement%
%%
%Modal Coordinates
fid=fopen('20210614_modalcoordinates_orthogonal_filters.CSV');
c=textscan(fid,'%f %f %f','Delimiter',',','headerlines',0);
c=cell2mat(c);
q=c;                                                                                                             %q=modal coordinates
to=linspace(0,length(c)*0.01,length(c));

%%
%Modewise floor Acceleration
a1=xlsread("20210617_accln_orthogonal_filter.xlsx",'mode1');
a2=xlsread("20210617_accln_orthogonal_filter.xlsx",'mode2');
a3=xlsread("20210617_accln_orthogonal_filter.xlsx",'mode3');
a=xlsread("20210617_accln_orthogonal_filter.xlsx",'total');



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
%Displacement Computaion

%First Mode%
    i=0;
for t=0:0.01:(length(to)-1)*0.01
    i=i+1;
    for f=1:1:8
        u1(i,f)=q(i,1)*PHI(f,1);
    end
end
xlswrite('20210617_disp_orthogonal_filter.xlsx',u1,'mode1');

%Second Mode%
    i=0;
for t=0:0.01:(length(to)-1)*0.01
    i=i+1;
    for f=1:1:8
        u2(i,f)=q(i,2)*PHI(f,2);
    end
end
xlswrite('20210617_disp_orthogonal_filter.xlsx',u2,'mode2');

%Third Mode%
    i=0;
for t=0:0.01:(length(to)-1)*0.01
    i=i+1;
    for f=1:1:8
        u3(i,f)=q(i,3)*PHI(f,3);
    end
end
xlswrite('20210617_disp_orthogonal_filter.xlsx',u3,'mode3');

%Total displacement
u=u1+u2+u3;
xlswrite('20210617_disp_orthogonal_filter.xlsx',u,'total');

%Modewise displacement envelop
for f=1:8
    umax(f,1)=max(u1(:,f));
    umax(9,1)=0;
    umin(f,1)=min(u1(:,f));
    umin(9,1)=0;
end

for f=1:8
    umax(f,2)=max(u2(:,f));
    umax(9,2)=0;
    umin(f,2)=min(u2(:,f));
    umin(9,2)=0;
end

for f=1:8
    umax(f,3)=max(u3(:,f));
    umax(9,3)=0;
    umin(f,3)=min(u3(:,f));
    umin(9,3)=0;
end

%Envelop of total displacement
for f=1:8
    umaxt(f,3)=max(u(:,f));
    umaxt(9,3)=0;
    umint(f,3)=min(u(:,f));
    umint(9,3)=0;
end

%%
%Shear Force Computation

%To calculate 'L' for modal mass participation
%%

% First Mode

l=0;   
for f=1:1:8
    l=l+m(f)*PHI(f,1);
end
T(1)=l/mn(1); %%%T=modal mass participation factor
i=0;
for t=0:0.01:(length(to)-1)*0.01
   i=i+1;
   for f=1:1:8
       V1(i,f)=0;   %%%V1= Story shear at first mode
       v1(i,f)=0;
       for j=f:-1:1
           V1(i,f)=V1(i,f)-a1(i,j)*m(j);
           v1(i,f)=v1(i,f)+u1(i,j)*w(1)*w(1)*m(j);
       end
   end
end
xlswrite('20210617_shear_response_mdlim.xlsx',V1,'mode1');
xlswrite('20210619_shear_response_from_disp_mdlim.xlsx',v1,'mode1');

%%

% Second Mode

l=0;   
for f=1:1:8
    l=l+m(f)*PHI(f,2);
end
T(2)=l/mn(2); %%%T=modal mass participation factor
i=0;
for t=0:0.01:(length(to)-1)*0.01
   i=i+1;
   for f=1:1:8
       V2(i,f)=0;   %%%V1= Story shear at first mode
       v2(i,f)=0;
       for j=f:-1:1
           V2(i,f)=V2(i,f)-a2(i,j)*m(j);
           v2(i,f)=v2(i,f)+u2(i,j)*w(2)*w(2)*m(j);
       end
   end
end
xlswrite('20210617_shear_response_mdlim.xlsx',V2,'mode2');
xlswrite('20210619_shear_response_from_disp_mdlim.xlsx',v2,'mode2');
%%

% Third Mode

l=0;   
for f=1:1:8
    l=l+m(f)*PHI(f,3);
end
T(3)=l/mn(3); %%%T=modal mass participation factor
i=0;
for t=0:0.01:(length(to)-1)*0.01
   i=i+1;
   for f=1:1:8
       V3(i,f)=0;   %%%V1= Story shear at first mode
       v3(i,f)=0;
       for j=f:-1:1
           V3(i,f)=V3(i,f)-a3(i,j)*m(j);
           v3(i,f)=v3(i,f)+u3(i,j)*w(3)*w(3)*m(j);
       end
   end
end
xlswrite('20210617_shear_response_mdlim.xlsx',V3,'mode3');
xlswrite('20210619_shear_response_from_disp_mdlim.xlsx',v3,'mode3');
%Total Shear Force
V=V1+V2+V3;
xlswrite('20210617_shear_response_mdlim.xlsx',V,'total');
v=v1+v2+v3;
xlswrite('20210619_shear_response_from_disp_mdlim.xlsx',v,'total');
%%
% Bending Moment Computation

%floor height
h=[2:-0.250:0];

%%
%First Mode
i=0;
for t=0:0.01:(length(to)-1)*0.01
   i=i+1;
   for f=1:8
       M1(i,f)=0;   %%%M1= story moment at first mode
       m1(i,f)=0;
       for j=f:-1:1
           M1(i,f)=M1(i,f)-a1(i,j)*m(j)*(h(j)-h(f));
           m1(i,f)=m1(i,f)+u1(i,j)*w(1)*w(1)*m(j)*(h(j)-h(f));
       end
   end
end

%%%For Moment at base%%%
i=0;
for t=0:0.01:(length(to)-1)*0.01
   i=i+1;
       M1(i,9)=0;   %%%M1= story moment at first mode
       m1(i,9)=0;
       for j=8:-1:1
           M1(i,9)=M1(i,9)-a1(i,j)*m(j)*h(j);
           m1(i,9)=m1(i,9)+u1(i,j)*w(1)*w(1)*m(j)*h(j);
       end
end
xlswrite('20210617_bending_moment_mdlim.xlsx',M1,'mode1');
xlswrite('20210619_bending_moment_from_disp_mdlim.xlsx',m1,'mode1');
%%
%Second Mode
i=0;
for t=0:0.01:(length(to)-1)*0.01
   i=i+1;
   for f=1:8
       M2(i,f)=0;   %%%M1= story moment at first mode
       m2(i,f)=0;
       for j=f:-1:1
           M2(i,f)=M2(i,f)-a2(i,j)*m(j)*(h(j)-h(f));
           m2(i,f)=m2(i,f)+u2(i,j)*w(2)*w(2)*m(j)*(h(j)-h(f));
       end
   end
end

%%%For Moment at base%%%
i=0;
for t=0:0.01:(length(to)-1)*0.01
   i=i+1;
       M2(i,9)=0;   %%%M1= story moment at first mode
       m2(i,9)=0;
       for j=8:-1:1
           M2(i,9)=M2(i,9)-a2(i,j)*m(j)*h(j);
           m2(i,9)=m2(i,9)+u2(i,j)*w(2)*w(2)*m(j)*h(j);
       end
end
xlswrite('20210617_bending_moment_mdlim.xlsx',M2,'mode2');
xlswrite('20210619_bending_moment_from_disp_mdlim.xlsx',m2,'mode2');
%%
%Third Mode
i=0;
for t=0:0.01:(length(to)-1)*0.01
   i=i+1;
   for f=1:8
       M3(i,f)=0;   %%%M1= story moment at first mode
       m3(i,f)=0;
       for j=f:-1:1
           M3(i,f)=M3(i,f)-a3(i,j)*m(j)*(h(j)-h(f));
           m3(i,f)=m3(i,f)+u3(i,j)*w(3)*w(3)*m(j)*(h(j)-h(f));
       end
   end
end

%%%For Moment at base%%%
i=0;
for t=0:0.01:(length(to)-1)*0.01
   i=i+1;
       M3(i,9)=0;   %%%M1= story moment at first mode
       m3(i,9)=0;
       for j=8:-1:1
           M3(i,9)=M3(i,9)-a3(i,j)*m(j)*h(j);
           m3(i,9)=m3(i,9)+u3(i,j)*w(3)*w(3)*m(j)*h(j);
       end
end
xlswrite('20210617_bending_moment_mdlim.xlsx',M3,'mode3');
xlswrite('20210619_bending_moment_from_disp_mdlim.xlsx',m3,'mode3');
M=M1+M2+M3;
m=m1+m2+m3;
xlswrite('20210617_bending_moment_mdlim.xlsx',M,'total');
xlswrite('20210619_bending_moment_from_disp_mdlim.xlsx',m,'total');
%%
%Computing Bending Strain
E=2e11;
y=23.1/2000;
I=2.44776E-08;
%Mstr=Strain due to bending moment
Mstr1=(M1*y*1e6)/(E*I);
Mstr2=(M2*y*1e6)/(E*I);
Mstr3=(M3*y*1e6)/(E*I);
Mstr=(M*y*1e6)/(E*I);
xlswrite('20210617_bending_strain_mdlim.xlsx',Mstr1,'mode1');
xlswrite('20210617_bending_strain_mdlim.xlsx',Mstr2,'mode2');
xlswrite('20210617_bending_strain_mdlim.xlsx',Mstr3,'mode3');
xlswrite('20210617_bending_strain_mdlim.xlsx',Mstr,'total');

%%
%Computing Bending Strain from moment computed from displacement
E=2e11;
y=23.1/2000;
I=2.44776E-08;
%Mstr=Strain due to bending moment
mstr1=(m1*y*1e6)/(E*I);
mstr2=(m2*y*1e6)/(E*I);
mstr3=(m3*y*1e6)/(E*I);
mstr=(m*y*1e6)/(E*I);
xlswrite('20210619_bending_strain_from_disp_mdlim.xlsx',mstr1,'mode1');
xlswrite('20210619_bending_strain_from_disp_mdlim.xlsx',mstr2,'mode2');
xlswrite('20210619_bending_strain_from_disp_mdlim.xlsx',mstr3,'mode3');
xlswrite('20210619_bending_strain_from_disp_mdlim.xlsx',mstr,'total');



%%
%Computing Shear Strain
b=23.1/1000;
t=2.1/1000;
G=79.3e9;
Sstr1=(V1/(2*b*t*G))*1e6;
Sstr2=(V2/(2*b*t*G))*1e6;
Sstr3=(V3/(2*b*t*G))*1e6;
Sstr=(V/(2*b*t*G))*1e6;
xlswrite('20210617_shear_strain_mdlim.xlsx',Sstr1,'mode1');
xlswrite('20210617_shear_strain_mdlim.xlsx',Sstr2,'mode2');
xlswrite('20210617_shear_strain_mdlim.xlsx',Sstr3,'mode3');
xlswrite('20210617_shear_strain_mdlim.xlsx',Sstr,'total');

%%
%Computing Shear Strain
b=23.1/1000;
t=2.1/1000;
G=79.3e9;
sstr1=(v1/(2*b*t*G))*1e6;
sstr2=(v2/(2*b*t*G))*1e6;
sstr3=(v3/(2*b*t*G))*1e6;
sstr=(v/(2*b*t*G))*1e6;
xlswrite('20210619_shear_strain_from_disp_mdlim.xlsx',sstr1,'mode1');
xlswrite('20210619_shear_strain_from_disp_mdlim.xlsx',sstr2,'mode2');
xlswrite('20210619_shear_strain_from_disp_mdlim.xlsx',sstr3,'mode3');
xlswrite('20210619_shear_strain_from_disp_mdlim.xlsx',sstr,'total');





