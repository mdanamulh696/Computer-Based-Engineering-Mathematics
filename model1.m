function [kf_calc,opt_x]=model1(filename);
filename = 'Cr6.mat';
dataset = importdata(filename);

%Loading Data from Dataset to variables
phidot=dataset(:,1);
phi=dataset(:,2);
Temp=dataset(:,3);
kf_data=dataset(:,4);

%Assigning the parameters
B=log(kf_data);
t1=Temp;
t2=log(phidot);
t3=log(phi);
t4=phi;
t5=Temp.*log(phidot);
t6=ones(size(dataset,1),1);

%Putting the parameters in the array
A=[t1 t2 t3 t4 t5 t6];


%Ax=B
%x = A\B
opt_x=A\B;

mod1_x1=opt_x(1,1);
mod1_x2=opt_x(2,1);
mod1_x3=opt_x(3,1);
mod1_x4=opt_x(4,1);
mod1_x5=opt_x(5,1);
mod1_x6=exp(opt_x(6,1));

%Our prediction of Kf
kf_calc=exp(A*opt_x);
opt_x 
mod1_x6
disp('R_square of model(1)');
rsquare(kf_data,kf_calc)