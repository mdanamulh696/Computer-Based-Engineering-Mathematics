function [kf_calc,opt_x]=model2(filename);
%filename = m'Cr6.mat';
dataset = importdata(filename);

phidot=dataset(:,1);
phi=dataset(:,2);
Temp=dataset(:,3);
kf_data=dataset(:,4);

B=log(kf_data);
t1=Temp;
t2=log(phidot);
t3=log(phi);
t4=phi;
t5=Temp.*log(phidot);
t6=phi.*log(phidot);
t7=Temp.*log(phi);
t8=phidot.*log(phi);
t9=phidot;
t10=ones(size(dataset,1),1);

A=[t1 t2 t3 t4 t5 t6 t7 t8 t9 t10];

%Ax=B
%x = A\B
opt_x = A\B;

mod2_x1 = opt_x(1,1);
mod2_x2 = opt_x(2,1);
mod2_x3 = opt_x(3,1);
mod2_x4 = opt_x(4,1);
mod2_x5 = opt_x(5,1);
mod2_x6 = opt_x(6,1);
mod2_x7 = opt_x(7,1);
mod2_x8 = opt_x(8,1);
mod2_x9 = opt_x(9,1);
mod2_x10 = exp(opt_x(10,1));

kf_calc=exp(A*opt_x);
opt_x
mod2_x10
display('R_square of model(2)');
rsquare(kf_data,kf_calc)