clc
clear all;
close all;



Vaccine = xlsread('Vaccination.xlsx'); 



 t_data = linspace(1,35,35);
 
 u1base = Vaccine(:,1)*1e06;
 u1alter2 = Vaccine(:,2)*1e06;
 
 u2base = Vaccine(:,3)*1e06;
 u2alter2 = Vaccine(:,4)*1e06;
 

 u4base = Vaccine(:,5)*1e06;
 u4alter1 = Vaccine(:,6)*1e06;
  u4alter2 = Vaccine(:,7)*1e06;


figure

subplot(2,2,1)
hold on
plot(t_data,u1base,'b-','LineWidth',2)
plot(t_data,u1alter2,'c-','LineWidth',2)
xlim([1 36])
ylabel('Vaccination rate in G1 (u_1)' )
set(gca,'XTick',[1:4:36],'xticklabels',{'Aug 07,2023','Spet 04','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18'},'fontsize',16)
legend('Baseline','Scenario-2')
box on



subplot(2,2,2)
hold on
plot(t_data,u2base,'b-','LineWidth',2)
plot(t_data,u2alter2,'c-','LineWidth',2)
xlim([1 36])
ylabel('Vaccination rate in G2 (u_2)' )
set(gca,'XTick',[1:4:36],'xticklabels',{'Aug 07,2023','Spet 04','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18'},'fontsize',16)
legend('Baseline','Scenario-2')
box on


subplot(2,2,3)
hold on
plot(t_data,u4base,'b-','LineWidth',2)
plot(t_data,u4alter1,'r-','LineWidth',2)
plot(t_data,u4alter2,'c-','LineWidth',2)
xlim([1 36])
ylabel('Vaccination rate in G4 (u_4)')
set(gca,'XTick',[1:4:36],'xticklabels',{'Aug 07,2023','Spet 04','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18'},'fontsize',16)
legend('Baseline','Scenario-1','Scenario-2')
box on

subplot(2,2,4)
hold on
plot(t_data,u1base+u2base+u4base,'b-','LineWidth',2)
plot(t_data,u1base+u2base+u4alter1,'r-','LineWidth',2)
plot(t_data,u1alter2+u2alter2+u4alter2,'c-','LineWidth',2)
xlim([1 36])
ylabel('Total Vaccination rate')
set(gca,'XTick',[1:4:36],'xticklabels',{'Aug 07,2023','Spet 04','Oct 02','Oct 30','Nov 27','Dec 25','Jan 22, 2024','Feb 19','Mar 18'},'fontsize',16)
legend('Baseline','Scenario-1','Scenario-2')
box on
