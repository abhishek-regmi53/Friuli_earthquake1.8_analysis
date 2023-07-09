clear all
clc
%Modal Decomposition%
%Using Orthogonal Filters%
PHI=xlsread('20210616_modal_properties_lab.xlsx','B2:D10');
phi(1,:)=PHI(1,:);
phi(2,:)=PHI(4,:);
phi(3,:)=PHI(7,:);

%%
%%%A Matrix%%%
[A,An]=A_3modes();
A=double(A);
An=double(An);

%%
%Extracting Floor Acceleration%
%%% Reading the output file from experiment

fid=fopen('Friuli_1.80000.CSV');
c=textscan(fid,'%f %f %f %f %f %f %f %f %f','Delimiter',',','headerlines',14);
c=cell2mat(c);
srate=100; %100 Hz sampling frequency
to=c(:,1);
abs_acc=(c(:,3:5))*-9.81;  %Absolute Acceleration
ug=(c(:,2))*-9.81;
acc=abs_acc-ug;   %Relative Acceleration  

%%
%Calculation of Modal Coordinate%
i=0;
for t=0:0.01:(length(acc)-1)*0.01
  i=i+1;
  for m=1:1:3
    q(m,i)=(phi(:,m)'*A*acc(i,:)')/An(m,m); %%%q=modal coordinate acceleration%%% 
  end
end
q=double(q');
csvwrite('20210616modalaccln_orthogonal_filter.csv',q);
