clc;
clear all;
close all;

%%

delta = 0.5;
eta = 1/6*7;
alpha = 1/6*7;

d = 7e-2*[ 0.0033, 0.02, 0.1, 0.56];


epsilon =[ 0.625, 0.54, 0, 0.478];
 kappa = 1/1.9*7;
q = 0.67;

Initial_Condition11;
    

beta1  = [  4.1604    0.3042    0.1071    0.2720 ];
       a0 =  0.2866;
      
       t0 = 22;

cont1

       t_data = linspace(1,35,35);


       %%
    ode_options = odeset('NonNegative', 1:36);

    [t, y] =  ode45(@(t, y) ODE_System00(t,y,beta1,a0,t0,C) ,  t_data, int, ode_options);



    %%
Total_E = y(:,5) + y(:,6) + y(:,7) + y(:,8);

   
     model_predictions1 = q*kappa*y(:,5).*1.57;
     model_predictions2 = q*kappa*y(:,6).*0.965;
     model_predictions3 = q*kappa*y(:,7).*1.325;
     model_predictions4 = q*kappa*y(:,8)./3.41;
     model_predictions = model_predictions1+model_predictions2+model_predictions3+model_predictions4;
%%% cumulative %
all_group = cumsum(model_predictions)/51717590*100;
group_1 = cumsum(model_predictions1)./5533800*100;
group_2 = cumsum(model_predictions2)./23428000*100;
group_3 = cumsum(model_predictions3)./12826000*100;
group_4 = cumsum(model_predictions4)./9929800*100;



figure(2)
hold on
plot(t_data,all_group,'b-o','LineWidth',3);
plot(t_data,group_1,'b-','LineWidth',3);
plot(t_data,group_2,'r-','LineWidth',3);
plot(t_data,group_3,'k-','LineWidth',3);
plot(t_data,group_4,'m-','LineWidth',3);
hold off
legend('All','G1','G2','G3','G4','fontsize',12)
box on
ylabel('Cumulative infections (%) ')
xlim([1 35])
 set(gca,'XTick',[1:4:35],'xticklabels',{'Aug 07, 2023','Sept 04','Oct 02','Oct 30','Dec 4','Jan 01, 2024','Jan 29','Feb 26','Mar 25'},'fontsize',12)

%% %% 
str = { 'Overall' , 'G1' , 'G2' , 'G3' , 'G4' };

Cum_Inf_per = [all_group(end); group_1(end); group_2(end); group_3(end);  group_4(end) ];
Cum_Inf = [sum(model_predictions); sum(model_predictions1); sum(model_predictions2); sum(model_predictions3); sum(model_predictions4)];
yy = [Cum_Inf_per, Cum_Inf];
figure(3)
yyaxis left
Per = bar((1:length(yy)),Cum_Inf_per, 'barwidth', 0.4);
ylabel( 'Cumulative infections (%)','fontsize',16)
yyaxis right
Total = bar((1:length(yy))+0.4,Cum_Inf, 'barwidth', 0.4);
ylabel( 'Cumulative infections','fontsize',16)
%xlabel( 'Groups','fontsize',16)
 %set(gca, 'XTick', 1:length(yy))
set(gca, 'XTickLabel' ,str, 'XTick' ,1:numel(str), 'FontSize' ,16)

%%  %%% Total deaths

death1 = sum(d(1) * y(:,13)) ;
death2 = sum(d(2) * y(:,14));
death3 = sum(d(3) * y(:,15));
death4 = sum(d(4) * y(:,16))./1.4 ;
hspi = sum(y(:,16))+sum(y(:,15))+sum(y(:,14))+sum(y(:,13));
death = death1+death2+death3+death4;


str = { 'Overall' , 'G1' , 'G2' , 'G3' , 'G4'};

Cum_deth_per = [death/sum(model_predictions)*100; death1/sum(model_predictions1)*100; death2/sum(model_predictions2)*100; death3/sum(model_predictions3)*100;death4/sum(model_predictions4)*100];
Cum_deth = [death; death1; death2; death3; death4];
Mor_deth = [death/51748738*100000; death1/5692400*100000; death2/23597000*100000; death3/12834000*100000; death4/9470000*100000];
yy = [Cum_deth_per, Cum_deth];

figure(4)
yyaxis left
Per = bar((1:length(yy)),Cum_deth_per, 'barwidth', 0.4);
ylabel( 'Case fatlity rate (%)','fontsize',16)
yyaxis right
Total = bar((1:length(yy))+0.4,Cum_deth, 'barwidth', 0.4);
ylabel( 'Cumulative deaths','fontsize',16)
%xlabel( 'Groups','fontsize',16)
 %set(gca, 'XTick', 1:length(yy))
set(gca, 'XTickLabel' ,str, 'XTick' ,1:numel(str), 'FontSize' ,16)


figure(6)
yyaxis left
Per = bar((1:length(yy)),Cum_deth_per, 'barwidth', 0.4);
ylabel( 'Case fatlity rate (%)','fontsize',16)
yyaxis right
Total = bar((1:length(yy))+0.4,Mor_deth, 'barwidth', 0.4);
ylabel( 'Mortality rate per 100,000 population','fontsize',16)
%xlabel( 'Groups','fontsize',16)
 %set(gca, 'XTick', 1:length(yy))
set(gca, 'XTickLabel' ,str, 'XTick' ,1:numel(str), 'FontSize' ,16)

% %%
% 
% figure(5)
% hold on
% plot(t_data,model_predictions,'r-o','LineWidth',3);
% plot(t_data,model_predictions1,'b-','LineWidth',3);
% plot(t_data,model_predictions2,'r-','LineWidth',3);
% plot(t_data,model_predictions3,'k-','LineWidth',3);
% plot(t_data,model_predictions4,'m-','LineWidth',3);
% box on
% hold off
% legend('All','1','2','3','4')
% 
% ylabel('Cases ')
% xlabel('Time')
% xlim([1 53])
% set(gca,'XTick',[1:4:53],'xticklabels',{'Sept 04, 2023','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18','Apr 15','May 13','Jun 10','July 08','Aug 05','Sept 02'},'fontsize',12)

% %%
% figure(1)
% subplot(3,3,1)
% hold on
% plot(t_data,y(:,1),'b-','LineWidth',3)
% plot(t_data,y(:,2),'r-','LineWidth',3)
% plot(t_data,y(:,3),'k-','LineWidth',3)
% plot(t_data,y(:,4),'m-','LineWidth',3)
% box on
% legend('1','2','3','4')
% ylabel('S')
% xlim([1 53])
% set(gca,'XTick',[1:4:53],'xticklabels',{'Sept 04, 2023','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18','Apr 15','May 13','Jun 10','July 08','Aug 05','Sept 02'},'fontsize',16)
% 
% 
% 
% 
% 
% %%
% 
% subplot(3,3,2)
% hold on
% plot(t_data,y(:,5),'b-','LineWidth',3)
% plot(t_data,y(:,6),'r-','LineWidth',3)
% plot(t_data,y(:,7),'k-','LineWidth',3)
% plot(t_data,y(:,8)./3.9,'m-','LineWidth',3)
% box on
% legend('1','2','3','4')
% ylabel('E')
% xlim([1 53])
% set(gca,'XTick',[1:4:53],'xticklabels',{'Sept 04, 2023','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18','Apr 15','May 13','Jun 10','July 08','Aug 05','Sept 02'},'fontsize',16)
% 
% subplot(3,3,3)
% hold on
% plot(t_data,y(:,9),'b-','LineWidth',3)
% plot(t_data,y(:,10),'r-','LineWidth',3)
% plot(t_data,y(:,11),'k-','LineWidth',3)
% plot(t_data,y(:,12)./3.9,'m-','LineWidth',3)
% 
% box on
% legend('1','2','3','4')
% ylabel('I')
% xlim([1 53])
% set(gca,'XTick',[1:4:53],'xticklabels',{'Sept 04, 2023','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18','Apr 15','May 13','Jun 10','July 08','Aug 05','Sept 02'},'fontsize',16)
% 
% 
% subplot(3,3,4)
% hold on
% plot(t_data,y(:,13),'b-','LineWidth',3)
% plot(t_data,y(:,14),'r-','LineWidth',3)
% plot(t_data,y(:,15),'k-','LineWidth',3)
% plot(t_data,y(:,16)./3.9,'m-','LineWidth',3)
% 
% box on
% legend('1','2','3','4')
% ylabel('H')
% xlim([1 53])
% set(gca,'XTick',[1:4:53],'xticklabels',{'Sept 04, 2023','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18','Apr 15','May 13','Jun 10','July 08','Aug 05','Sept 02'},'fontsize',16)
% 
% subplot(3,3,5)
% hold on
% plot(t_data,y(:,17),'b-','LineWidth',3)
% plot(t_data,y(:,18),'r-','LineWidth',3)
% plot(t_data,y(:,19),'k-','LineWidth',3)
% plot(t_data,y(:,20)./2.35,'m-','LineWidth',3)
% 
% box on
% legend('1','2','3','4')
% ylabel('A')
% xlim([1 53])
% set(gca,'XTick',[1:4:53],'xticklabels',{'Sept 04, 2023','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18','Apr 15','May 13','Jun 10','July 08','Aug 05','Sept 02'},'fontsize',16)
% 
% subplot(3,3,6)
% hold on
% plot(t_data,y(:,21),'b-','LineWidth',3)
% plot(t_data,y(:,22),'r-','LineWidth',3)
% plot(t_data,y(:,23),'k-','LineWidth',3)
% plot(t_data,y(:,24)./2.35,'m-','LineWidth',3)
% 
% box on
% legend('1','2','3','4')
% ylabel('R')
% xlim([1 53])
% set(gca,'XTick',[1:4:53],'xticklabels',{'Sept 04, 2023','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18','Apr 15','May 13','Jun 10','July 08','Aug 05','Sept 02'},'fontsize',16)
% 
% 
% subplot(3,3,7)
% hold on
% plot(t_data,y(:,25),'b-','LineWidth',3)
% plot(t_data,y(:,26),'r-','LineWidth',3)
% plot(t_data,y(:,27),'k-','LineWidth',3)
% plot(t_data,y(:,28),'m-','LineWidth',3)
% 
% box on
% legend('1','2','3','4')
% ylabel('U')
% xlim([1 53])
% set(gca,'XTick',[1:4:53],'xticklabels',{'Sept 04, 2023','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18','Apr 15','May 13','Jun 10','July 08','Aug 05','Sept 02'},'fontsize',16)
% 
% subplot(3,3,8)
% hold on
% plot(t_data,y(:,29),'b-','LineWidth',3)
% plot(t_data,y(:,30),'r-','LineWidth',3)
% plot(t_data,y(:,31),'k-','LineWidth',3)
% plot(t_data,y(:,32),'m-','LineWidth',3)
% 
% box on
% legend('1','2','3','4')
% ylabel('V')
% xlim([1 53])
% set(gca,'XTick',[1:4:53],'xticklabels',{'Sept 04, 2023','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18','Apr 15','May 13','Jun 10','July 08','Aug 05','Sept 02'},'fontsize',16)
% %title(['Total Protected: ',num2str(Total_P(end))])
% 
% subplot(3,3,9)
% hold on
% plot(t_data,y(:,33),'b-','LineWidth',3)
% plot(t_data,y(:,34),'r-','LineWidth',3)
% plot(t_data,y(:,35),'k-','LineWidth',3)
% plot(t_data,y(:,36),'m-','LineWidth',3)
% 
% box on
% legend('1','2','3','4')
% ylabel('P')
% xlim([1 53])
% set(gca,'XTick',[1:4:53],'xticklabels',{'Sept 04, 2023','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18','Apr 15','May 13','Jun 10','July 08','Aug 05','Sept 02'},'fontsize',16)
% %title(['Total vaccine used: ',num2str(Total_V1(end))])
% 
% %%

