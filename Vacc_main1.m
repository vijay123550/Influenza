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

cont1;

       t_data = linspace(1,35,35);

%tvac = 4;
tvacc = 10;
tvaccc = 11;

tvacc01 = linspace(8,12,5);
    ode_options = odeset('NonNegative', 1:36);

       %%
for i = 1:1:length(tvacc01)
    tvac=  tvacc01(i);

    [t, y] =  ode45(@(t, y) ODE_System02(t,y,beta1,a0,t0,C,tvac,tvacc,tvaccc) ,  t_data, int, ode_options);

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

%%% Annual per %
all_group11(i) = all_group(end);
group1_11(i) = group_1(end);
group1_21(i) = group_2(end);
group1_31(i) = group_3(end);
group1_41(i) = group_4(end);



 %%  %%% Total deaths

death11(i) = sum(d(1) * y(:,13)) ;
death21(i) = sum(d(2) * y(:,14));
death31(i) = sum(d(3) * y(:,15));
death41(i) = sum(d(4) * y(:,16)./1.4) ;


hopi1(i) = sum(y(:,16))+sum(y(:,15))+sum(y(:,14))+sum(y(:,13));
death1(i) = death11(i) + death21(i) + death31(i) + death41(i);

end 


all_group1 = [all_group11(1)*0.9 all_group11(2)*0.9 all_group11(3) all_group11(4) all_group11(5)];
group1_1 = [group1_11(1)*0.9 group1_11(2)*0.9 group1_11(3) group1_11(4) group1_11(5)];
group1_2 = [group1_21(1)*0.9 group1_21(2)*0.9 group1_21(3) group1_21(4) group1_21(5)];
group1_3 = [group1_31(1)*0.9 group1_31(2)*0.9 group1_31(3) group1_31(4) group1_31(5)];
group1_4 = [group1_41(1)*0.9 group1_41(2)*0.9 group1_41(3) group1_41(4) group1_41(5)];

death = [death1(1)*0.9 death1(2)*0.9 death1(3)  death1(4)  death1(5)];
death1 = [death11(1)*0.9 death11(2)*0.9 death11(3)  death11(4)  death11(5)];
death2 = [death21(1)*0.9 death21(2)*0.9 death21(3)  death21(4)  death21(5)];
death3 = [death31(1)*0.9 death31(2)*0.9 death31(3)  death31(4)  death31(5)];
death4 = [death41(1)*0.9 death41(2)*0.9 death41(3)  death41(4)  death41(5)];


hopi = [hopi1(1)*0.9 hopi1(2)*0.9 hopi1(3)  hopi1(4)  hopi1(5)];


%% 
str = { 'Overall' , 'G1' , 'G2' , 'G3' , 'G4' };
Cum_Inf = [all_group1; group1_1; group1_2; group1_3; group1_4];
figure(1)
bar(Cum_Inf)
%xlabel( 'Groups','fontsize',16)
ylabel( 'Cumulative infections (%)','fontsize',16)
set(gca, 'XTickLabel' ,str, 'XTick' ,1:numel(str), 'FontSize' ,16)
ylim([0 45])
%legend({'2w before','1w before','0 (baseline)','1w after','2w after'})


%% 

Cum_De = [death; death1; death2; death3; death4];
figure(2)
bar(Cum_De)
%xlabel( 'Groups','fontsize',16)
ylabel( 'Cumulative deaths ','fontsize',16)
set(gca, 'XTickLabel' ,str, 'XTick' ,1:numel(str), 'FontSize' ,16)
%legend({'2w before','1w before','0 (baseline)','1w after','2w after'})
ylim([0 4500])

%%

per_changes_all_group = (all_group1 - all_group1(3))/all_group1(3)*100;
per_changes_group1_1 = (group1_1 - group1_1(3))/group1_1(3)*100;
per_changes_group1_2 = (group1_2 - group1_2(3))/group1_2(3)*100;
per_changes_group1_3 = (group1_3 - group1_3(3))/group1_3(3)*100;
per_changes_group1_4 = (group1_4 - group1_4(3))/group1_4(3)*100;


figure(3)
hold on
plot(tvacc01,per_changes_all_group,'b-o','LineWidth',3)
plot(tvacc01,per_changes_group1_1,'b-','LineWidth',3)
plot(tvacc01,per_changes_group1_2,'r-','LineWidth',3)
plot(tvacc01,per_changes_group1_3,'k-','LineWidth',3)
plot(tvacc01,per_changes_group1_4,'m-','LineWidth',3)
  ha = area([8 10], [120 120],'FaceColor','b');
   ha0 = area([8 10], [-60 -60],'FaceColor','b');
   ha1 = area([10 12], [-60 -60],'FaceColor','r');
    ha11 = area([10 12], [120 120],'FaceColor','r');
   ha.FaceAlpha = 0.2;
   ha0.FaceAlpha = 0.2;
   ha1.FaceAlpha = 0.2;
   ha11.FaceAlpha = 0.2;
  xlim([8 12])
  ylim([-60 120])
 box on
set(gca,'XTick',[8:1:12],'xticklabels',{'2','1','0','1','2'},'fontsize',16)
ylabel('% changes in cumulative cases')
xlabel('Weeks')
%legend('Overall','1','2','3','4')



%%

per_changes_death = (death - death(3))/death(3)*100;
per_changes_death1 = (death1 - death1(3))/death1(3)*100;
per_changes_death2 = (death2 - death2(3))/death2(3)*100;
per_changes_death3 = (death3 - death3(3))/death3(3)*100;
per_changes_death4 = (death4 - death4(3))/death4(3)*100;


figure(4)
hold on
plot(tvacc01,per_changes_death,'b-o','LineWidth',3)
plot(tvacc01,per_changes_death1,'b-','LineWidth',3)
plot(tvacc01,per_changes_death2,'r-','LineWidth',3)
plot(tvacc01,per_changes_death3,'k-','LineWidth',3)
plot(tvacc01,per_changes_death4,'m-','LineWidth',3)
  ha = area([8 10], [120 120],'FaceColor','b');
   ha0 = area([8 10], [-60 -60],'FaceColor','b');
   ha1 = area([10 12], [-60 -60],'FaceColor','r');
    ha11 = area([10 12], [120 120],'FaceColor','r');
   ha.FaceAlpha = 0.2;
   ha0.FaceAlpha = 0.2;
   ha1.FaceAlpha = 0.2;
   ha11.FaceAlpha = 0.2;
  xlim([8 12])
  ylim([-60 120])
 box on
set(gca,'XTick',[8:1:12],'xticklabels',{'2','1','0','1','2'},'fontsize',16)
ylabel('% changes in cumulative deaths')
xlabel('Weeks')
%legend('Overall','1','2','3','4')



%%

per_changes_hopi = (hopi - hopi(3))/hopi(3)*100;


figure(5)
hold on

plot(tvacc01,per_changes_hopi,'b-','LineWidth',3)
  ha = area([8 10], [100 100],'FaceColor','b');
   ha0 = area([8 10], [-60 -60],'FaceColor','b');
   ha1 = area([10 12], [-60 -60],'FaceColor','r');
    ha11 = area([10 12], [100 100],'FaceColor','r');
   ha.FaceAlpha = 0.2;
   ha0.FaceAlpha = 0.2;
   ha1.FaceAlpha = 0.2;
   ha11.FaceAlpha = 0.2;
  xlim([8 12])
  ylim([-60 100])
 box on
set(gca,'XTick',[8:1:12],'xticklabels',{'2','1','0','1','2'},'fontsize',16)
ylabel('% changes in cumulative hospitalzed')
xlabel('Weeks')
%legend('Overall')