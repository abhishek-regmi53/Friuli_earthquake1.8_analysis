%MRHA (Modal Response History Analysis)
%%
%IMPORTANT: Modal Properties taken from Ambient Vibration Test
%Modal Properties of 3 modes
phi=xlsread('20210616_modal_properties_lab.xlsx','B2:D9');
m=xlsread('20210616_modal_properties_lab.xlsx','K17:K24');
w=xlsread('20210616_modal_properties_lab.xlsx','J1:J3');
mn=xlsread('20210616_modal_properties_lab.xlsx','F28:F30');
%%
%Earthquake motion, ug
fid=fopen('Friuli_1.80000.csv');
c=textscan(fid,'%f %f %f %f %f %f %f %f %f','Delimiter',',','headerlines',14);
c=cell2mat(c);
to=linspace(0,length(c)*0.01,length(c));
ug1=-c(:,2);
tint=linspace(0,length(c)*0.01,length(c)*10);
ug=interp1(to,ug1,tint);
ug=ug';
eta=0.0025;
eta2=0.0025;
eta3=0.0025;
dt=0.001;
%%
%MODE1
for n=1 %%%MODE%%%
    k=w(n)*w(n)*mn(n);
    c=2*eta*w(n)*mn(n);
    c2=2*eta2*w(n)*mn(n);
    c3=2*eta3*w(n)*mn(n);
    %%%Calculate Tn, Ln to compute generalized force%%%
    Ln=0;
    for j=1:1:8
        Ln=Ln+m(j)*phi(j,n)  %%%mj =mass @ jth floor
    end
    Tn=Ln/mn(n)
    Ln;
    a=0;
    for t=0:0.001:(length(ug)-1)*0.001
        a=a+1;
        p(a,n)=-Ln*ug(a,1)*9.81;
    end
    i=0;
    for t=0:0.001:(length(ug)-2)*0.001
        i=i+1;
        q(1,n)=0;
        qv(1,n)=0;
        qa(i,n)=(p(i,n)-c*qv(i,n)-k*q(i,n))/mn(n);
        Kc=k+(6*mn(n))/(dt^2)+(3*c)/dt;
        Pc(i,n)= p(i+1,n)-p(i,n)+mn(n)*((6*qv(i,n))/dt+3*qa(i,n))+c*(3*qv(i,n)+dt*qa(i,n)/2);
        dq(i,n)=Pc(i,n)/Kc;
        dqv(i,n)=3*dq(i,n)/dt-3*qv(i,n)-dt*qa(i,n)/2;
        q(i+1,n)=q(i,n)+dq(i,n);
        qv(i+1,n)=qv(i,n)+dqv(i,n);
    end
end

%%
%MODE2
for n=2 %%%MODE%%%
    k=w(n)*w(n)*mn(n);
    c=2*eta2*w(n)*mn(n);
    %%%Calculate Tn, Ln to compute generalized force%%%
    Ln=0;
    for j=1:1:8
        Ln=Ln+m(j)*phi(j,n)  %%%mj =mass @ jth floor
    end
    Tn=Ln/mn(n)
    Ln;
    a=0;
    for t=0:0.001:(length(ug)-1)*0.001
        a=a+1;
        p(a,n)=-Ln*ug(a,1)*9.81;
    end
    i=0;
    for t=0:0.001:(length(ug)-2)*0.001
        i=i+1;
        q(1,n)=0;
        qv(1,n)=0;
        qa(i,n)=(p(i,n)-c*qv(i,n)-k*q(i,n))/mn(n);
        Kc=k+(6*mn(n))/(dt^2)+(3*c)/dt;
        Pc(i,n)= p(i+1,n)-p(i,n)+mn(n)*((6*qv(i,n))/dt+3*qa(i,n))+c*(3*qv(i,n)+dt*qa(i,n)/2);
        dq(i,n)=Pc(i,n)/Kc;
        dqv(i,n)=3*dq(i,n)/dt-3*qv(i,n)-dt*qa(i,n)/2;
        q(i+1,n)=q(i,n)+dq(i,n);
        qv(i+1,n)=qv(i,n)+dqv(i,n);
    end
end

%%
%MODE3
for n=3 %%%MODE%%%
    k=w(n)*w(n)*mn(n);
    c=2*eta3*w(n)*mn(n);
    %%%Calculate Tn, Ln to compute generalized force%%%
    Ln=0;
    for j=1:1:8
        Ln=Ln+m(j)*phi(j,n)  %%%mj =mass @ jth floor
    end
    Tn=Ln/mn(n)
    Ln;
    a=0;
    for t=0:0.001:(length(ug)-1)*0.001
        a=a+1;
        p(a,n)=-Ln*ug(a,1)*9.81;
    end
    i=0;
    for t=0:0.001:(length(ug)-2)*0.001
        i=i+1;
        q(1,n)=0;
        qv(1,n)=0;
        qa(i,n)=(p(i,n)-c*qv(i,n)-k*q(i,n))/mn(n);
        Kc=k+(6*mn(n))/(dt^2)+(3*c)/dt;
        Pc(i,n)= p(i+1,n)-p(i,n)+mn(n)*((6*qv(i,n))/dt+3*qa(i,n))+c*(3*qv(i,n)+dt*qa(i,n)/2);
        dq(i,n)=Pc(i,n)/Kc;
        dqv(i,n)=3*dq(i,n)/dt-3*qv(i,n)-dt*qa(i,n)/2;
        q(i+1,n)=q(i,n)+dq(i,n);
        qv(i+1,n)=qv(i,n)+dqv(i,n);
    end
end
csvwrite('20210619_modal_accln_MRHA_3modes.csv',qa);
csvwrite('20210619_modal_coordinate_MRHA_3modes.csv',q);