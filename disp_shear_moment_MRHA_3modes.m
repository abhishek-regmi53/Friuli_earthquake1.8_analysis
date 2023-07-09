%This Program Calculates the mode wise displacement%
%%
%Modal Coordinates
fid=fopen('20210619_modal_coordinate_MRHA_3modes.CSV');
c=textscan(fid,'%f %f %f','Delimiter',',','headerlines',0);
c=cell2mat(c);
q=c;                                                                                                             %q=modal coordinates
to=linspace(0,length(c)*0.001,(length(c)-1));

%%
%Modewise floor Acceleration
a1=xlsread("20210619_accln_MRHA_3modes.xlsx",'mode1');
a2=xlsread("20210619_accln_MRHA_3modes.xlsx",'mode2');
a3=xlsread("20210619_accln_MRHA_3modes.xlsx",'mode3');
% a4=xlsread("20210619_accln_MRHA.xlsx",'mode4');
% a5=xlsread("20210619_accln_MRHA.xlsx",'mode5');
% a6=xlsread("20210619_accln_MRHA.xlsx",'mode6');
% a7=xlsread("20210619_accln_MRHA.xlsx",'mode7');
% a8=xlsread("20210619_accln_MRHA.xlsx",'mode8');
a=xlsread("20210619_accln_MRHA_3modes.xlsx",'total');



%%
%%
%Modal Properties of 8 modes
PHI=xlsread('20210616_modal_properties_lab.xlsx','B2:D9');
m=xlsread('20210616_modal_properties_lab.xlsx','K17:K24');
w=xlsread('20210616_modal_properties_lab.xlsx','J1:J3');
mn=xlsread('20210616_modal_properties_lab.xlsx','F28:F30');

%%
%Displacement Computaion

%First Mode%
    i=0;
for t=0:0.001:(length(to)-1)*0.001
    i=i+1;
    for f=1:1:8
        u1(i,f)=q(i,1)*PHI(f,1);
    end
end
xlswrite('20210623_disp_MRHA_3modes.xlsx',u1,'mode1');

%Second Mode%
    i=0;
for t=0:0.001:(length(to)-1)*0.001
    i=i+1;
    for f=1:1:8
        u2(i,f)=q(i,2)*PHI(f,2);
    end
end
xlswrite('20210623_disp_MRHA_3modes.xlsx',u2,'mode2');

%Third Mode%
    i=0;
for t=0:0.001:(length(to)-1)*0.001
    i=i+1;
    for f=1:1:8
        u3(i,f)=q(i,3)*PHI(f,3);
    end
end
xlswrite('20210623_disp_MRHA_3modes.xlsx',u3,'mode3');

% %Fourth Mode%
%     i=0;
% for t=0:0.001:(length(to)-1)*0.001
%     i=i+1;
%     for f=1:1:8
%         u4(i,f)=q(i,4)*PHI(f,4);
%     end
% end
% % xlswrite('20210623_disp_MRHA.xlsx',u4,'mode4');
% 
% %Fifth Mode%
%     i=0;
% for t=0:0.001:(length(to)-1)*0.001
%     i=i+1;
%     for f=1:1:8
%         u5(i,f)=q(i,5)*PHI(f,5);
%     end
% end
% % xlswrite('20210623_disp_MRHA.xlsx',u5,'mode5');
% 
% %Sixth Mode%
%     i=0;
% for t=0:0.001:(length(to)-1)*0.001
%     i=i+1;
%     for f=1:1:8
%         u6(i,f)=q(i,6)*PHI(f,6);
%     end
% end
% % xlswrite('20210623_disp_MRHA.xlsx',u6,'mode6');
% 
% %Seventh Mode%
%     i=0;
% for t=0:0.001:(length(to)-1)*0.001
%     i=i+1;
%     for f=1:1:8
%         u7(i,f)=q(i,7)*PHI(f,7);
%     end
% end
% % xlswrite('20210623_disp_MRHA.xlsx',u7,'mode7');
% 
% %Eight Mode%
%     i=0;
% for t=0:0.001:(length(to)-1)*0.001
%     i=i+1;
%     for f=1:1:8
%         u8(i,f)=q(i,8)*PHI(f,8);
%     end
% end
% xlswrite('20210623_disp_MRHA.xlsx',u8,'mode8');


%Total displacement
u=u1+u2+u3;
xlswrite('20210623_disp_MRHA_3modes.xlsx',u,'total');

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
for t=0:0.001:(length(to)-1)*0.001
   i=i+1;
   for f=1:1:8
       V1(i,f)=0;   %%%V1= Story shear at first mode
       v1(i,f)=0;
       for j=f:-1:1
           V1(i,f)=V1(i,f)+a1(i,j)*m(j);
           v1(i,f)=v1(i,f)+u1(i,j)*w(1)*w(1)*m(j);
       end
   end
end
xlswrite('20210623_shear_response_from_accln_MRHA_3modes.xlsx',V1,'mode1');
xlswrite('20210623_shear_response_from_disp_MRHA_3modes.xlsx',v1,'mode1');

%%

% Second Mode

l=0;   
for f=1:1:8
    l=l+m(f)*PHI(f,2);
end
T(2)=l/mn(2); %%%T=modal mass participation factor
i=0;
for t=0:0.001:(length(to)-1)*0.001
   i=i+1;
   for f=1:1:8
       V2(i,f)=0;   %%%V1= Story shear at first mode
       v2(i,f)=0;
       for j=f:-1:1
           V2(i,f)=V2(i,f)+a2(i,j)*m(j);
           v2(i,f)=v2(i,f)+u2(i,j)*w(2)*w(2)*m(j);
       end
   end
end
xlswrite('20210623_shear_response_from_accln_MRHA_3modes.xlsx',V2,'mode2');
xlswrite('20210623_shear_response_from_disp_MRHA_3modes.xlsx',v2,'mode2');
%%

% Third Mode

l=0;   
for f=1:1:8
    l=l+m(f)*PHI(f,3);
end
T(3)=l/mn(3); %%%T=modal mass participation factor
i=0;
for t=0:0.001:(length(to)-1)*0.001
   i=i+1;
   for f=1:1:8
       V3(i,f)=0;   %%%V1= Story shear at first mode
       v3(i,f)=0;
       for j=f:-1:1
           V3(i,f)=V3(i,f)+a3(i,j)*m(j);
           v3(i,f)=v3(i,f)+u3(i,j)*w(3)*w(3)*m(j);
       end
   end
end
xlswrite('20210623_shear_response_from_accln_MRHA_3modes.xlsx',V3,'mode3');
xlswrite('20210623_shear_response_from_disp_MRHA_3modes.xlsx',v3,'mode3');

%%

% % Fourth Mode
% 
% l=0;   
% for f=1:1:8
%     l=l+m(f)*PHI(f,4);
% end
% T(4)=l/mn(4); %%%T=modal mass participation factor
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%    for f=1:1:8
%        V4(i,f)=0;   %%%V1= Story shear at first mode
%        v4(i,f)=0;
%        for j=f:-1:1
%            V4(i,f)=V4(i,f)+a4(i,j)*m(j);
%            v4(i,f)=v4(i,f)+u4(i,j)*w(4)*w(4)*m(j);
%        end
%    end
% end
% % xlswrite('20210623_shear_response_from_accln_MRHA.xlsx',V4,'mode4');
% % xlswrite('20210623_shear_response_from_disp_MRHA.xlsx',v4,'mode4');
% 
% %%
% 
% % Fifth Mode
% 
% l=0;   
% for f=1:1:8
%     l=l+m(f)*PHI(f,5);
% end
% T(5)=l/mn(5); %%%T=modal mass participation factor
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%    for f=1:1:8
%        V5(i,f)=0;   %%%V1= Story shear at first mode
%        v5(i,f)=0;
%        for j=f:-1:1
%            V5(i,f)=V5(i,f)+a5(i,j)*m(j);
%            v5(i,f)=v5(i,f)+u5(i,j)*w(5)*w(5)*m(j);
%        end
%    end
% end
% % xlswrite('20210623_shear_response_from_accln_MRHA.xlsx',V5,'mode5');
% % xlswrite('20210623_shear_response_from_disp_MRHA.xlsx',v5,'mode5');
% 
% %%
% 
% % Sixth Mode
% 
% l=0;   
% for f=1:1:8
%     l=l+m(f)*PHI(f,6);
% end
% T(6)=l/mn(6); %%%T=modal mass participation factor
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%    for f=1:1:8
%        V6(i,f)=0;   %%%V1= Story shear at first mode
%        v6(i,f)=0;
%        for j=f:-1:1
%            V6(i,f)=V6(i,f)+a6(i,j)*m(j);
%            v6(i,f)=v6(i,f)+u6(i,j)*w(6)*w(6)*m(j);
%        end
%    end
% end
% % xlswrite('20210623_shear_response_from_accln_MRHA.xlsx',V6,'mode6');
% % xlswrite('20210623_shear_response_from_disp_MRHA.xlsx',v6,'mode6');
% 
% %%
% 
% % Seventh Mode
% 
% l=0;   
% for f=1:1:8
%     l=l+m(f)*PHI(f,7);
% end
% T(7)=l/mn(7); %%%T=modal mass participation factor
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%    for f=1:1:8
%        V7(i,f)=0;   %%%V1= Story shear at first mode
%        v7(i,f)=0;
%        for j=f:-1:1
%            V7(i,f)=V7(i,f)+a7(i,j)*m(j);
%            v7(i,f)=v7(i,f)+u7(i,j)*w(7)*w(7)*m(j);
%        end
%    end
% end
% % xlswrite('20210623_shear_response_from_accln_MRHA.xlsx',V7,'mode7');
% % xlswrite('20210623_shear_response_from_disp_MRHA.xlsx',v7,'mode7');
% 
% %%
% 
% % Eight Mode
% 
% l=0;   
% for f=1:1:8
%     l=l+m(f)*PHI(f,8);
% end
% T(8)=l/mn(8); %%%T=modal mass participation factor
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%    for f=1:1:8
%        V8(i,f)=0;   %%%V1= Story shear at first mode
%        v8(i,f)=0;
%        for j=f:-1:1
%            V8(i,f)=V8(i,f)+a8(i,j)*m(j);
%            v8(i,f)=v8(i,f)+u8(i,j)*w(8)*w(8)*m(j);
%        end
%    end
% end
% xlswrite('20210623_shear_response_from_accln_MRHA.xlsx',V8,'mode8');
% xlswrite('20210623_shear_response_from_disp_MRHA.xlsx',v8,'mode8');

%%
%Total Shear Force
V=V1+V2+V3;
xlswrite('20210623_shear_response_from_accln_MRHA_3modes.xlsx',V,'total');
v=v1+v2+v3;
xlswrite('20210623_shear_response_from_disp_MRHA_3modes.xlsx',v,'total');
%%
% Bending Moment Computation

%floor height
h=[2:-0.250:0];

%%
%First Mode
i=0;
for t=0:0.001:(length(to)-1)*0.001
   i=i+1;
   for f=1:8
       M1(i,f)=0;   %%%M1= story moment at first mode
       m1(i,f)=0;
       for j=f:-1:1
           M1(i,f)=M1(i,f)+a1(i,j)*m(j)*(h(j)-h(f));
           m1(i,f)=m1(i,f)+u1(i,j)*w(1)*w(1)*m(j)*(h(j)-h(f));
       end
   end
end

%%%For Moment at base%%%
i=0;
for t=0:0.001:(length(to)-1)*0.001
   i=i+1;
       M1(i,9)=0;   %%%M1= story moment at first mode
       m1(i,9)=0;
       for j=8:-1:1
           M1(i,9)=M1(i,9)+a1(i,j)*m(j)*h(j);
           m1(i,9)=m1(i,9)+u1(i,j)*w(1)*w(1)*m(j)*h(j);
       end
end
xlswrite('20210623_bending_moment_from_accln_MRHA_3modes.xlsx',M1,'mode1');
xlswrite('20210623_bending_moment_from_disp_MRHA_3modes.xlsx',m1,'mode1');
%%
%Second Mode
i=0;
for t=0:0.001:(length(to)-1)*0.001
   i=i+1;
   for f=1:8
       M2(i,f)=0;   %%%M1= story moment at first mode
       m2(i,f)=0;
       for j=f:-1:1
           M2(i,f)=M2(i,f)+a2(i,j)*m(j)*(h(j)-h(f));
           m2(i,f)=m2(i,f)+u2(i,j)*w(2)*w(2)*m(j)*(h(j)-h(f));
       end
   end
end

%%%For Moment at base%%%
i=0;
for t=0:0.001:(length(to)-1)*0.001
   i=i+1;
       M2(i,9)=0;   %%%M1= story moment at first mode
       m2(i,9)=0;
       for j=8:-1:1
           M2(i,9)=M2(i,9)+a2(i,j)*m(j)*h(j);
           m2(i,9)=m2(i,9)+u2(i,j)*w(2)*w(2)*m(j)*h(j);
       end
end
xlswrite('20210623_bending_moment_from_accln_MRHA_3modes.xlsx',M2,'mode2');
xlswrite('20210623_bending_moment_from_disp_MRHA_3modes.xlsx',m2,'mode2');
%%
%Third Mode
i=0;
for t=0:0.001:(length(to)-1)*0.001
   i=i+1;
   for f=1:8
       M3(i,f)=0;   %%%M1= story moment at first mode
       m3(i,f)=0;
       for j=f:-1:1
           M3(i,f)=M3(i,f)+a3(i,j)*m(j)*(h(j)-h(f));
           m3(i,f)=m3(i,f)+u3(i,j)*w(3)*w(3)*m(j)*(h(j)-h(f));
       end
   end
end

%%%For Moment at base%%%
i=0;
for t=0:0.001:(length(to)-1)*0.001
   i=i+1;
       M3(i,9)=0;   %%%M1= story moment at first mode
       m3(i,9)=0;
       for j=8:-1:1
           M3(i,9)=M3(i,9)+a3(i,j)*m(j)*h(j);
           m3(i,9)=m3(i,9)+u3(i,j)*w(3)*w(3)*m(j)*h(j);
       end
end
xlswrite('20210623_bending_moment_from_accln_MRHA_3modes.xlsx',M3,'mode3');
xlswrite('20210623_bending_moment_from_disp_MRHA_3modes.xlsx',m3,'mode3');

%%
% %Fourth Mode
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%    for f=1:8
%        M4(i,f)=0;   %%%M1= story moment at first mode
%        m4(i,f)=0;
%        for j=f:-1:1
%            M4(i,f)=M4(i,f)+a4(i,j)*m(j)*(h(j)-h(f));
%            m4(i,f)=m4(i,f)+u4(i,j)*w(4)*w(4)*m(j)*(h(j)-h(f));
%        end
%    end
% end
% 
% %%%For Moment at base%%%
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%        M4(i,9)=0;   %%%M1= story moment at first mode
%        m4(i,9)=0;
%        for j=8:-1:1
%            M4(i,9)=M4(i,9)+a4(i,j)*m(j)*h(j);
%            m4(i,9)=m4(i,9)+u4(i,j)*w(4)*w(4)*m(j)*h(j);
%        end
% end
% % xlswrite('20210623_bending_moment_from_accln_MRHA.xlsx',M4,'mode4');
% % xlswrite('20210623_bending_moment_from_disp_MRHA.xlsx',m4,'mode4');
% 
% %%
% %Fifth Mode
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%    for f=1:8
%        M5(i,f)=0;   %%%M1= story moment at first mode
%        m5(i,f)=0;
%        for j=f:-1:1
%            M5(i,f)=M5(i,f)+a5(i,j)*m(j)*(h(j)-h(f));
%            m5(i,f)=m5(i,f)+u5(i,j)*w(5)*w(5)*m(j)*(h(j)-h(f));
%        end
%    end
% end
% 
% %%%For Moment at base%%%
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%        M5(i,9)=0;   %%%M1= story moment at first mode
%        m5(i,9)=0;
%        for j=8:-1:1
%            M5(i,9)=M5(i,9)+a5(i,j)*m(j)*h(j);
%            m5(i,9)=m5(i,9)+u5(i,j)*w(5)*w(5)*m(j)*h(j);
%        end
% end
% % xlswrite('20210623_bending_moment_from_accln_MRHA.xlsx',M5,'mode5');
% % xlswrite('20210623_bending_moment_from_disp_MRHA.xlsx',m5,'mode5');
% 
% %%
% %Sixth Mode
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%    for f=1:8
%        M6(i,f)=0;   %%%M1= story moment at first mode
%        m6(i,f)=0;
%        for j=f:-1:1
%            M6(i,f)=M6(i,f)+a6(i,j)*m(j)*(h(j)-h(f));
%            m6(i,f)=m6(i,f)+u6(i,j)*w(6)*w(6)*m(j)*(h(j)-h(f));
%        end
%    end
% end
% 
% %%%For Moment at base%%%
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%        M6(i,9)=0;   %%%M1= story moment at first mode
%        m6(i,9)=0;
%        for j=8:-1:1
%            M6(i,9)=M6(i,9)+a6(i,j)*m(j)*h(j);
%            m6(i,9)=m6(i,9)+u6(i,j)*w(6)*w(6)*m(j)*h(j);
%        end
% end
% % xlswrite('20210623_bending_moment_from_accln_MRHA.xlsx',M6,'mode6');
% % xlswrite('20210623_bending_moment_from_disp_MRHA.xlsx',m6,'mode6');
% 
% %%
% %Seventh Mode
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%    for f=1:8
%        M7(i,f)=0;   %%%M1= story moment at first mode
%        m7(i,f)=0;
%        for j=f:-1:1
%            M7(i,f)=M7(i,f)+a7(i,j)*m(j)*(h(j)-h(f));
%            m7(i,f)=m7(i,f)+u7(i,j)*w(7)*w(7)*m(j)*(h(j)-h(f));
%        end
%    end
% end
% 
% %%%For Moment at base%%%
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%        M7(i,9)=0;   %%%M1= story moment at first mode
%        m7(i,9)=0;
%        for j=8:-1:1
%            M7(i,9)=M7(i,9)+a7(i,j)*m(j)*h(j);
%            m7(i,9)=m7(i,9)+u7(i,j)*w(7)*w(7)*m(j)*h(j);
%        end
% end
% % xlswrite('20210623_bending_moment_from_accln_MRHA.xlsx',M7,'mode7');
% % xlswrite('20210623_bending_moment_from_disp_MRHA.xlsx',m7,'mode7');
% 
% %%
% %Eight Mode
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%    for f=1:8
%        M8(i,f)=0;   %%%M1= story moment at first mode
%        m8(i,f)=0;
%        for j=f:-1:1
%            M8(i,f)=M8(i,f)+a8(i,j)*m(j)*(h(j)-h(f));
%            m8(i,f)=m8(i,f)+u8(i,j)*w(8)*w(8)*m(j)*(h(j)-h(f));
%        end
%    end
% end
% 
% %%%For Moment at base%%%
% i=0;
% for t=0:0.001:(length(to)-1)*0.001
%    i=i+1;
%        M8(i,9)=0;   %%%M1= story moment at first mode
%        m8(i,9)=0;
%        for j=8:-1:1
%            M8(i,9)=M8(i,9)+a8(i,j)*m(j)*h(j);
%            m8(i,9)=m8(i,9)+u8(i,j)*w(8)*w(8)*m(j)*h(j);
%        end
% end
% xlswrite('20210623_bending_moment_from_accln_MRHA.xlsx',M8,'mode8');
% xlswrite('20210623_bending_moment_from_disp_MRHA.xlsx',m8,'mode8');


%%
%Total
M=M1+M2+M3;
m=m1+m2+m3;
xlswrite('20210623_bending_moment_from_accln_MRHA_3modes.xlsx',M,'total');
xlswrite('20210623_bending_moment_from_disp_MRHA_3modes.xlsx',m,'total');
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
xlswrite('20210623_bending_strain_from_accln_MRHA_3modes.xlsx',Mstr1,'mode1');
xlswrite('20210623_bending_strain_from_accln_MRHA_3modes.xlsx',Mstr2,'mode2');
xlswrite('20210623_bending_strain_from_accln_MRHA_3modes.xlsx',Mstr3,'mode3');
xlswrite('20210623_bending_strain_from_accln_MRHA_3modes.xlsx',Mstr,'total');

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
xlswrite('20210623_bending_strain_from_disp_MRHA_3modes.xlsx',mstr1,'mode1');
xlswrite('20210623_bending_strain_from_disp_MRHA_3modes.xlsx',mstr2,'mode2');
xlswrite('20210623_bending_strain_from_disp_MRHA_3modes.xlsx',mstr3,'mode3');
xlswrite('20210623_bending_strain_from_disp_MRHA_3modes.xlsx',mstr,'total');



%%
%Computing Shear Strain
b=23.1/1000;
t=2.1/1000;
G=79.3e9;
Sstr1=(V1/(2*b*t*G))*1e6;
Sstr2=(V2/(2*b*t*G))*1e6;
Sstr3=(V3/(2*b*t*G))*1e6;
Sstr=(V/(2*b*t*G))*1e6;
xlswrite('20210623_Shear_strain_from_accln_MRHA_3modes.xlsx',Sstr1,'mode1');
xlswrite('20210623_Shear_strain_from_accln_MRHA_3modes.xlsx',Sstr2,'mode2');
xlswrite('20210623_Shear_strain_from_accln_MRHA_3modes.xlsx',Sstr3,'mode3');
xlswrite('20210623_Shear_strain_from_accln_MRHA_3modes.xlsx',Sstr,'total');

%%
%Computing Shear Strain
b=23.1/1000;
t=2.1/1000;
G=79.3e9;
sstr1=(v1/(2*b*t*G))*1e6;
sstr2=(v2/(2*b*t*G))*1e6;
sstr3=(v3/(2*b*t*G))*1e6;
sstr=(v/(2*b*t*G))*1e6;
xlswrite('20210623_shear_strain_from_disp_MRHA_3modes.xlsx',sstr1,'mode1');
xlswrite('20210623_shear_strain_from_disp_MRHA_3modes.xlsx',sstr2,'mode2');
xlswrite('20210623_shear_strain_from_disp_MRHA_3modes.xlsx',sstr3,'mode3');
xlswrite('20210623_shear_strain_from_disp_MRHA_3modes.xlsx',sstr,'total');





