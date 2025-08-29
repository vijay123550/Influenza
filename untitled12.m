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
beta1  = [5.0991    0.1660    0.1003    0.2143];
       a0 =  0.6702;
      
       t0 = 15;

cont1;

       t_data = linspace(1,52,52);
%tvacc = 5;

tvacc01 = linspace(2,6,5);


       %%
    ode_options = odeset('NonNegative', 1:36);
for i = 1:1:length(tvacc01)
    tvacc0=  tvacc01(i);
    [t, y] =  ode45(@(t, y) ODE_System01(t,y,beta1,a0,t0,C,tvacc0) ,  t_data, int, ode_options);



    %%
Total_E = y(:,5) + y(:,6) + y(:,7) + y(:,8);
   model_predictions = (q*kappa*Total_E);
     model_predictions1 = q*kappa*y(:,5);
     model_predictions2 = q*kappa*y(:,6);
     model_predictions3 = q*kappa*y(:,7);
     model_predictions4 = q*kappa*y(:,8);

%%% cumulative %
all_group = cumsum(model_predictions)/51748738*100;
group_1 = cumsum(model_predictions1)./5692400*100;
group_2 = cumsum(model_predictions2)./23597000*100;
group_3 = cumsum(model_predictions3)./12834000*100;
group_4 = cumsum(model_predictions4)./11470000*100;

%%% Annual per %
all_group1(i) = all_group(end);
group1_1(i) = group_1(end);
group1_2(i) = group_2(end);
group1_3(i) = group_3(end);
group1_4(i) = group_4(end)./2.35;

%%  %%% Total deaths

death1(i) = sum(d(1) * y(:,13)) ;
death2(i) = sum(d(2) * y(:,14));
death3(i) = sum(d(3) * y(:,15));
death4(i) = sum(d(4) * y(:,16)./1.7) ;


hopi(i) = sum(y(:,16))+sum(y(:,15))+sum(y(:,14))+sum(y(:,13));
death(i) = death1(i) + death2(i) + death3(i) + death4(i);

end 




%% 
str = { 'All' , '1' , '2' , '3' , '4' };
Cum_Inf = [all_group1; group1_1; group1_2; group1_3; group1_4];
figure(1)
bar(Cum_Inf)
xlabel( 'Groups','fontsize',16)
ylabel( 'cumulative infections (%)','fontsize',16)
set(gca, 'XTickLabel' ,str, 'XTick' ,1:numel(str), 'FontSize' ,16)
legend({'2w before','1w before','0 (baseline)','1w after','2w after'})


%% 

Cum_De = [death; death1; death2; death3; death4];
figure(2)
bar(Cum_De)
xlabel( 'Groups','fontsize',16)
ylabel( 'Cumulative deaths ','fontsize',16)
set(gca, 'XTickLabel' ,str, 'XTick' ,1:numel(str), 'FontSize' ,16)
legend({'2w before','1w before','0 (baseline)','1w after','2w after'})


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
   ha = area([2 4], [100 100],'FaceColor','b');
   ha0 = area([2 4], [-50 -50],'FaceColor','b');
   ha1 = area([4 6], [-50 -50],'FaceColor','r');
    ha11 = area([4 6], [100 100],'FaceColor','r');
   ha.FaceAlpha = 0.2;
   ha0.FaceAlpha = 0.2;
   ha1.FaceAlpha = 0.2;
   ha11.FaceAlpha = 0.2;
  xlim([2 6])
  ylim([-50 100])
 box on
set(gca,'XTick',[2:1:6],'xticklabels',{'2','1','0','1','2'},'fontsize',16)
ylabel('% changes in cumulative cases')
xlabel('Weeks')
legend('Overall','1','2','3','4')



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
   ha = area([2 4], [100 100],'FaceColor','b');
   ha0 = area([2 4], [-50 -50],'FaceColor','b');
   ha1 = area([4 6], [-50 -50],'FaceColor','r');
    ha11 = area([4 6], [100 100],'FaceColor','r');
   ha.FaceAlpha = 0.2;
   ha0.FaceAlpha = 0.2;
   ha1.FaceAlpha = 0.2;
   ha11.FaceAlpha = 0.2;
  xlim([2 6])
  ylim([-50 100])
 box on
set(gca,'XTick',[2:1:6],'xticklabels',{'2','1','0','1','2'},'fontsize',16)
ylabel('% changes in cumulative deaths')
xlabel('Weeks')
legend('Overall','1','2','3','4')



%%

per_changes_hopi = (hopi - hopi(3))/hopi(3)*100;



figure(5)
hold on

plot(tvacc01,per_changes_hopi,'b-','LineWidth',3)
  ha = area([2 4], [100 100],'FaceColor','b');
  ha0 = area([2 4], [-40 -40],'FaceColor','b');
  ha1 = area([4 6], [-40 -40],'FaceColor','r');
   ha11 = area([4 6], [100 100],'FaceColor','r');
  ha.FaceAlpha = 0.2;
  ha0.FaceAlpha = 0.2;
 ha1.FaceAlpha = 0.2;
  ha11.FaceAlpha = 0.2;
 xlim([2 6])
 ylim([-40 100])
 box on
set(gca,'XTick',[2:1:6],'xticklabels',{'2','1','0','1','2'},'fontsize',16)
ylabel('% changes in cumulative hospitalzed')
xlabel('Weeks')
legend('Overall')