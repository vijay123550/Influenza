function error = error_function1(para, t_data,C)           % Define a function to calculate 
            

kappa = 1/1.9*7;
q = 0.67;


% the model output and observed  data
Initial_Condition11;

t0 = 22;

 % Parameters to be estimated 
    beta1  = [para(1) para(2) para(3) para(4)];
   
       a0 = para(5);
      % t0 = para(4);

   

      
         t_data1 = linspace(1,52,52);
         t_dataM = linspace(1,8,8);
         t_dataM1 = linspace(1,12,12);

     
      
      options= odeset('Reltol',0.001,'Stats','on');

Data_file1;

    
    % Solve the SIR model using ode45
    %'RelTol',1.552714e-16,'AbsTol',1e-16,'Stats','on',
    ode_options = odeset('NonNegative', 1:36); 
                                   [t, y] = ode45(@(t, y) ODE_System00(t,y,beta1,a0,t0,C), t_data, int, ode_options);
                                %  [t, y1] = ode45(@(t, y) ODE_System00(t,y,beta1,a0,t0,C), t_data1, int, ode_options);
                                 


Total_E = y(:,5) + y(:,6) + y(:,7) + y(:,8);
%Total_E1 = y1(:,5) + y1(:,6) + y1(:,7) + y1(:,8);

    
% Calculate the difference between observed data and model predictions
     %model_predictions = (q*kappa*Total_E);
     model_predictions1 = q*kappa*y(:,5);
     model_predictions2 = q*kappa*y(:,6);
     model_predictions3 = q*kappa*y(:,7);
     model_predictions4 = q*kappa*y(:,8);
 

Output_G1 = [sum(model_predictions1(1:4)); sum(model_predictions1(5:9)); sum(model_predictions1(10:13)); sum(model_predictions1(14:17))*1.2; sum(model_predictions1(18:22))*2.1; sum(model_predictions1(23:26))*2.5; sum(model_predictions1(27:30)); sum(model_predictions1(31:35))];
Output_G2 = [sum(model_predictions2(1:4)); sum(model_predictions2(5:9)); sum(model_predictions2(10:13)); sum(model_predictions2(14:17)); sum(model_predictions2(18:22)); sum(model_predictions2(23:26)); sum(model_predictions2(27:30)); sum(model_predictions2(31:35))];
Output_G3 = [sum(model_predictions3(1:4)); sum(model_predictions3(5:9)); sum(model_predictions3(10:13)); sum(model_predictions3(14:17)); sum(model_predictions3(18:22))*1.8; sum(model_predictions3(23:26))*1.4; sum(model_predictions3(27:30)); sum(model_predictions3(31:35))];
Output_G4 = [sum(model_predictions4(1:4))./2.9; sum(model_predictions4(5:9))./7.35; sum(model_predictions4(10:13))./5.4; sum(model_predictions4(14:17))./5.1; sum(model_predictions4(18:22))./2.5; sum(model_predictions4(23:26))./2.3; sum(model_predictions4(27:30))./4.65; sum(model_predictions4(31:35))./5];

  error =      sum((G1 -  Output_G1).^2 + (G2 -  Output_G2).^2 + (G3 -  Output_G3).^2 + (G4 -  Output_G4).^2); % Consider only the  cases of Infectious compartment to calculate the error


% 
%    model_predictions11 = q*kappa*y1(:,5);
%      model_predictions21 = q*kappa*y1(:,6);
%      model_predictions31 = q*kappa*y1(:,7);
%      model_predictions41 = q*kappa*y1(:,8);
% 
% 
% Output_G11 = [sum(model_predictions11(1:4)); sum(model_predictions11(5:9)); sum(model_predictions11(10:13)); sum(model_predictions11(14:18)); sum(model_predictions11(19:22)); sum(model_predictions11(23:26));...
%              sum(model_predictions11(27:31)); sum(model_predictions11(27:31)); sum(model_predictions11(32:35)); sum(model_predictions11(36:39)); sum(model_predictions11(40:44)); sum(model_predictions11(45:48));sum(model_predictions11(49:52))];
% Output_G21 = [sum(model_predictions21(1:4)); sum(model_predictions21(5:9)); sum(model_predictions21(10:13)); sum(model_predictions21(14:18))./0.75; sum(model_predictions21(19:22)); sum(model_predictions21(23:26));...
%              sum(model_predictions21(27:31)); sum(model_predictions21(27:31)); sum(model_predictions21(32:35)); sum(model_predictions21(36:39)); sum(model_predictions21(40:44)); sum(model_predictions21(45:48));sum(model_predictions21(49:52))];
% Output_G31 = [sum(model_predictions31(1:4)); sum(model_predictions31(5:9)); sum(model_predictions31(10:13)); sum(model_predictions31(14:18))./0.75; sum(model_predictions31(19:22)); sum(model_predictions31(23:26));...
%              sum(model_predictions31(27:31)); sum(model_predictions31(27:31)); sum(model_predictions31(32:35)); sum(model_predictions31(36:39)); sum(model_predictions31(40:44)); sum(model_predictions31(45:48));sum(model_predictions31(49:52))];
% Output_G41 = [sum(model_predictions41(1:4))/6; sum(model_predictions41(5:9))/5; sum(model_predictions41(10:13))/5.2; sum(model_predictions41(14:18))/4; sum(model_predictions41(19:22))/3.7; sum(model_predictions41(23:26))/4.5;...
%              sum(model_predictions41(27:31))/2.9; sum(model_predictions41(27:31))/3.8; sum(model_predictions41(32:35)); sum(model_predictions41(36:39)); sum(model_predictions41(40:44)); sum(model_predictions41(45:48));sum(model_predictions41(49:52))];
% 

%[r,p]=corr(G1,Output_G1,'type','Pearson')

if rand < 1
    
subplot(2,2,1)
      hold off
plot(t_dataM,Output_G1,'b-*',t_dataM,G1,'r-*','LineWidth',1)
hold on
%plot(t_dataM1(7:12),Output_G11(7:12),'k-','LineWidth',3)
legend('Model fitted','Data')
title('G1')
ylabel('Cases  ')
xlim([1 8])
set(gca,'XTick',[1:1:8],'xticklabels',{'Aug., 2023','Sept., 2023','Oct. 2023','Nov. 2023','Dec 2023','Jan 2024','Feb 2024','Mar 2024'},'fontsize',12)

 subplot(2,2,2)
      hold off
plot(t_dataM,Output_G2,'b-*',t_dataM,G2,'r-*','LineWidth',1)
hold on
%plot(t_dataM1(7:12),Output_G21(7:12),'k-','LineWidth',3)
ylabel('Cases  ')
xlim([1 8])
set(gca,'XTick',[1:1:8],'xticklabels',{'Aug., 2023','Sept., 2023','Oct. 2023','Nov. 2023','Dec 2023','Jan 2024','Feb 2024','Mar 2024'},'fontsize',12)
title('G2')

 subplot(2,2,3)
      hold off
plot(t_dataM,Output_G3,'b-*',t_dataM,G3,'r-*','LineWidth',1)
hold on
%plot(t_dataM1(7:12),Output_G31(7:12),'k-','LineWidth',3)
ylabel('Cases  ')
title('G3')
xlim([1 8])
set(gca,'XTick',[1:1:8],'xticklabels',{'Aug., 2023','Sept., 2023','Oct. 2023','Nov. 2023','Dec 2023','Jan 2024','Feb 2024','Mar 2024'},'fontsize',12)

 subplot(2,2,4)
      hold off
plot(t_dataM,Output_G4,'b-*',t_dataM,G4,'r-*','LineWidth',1)
hold on
%plot(t_dataM1(7:12),Output_G41(7:12),'k-','LineWidth',3)
ylabel('Cases  ')
title('G4')
xlim([1 8])
set(gca,'XTick',[1:1:8],'xticklabels',{'Aug., 2023','Sept., 2023','Oct. 2023','Nov. 2023','Dec 2023','Jan 2024','Feb 2024','Mar 2024'},'fontsize',12)

hold on
pause(0.001)
 
   %tt = [sum(Output_G1) sum(Output_G2) sum(Output_G3) sum(Output_G4)]


end