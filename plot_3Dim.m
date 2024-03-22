function none = plot_3dim(filename,in_Phidot,model)
 %model = 2;
 %filename = 'Cr6.mat'
 in_Phidot = 0.1
[kf_mod_1,x_opt_1]=model1(filename);
[kf_mod_2,x_opt_2]=model2(filename);

dataset = importdata(filename)
phidot=dataset(:,1);
phi=dataset(:,2);
Temp=dataset(:,3);
kf=dataset(:,4);

n=1;

for i=1:size(phidot,1)
    if(in_Phidot==phidot(i,1))
        temp(n,1)=Temp(i,1);
        phi_graph(n,1)=phi(i,1);
        y(n,1)=kf(i,1);
        n=n+1;
    end
end
if(n < 4)
    disp('Too less data too sampled, please choose new temperature and/or phidot');
    
else
    [x,y]=meshgrid(temp,phi_graph);
    
    if(model == 1)
    y_eq=x.*x_opt_1(1,1)+x_opt_1(2,1)*log(in_Phidot)+log(y).*x_opt_1(3,1)+y.*x_opt_1(4,1)+x.*(x_opt_1(5,1)*log(in_Phidot))+x_opt_1(6,1);
    else
    y_eq=x.*x_opt_2(1,1)+x_opt_2(2,1)*log(in_Phidot)+log(y).*x_opt_2(3,1)+y.*x_opt_2(4,1)+x.*(x_opt_2(5,1)*log(in_Phidot))+x_opt_2(6,1)*log(in_Phidot).*y+x_opt_2(7,1).*log(y)+x_opt_2(8,1)*in_Phidot.*log(y)+x_opt_2(9,1)*in_Phidot+x_opt_2(10,1);
    end
    z=exp(y_eq);
    surf(x,y,z);
    title(['3D of model ',num2str(model) ,' with phidot = ',num2str(in_Phidot)]);
    xlabel('Temperature');
    ylabel('Value of phi');
    zlabel('Value of Kf');
end

