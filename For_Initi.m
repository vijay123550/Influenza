clc;
clear all;
close all;





data = xlsread('Test_data.xlsx');


%data3=data(1:3,6);

 week_data=data(1:35,1);
  week_mon_data=data(1:8,3);
 month_data=data(1:8,4);
 data3 = data(1:11,5);
  data4 = data(1:3,6);




T_week =  linspace(1,35,35);
T_mon = linspace(1,8,8);
 

%%
figure(1)
plot(T_week,week_data,'b-','LineWidth',2);
 ylabel('Confirmed cases from Flunet data','fontsize',12)
 xlim([1 36])
 set(gca,'XTick',[1:4:36],'xticklabels',{'Aug 07, 2023','Sept 04','Oct 02','Oct 30','Dec 4','Jan 01, 2024','Jan 29','Feb 26','Mar 25'},'fontsize',12)


figure(2)
plot(T_mon,month_data,'r-','LineWidth',2);
 ylabel(' Cases from HIRA data','fontsize',12)
 set(gca,'XTick',[1:1:8],'xticklabels',{'Aug., 2023','Sept., 2023','Oct. 2023','Nov. 2023','Dec 2023','Jan 2024','Feb 2024','Mar 2024'},'fontsize',12)


figure(3)
yyaxis left
plot(T_mon,week_mon_data,'LineWidth',2);
 ylabel('Confirmed cases from Flunet data','fontsize',12)
yyaxis right
plot(T_mon,month_data,'LineWidth',2);
 ylabel(' Cases from HIRA data','fontsize',12)
 set(gca,'XTick',[1:1:8],'xticklabels',{'Aug., 2023','Sept., 2023','Oct. 2023','Nov. 2023','Dec 2023','Jan 2024','Feb 2024','Mar 2024'},'fontsize',12)


%%
figure(1)
plot(1:11,data3,'b-','LineWidth',2);
 ylabel('Confirmed cases from Flunet data','fontsize',12)
 xlim([1 11])
  ylim([1 200])
 set(gca,'XTick',[1:1:11],'xticklabels',{'July 03, 2023','July 10','July 17','July 24','July 31','Aug 07','Aug 14','Aug 21','Aug 28','Sept 04','Sept 11'},'fontsize',12)


%%
figure(2)
plot(1:3,data4,'b-','LineWidth',2);
 ylabel('Confirmed cases from HIRA data','fontsize',12)
 xlim([1 3])
  ylim([1 1400000])
 set(gca,'XTick',[1:1:3],'xticklabels',{'July 2023','Aug','Sept'},'fontsize',12)
