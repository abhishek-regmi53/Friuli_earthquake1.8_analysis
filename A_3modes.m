function [A,An]=A_3modes()
  %%%Program to calculate A matrix%%%
  %%%Reduced shape vectors used%%%
  %%%Input=Reduced shape Vector%%%
  %%%four modes are used%%%
  format shortG;
%   phi=zeros(3,7);
%   phi(:,1)=[1;
%   0.603427598;
%   0.121778755];
%   phi(:,2)=[1;
%   -0.584618966;
%   -0.665691685];
%   phi(:,3)=[0.708421668;
%   -0.870097641;
%   1];
PHI=xlsread('20210616_modal_properties_lab.xlsx','B2:D10');
phi(1,:)=PHI(1,:);
phi(2,:)=PHI(4,:);
phi(3,:)=PHI(7,:);


 %% 
 %%%Defining A matrix as symmetric matrix%%% 
 syms a11 a12 a13... 
                  a22 a23 ...
                  a33 ...

 %%
 %%As the main diagonal terms shouldn't be zero
assume(a11~=0);
assume(a22~=0);
assume(a33~=0);

 A=sym(zeros(3,3));
 
 A(1,1)=1;
 A(1,2)=a12;
 A(1,3)=a13;
  
 A(2,1)=a12;
 A(2,2)=a22;
 A(2,3)=a23;
  
 A(3,1)=a13;
 A(3,2)=a23;
 A(3,3)=a33;

 %%
 %1 
 error1= (phi(:,1)'*A)*phi(:,2);
 e1=error1^2;
 
 error2= phi(:,1)'*A*phi(:,3);
 e2=error2^2;
 

 E=e1+e2;
 
 %2
 error2= phi(:,2)'*A*phi(:,3);
 e2=error2^2;
 
 E=E+e2;

 %%
 % square of errors from all modes are summed in order that the results determined after this will satify all orthogonality condition
 eqns = [  diff(E,a12) == 0,diff(E,a13) == 0, ...
                          diff(E,a22) == 0,diff(E,a23) == 0,...
                                           diff(E,a33) == 0]
                                      
%vpa(eqns,3);
 vars = [  a12, a13... 
               a22, a23... 
                    a33]
                         
 [ a12, a13...
       a22, a23... 
            a33]= solve(eqns,vars);
                 
        
%         vpa(a12,5)
%         vpa(a13,5)
%         vpa(a22,5)
%         vpa(a23,5)
%         vpa(a33,5)

A(1,1)=1;
 A(1,2)=a12;
 A(1,3)=a13;
 
 A(2,1)=a12;
 A(2,2)=a22;
 A(2,3)=a23;
  
 A(3,1)=a13;
 A(3,2)=a23;
 A(3,3)=a33;
 
 A=double(A);           
 xlswrite('amat1.xlsx',A);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %          Positive definite property check             % 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 e=eig(A);
 e=vpa(e,4)
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %          Check for modal orthogonality                %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 C1=vpa(phi(:,1)'*A*phi(:,2),5);
 C2=vpa(phi(:,1)'*A*phi(:,3),5);
 
 A=vpa(A,5)
 An=vpa(phi'*A*phi,5)
 end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

