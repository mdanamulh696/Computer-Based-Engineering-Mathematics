function none =plot_2dim(filename,inp_Phidot,T)
%filename = 'Cr6.mat';
T = 100;
inp_Phidot = 90;
[kf_mod_1,x_opt_1]=model1(filename);
[kf_mod_2,x_opt_2]=model2(filename);

dataset = importdata(filename)

phidot=dataset(:,1);
temp=dataset(:,3);
kf_data=dataset(:,4);

n = 1;

for i=1:size(dataset,1)
    if(T == temp(i,1))
        if(inp_Phidot == phidot(i,1))
            phi(n,1)=dataset(i,2);
            y_mod_1(n,1)=kf_mod_1(i,1);
            y_mod_2(n,1)=kf_mod_2(i,1);
            y(n,1)=kf_data(i,1);
            n=n+1;
        end
    end
end

if(n < 4)
    disp('Too less data too sampled, please choose new temperature and/or phidot');
else
    subplot(1,1,1);
    plot(phi,y,'.-k',phi,y_mod_1,'.--r',phi,y_mod_2,'.--b');
    title(['T=',num2str(T), ' and phidot=',num2str(inp_Phidot)]);
    xlabel('Values of Phi');
    ylabel('Values of Kf');
    legend('Kf from Dataset','Kf from model 1 ','Kf from model 2 ');
end