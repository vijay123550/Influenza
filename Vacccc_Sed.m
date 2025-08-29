clc
clear all;
close all;



Vaccine = xlsread('Vaccination.xlsx'); 



 t_data = linspace(1,52,52);
 
 u1base = cumsum(Vaccine(:,1)*1e06)./5127904*100;

 
 u2base = cumsum(Vaccine(:,3)*1e06);
 
 

 u4base = cumsum(Vaccine(:,5)*1e06)./9766851*100;

%%
 figure(1)
plot(t_data(3:35),u1base(3:35),'b-','LineWidth',2)
xlim([3 35])
ylim([0 80])
ylabel('Coverage % in G1' )
set(gca,'XTick',[3:4:35],'xticklabels',{'Sept 18','Oct 16','Nov 13','Dec 11','Jan 8','Feb 5','Mar 4','Apr 1','Apr 29'},'fontsize',16)
box on





 figure(2)
plot(t_data(5:35),u4base(5:35),'b-','LineWidth',2)
xlim([5 35])
ylim([0 90])
ylabel('Coverage % in G4')
set(gca,'XTick',[0:10:90],'xticklabels',{'0, 10','20','30','40','50','60','70','80','90'},'fontsize',16)
set(gca,'XTick',[5:4:35],'xticklabels',{'Oct 02','Oct 30','Nov 27','Dec 25','Jan 22','Feb 19','Mar 18','Apr 15'},'fontsize',16)
box on

