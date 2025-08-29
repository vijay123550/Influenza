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




    ode_options = odeset('NonNegative', 1:36);

tvacc0 = linspace(10,12,3);
for i = 1:1:length(tvacc0)
    t_vacc_S0=  tvacc0(i);


    %t_vacc_S0 = 10;
tvac = t_vacc_S0;
tvacc = t_vacc_S0;
tvaccc = t_vacc_S0+1;
    [t, y0] =  ode45(@(t, y) ODE_System02(t,y,beta1,a0,t0,C,tvac,tvacc,tvaccc) ,  t_data, int, ode_options);

  %%
Total_E = y0(:,5) + y0(:,6) + y0(:,7) + y0(:,8);
  model_predictions1 = q*kappa*y0(:,5).*1.57;
     model_predictions2 = q*kappa*y0(:,6).*0.965;
     model_predictions3 = q*kappa*y0(:,7).*1.325;
     model_predictions4 = q*kappa*y0(:,8)./3.41;
     model_predictions = model_predictions1+model_predictions2+model_predictions3+model_predictions4;

%%% cumulative %
all_group = cumsum(model_predictions)/51717590*100;
group_1 = cumsum(model_predictions1)./5533800*100;
group_2 = cumsum(model_predictions2)./23428000*100;
group_3 = cumsum(model_predictions3)./12826000*100;
group_4 = cumsum(model_predictions4)./9929800*100;

%%% Annual per %
all_group10(i) = all_group(end);
group1_10(i) = group_1(end);
group1_20(i) = group_2(end);
group1_30(i) = group_3(end);
group1_40(i) = group_4(end);

%%  %%% Total deaths

death10 = sum(d(1) * y0(:,13)) ;
death20 = sum(d(2) * y0(:,14));
death30 = sum(d(3) * y0(:,15));
death40 = sum(d(4) * y0(:,16)./1.4) ;


hopi0(i) = sum(y0(:,16))+sum(y0(:,15))+sum(y0(:,14))+sum(y0(:,13));
death0(i) = death10 + death20 + death30 + death40;

end


%%

tvacc1 = linspace(10,12,3);
for i = 1:1:length(tvacc1)
    t_vacc_S1=  tvacc1(i);
%t_vacc_S1 = 10;

tvac = t_vacc_S1;
tvacc = t_vacc_S1;
tvaccc = t_vacc_S1;
    [t, y1] =  ode45(@(t, y) ODE_System02(t,y,beta1,a0,t0,C,tvac,tvacc,tvaccc) ,  t_data, int, ode_options);

  %%
Total_E = y1(:,5) + y1(:,6) + y1(:,7) + y1(:,8);
   model_predictions1 = q*kappa*y1(:,5).*1.57;
     model_predictions2 = q*kappa*y1(:,6).*0.965;
     model_predictions3 = q*kappa*y1(:,7).*1.325;
     model_predictions4 = q*kappa*y1(:,8)./3.41;
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

death11 = sum(d(1) * y1(:,13)) ;
death21 = sum(d(2) * y1(:,14));
death31 = sum(d(3) * y1(:,15));
death41 = sum(d(4) * y1(:,16)./1.4) ;


hopi1(i) = sum(y1(:,16))+sum(y1(:,15))+sum(y1(:,14))+sum(y1(:,13));
death1(i) = death11 + death21 + death31 + death41;

end

%%

tvacc2 = linspace(9,11,3);
for i = 1:1:length(tvacc2)
    t_vacc_S2=  tvacc2(i);
%t_vacc_S2 = 9;

tvac = t_vacc_S2+3;
tvacc = t_vacc_S2;
tvaccc = t_vacc_S2;
    [t, y2] =  ode45(@(t, y) ODE_System02(t,y,beta1,a0,t0,C,tvac,tvacc,tvaccc) ,  t_data, int, ode_options);

  %%
Total_E = y2(:,5) + y2(:,6) + y2(:,7) + y2(:,8);
   model_predictions1 = q*kappa*y2(:,5).*1.57;
     model_predictions2 = q*kappa*y2(:,6).*0.965;
     model_predictions3 = q*kappa*y2(:,7).*1.325;
     model_predictions4 = q*kappa*y2(:,8)./3.41;
     model_predictions = model_predictions1+model_predictions2+model_predictions3+model_predictions4;

%%% cumulative %
all_group = cumsum(model_predictions)/51717590*100;
group_1 = cumsum(model_predictions1)./5533800*100;
group_2 = cumsum(model_predictions2)./23428000*100;
group_3 = cumsum(model_predictions3)./12826000*100;
group_4 = cumsum(model_predictions4)./9929800*100;

%%% Annual per %
all_group12(i) = all_group(end);
group1_12(i) = group_1(end);
group1_22(i) = group_2(end);
group1_32(i) = group_3(end);
group1_42(i) = group_4(end);

%%  %%% Total deaths

death12 = sum(d(1) * y2(:,13)) ;
death22 = sum(d(2) * y2(:,14));
death32 = sum(d(3) * y2(:,15));
death42 = sum(d(4) * y2(:,16)./1.4) ;


hopi2(i) = sum(y2(:,16))+sum(y2(:,15))+sum(y2(:,14))+sum(y2(:,13));
death2(i) = death12 + death22 + death32 + death42;

end
% %% 
% str = { 'Overall' , 'G1' , 'G2' , 'G3' , 'G4' };
% Cum_Inf = [all_group10 all_group11 all_group12; group1_10 group1_11 group1_12; group1_20 group1_21 group1_22; group1_30 group1_31 group1_32; group1_40 group1_41 group1_42 ];
% figure(1)
% bar(Cum_Inf)
% %xlabel( 'Groups','fontsize',16)
% ylabel( 'Cumulative infections (%)','fontsize',16)
% set(gca, 'XTickLabel' ,str, 'XTick' ,1:numel(str), 'FontSize' ,16)
% legend({'S0','S1 ','S2 '})


%% 

% Cum_De = [death0 death1 death2; death10 death11 death12; death20 death21 death22; death30 death31 death32; death40 death41 death42];
% figure(2)
% bar(Cum_De)
% %xlabel( 'Groups','fontsize',16)
% ylabel( 'Cumulative deaths ','fontsize',16)
% set(gca, 'XTickLabel' ,str, 'XTick' ,1:numel(str), 'FontSize' ,16)
% legend({'S0','S1 ','S2 '})


% %%
% tvacc01 = linspace(1,3,3);
% 
% all_group1 = [all_group10; all_group11; all_group12];
% group1_1 = [group1_10; group1_11; group1_12];
% group1_2 = [group1_20; group1_21; group1_22];
% group1_3 = [group1_30; group1_31; group1_32];
% group1_4 = [group1_40; group1_41; group1_42];
% 
% 
% 
% per_changes_all_group = [(all_group10 - all_group10)/all_group10*100; -(all_group10 - all_group11)/all_group10*100; -(all_group10 - all_group12)/all_group10*100];
% per_changes_group1_1 = [(group1_10-group1_10)/group1_10*100; -(group1_10-group1_11)/group1_10*100; -(group1_10-group1_12)/group1_10*100];
% per_changes_group1_2 = [(group1_20-group1_20)/group1_20*100; -(group1_20-group1_21)/group1_20*100; -(group1_20-group1_22)/group1_20*100];
% per_changes_group1_3 = [(group1_30-group1_30)/group1_30*100; -(group1_30-group1_31)/group1_30*100; -(group1_30-group1_32)/group1_30*100];
% per_changes_group1_4 = [(group1_40-group1_40)/group1_40*100; -(group1_40-group1_41)/group1_40*100; -(group1_40-group1_42)/group1_40*100];
% 
% 
% 
% % 
% 
% %%
% death = [death0; death1; death2];
% death01 = [death10; death11 ; death12];
% death02 = [death20; death21 ; death22];
% death03 = [death30; death31 ; death32];
% death04 = [death40; death41 ; death42];
% 
% 
% 
% per_changes_death = (death - death(1))/death(1)*100;
% per_changes_death1 = (death01 - death01(1))/death01(1)*100;
% per_changes_death2 = (death02 - death02(1))/death02(1)*100;
% per_changes_death3 = (death03 - death03(1))/death03(1)*100;
% per_changes_death4 = (death04 - death04(1))/death04(1)*100;
% 
% 
% 
% % 
% %%
% hopi = [hopi0; hopi1 ; hopi2];
% per_changes_hopi = (hopi - hopi(1))/hopi(1)*100;
% 
% 
% 
% 
% 
% 
% %%
% figure(7)
% %Cum = [per_changes_death(1) per_changes_death1(1) per_changes_death2(1) per_changes_death3(1) per_changes_death4(1); per_changes_death(2) per_changes_death1(2) per_changes_death2(2) per_changes_death3(2) per_changes_death4(2); per_changes_death(3) per_changes_death1(3) per_changes_death2(3) per_changes_death3(3) per_changes_death4(3); ];
% Cum = [ per_changes_death(2) per_changes_death1(2) per_changes_death2(2) per_changes_death3(2) per_changes_death4(2); per_changes_death(3) per_changes_death1(3) per_changes_death2(3) per_changes_death3(3) per_changes_death4(3); ];
% bar(Cum)
% 
%  set(gca,'XAxisLocation', 'top','XTick',[1:1:3],'xticklabels',{'S1','S2'},'fontsize',16)
%  ylabel('% changes in cumulative deaths ','fontsize',16)
%  legend('Overall','G1','G2','G3','G4')
% 
% % legend('Overall','G1','G2','G3','G4')
% 
% 
% 
% figure(6)
%  %Cum_c = [per_changes_all_group(1) per_changes_group1_1(1) per_changes_group1_2(1) per_changes_group1_3(1) per_changes_group1_4(1); per_changes_all_group(2) per_changes_group1_1(2) per_changes_group1_2(2) per_changes_group1_3(2) per_changes_group1_4(2); per_changes_all_group(3) per_changes_group1_1(3) per_changes_group1_2(3) per_changes_group1_3(3) per_changes_group1_4(3); ];
%  Cum_c = [ per_changes_all_group(2) per_changes_group1_1(2) per_changes_group1_2(2) per_changes_group1_3(2) per_changes_group1_4(2); per_changes_all_group(3) per_changes_group1_1(3) per_changes_group1_2(3) per_changes_group1_3(3) per_changes_group1_4(3); ];
% bar(Cum_c)
% 
%  set(gca, 'XAxisLocation', 'top','XTick',[1:1:3],'xticklabels',{'S1','S2'},'fontsize',16)
%  ylabel('% changes in cumulative cases','fontsize',16)
% 
%  legend('Overall','G1','G2','G3','G4')


figure(7)
% %Cum = [per_changes_death(1) per_changes_death1(1) per_changes_death2(1) per_changes_death3(1) per_changes_death4(1); per_changes_death(2) per_changes_death1(2) per_changes_death2(2) per_changes_death3(2) per_changes_death4(2); per_changes_death(3) per_changes_death1(3) per_changes_death2(3) per_changes_death3(3) per_changes_death4(3); ];
% Cum = [ per_changes_death(2) per_changes_death1(2) per_changes_death2(2) per_changes_death3(2) per_changes_death4(2); per_changes_death(3) per_changes_death1(3) per_changes_death2(3) per_changes_death3(3) per_changes_death4(3); ];
% bar(Cum)
%

%%
yy0 = [all_group10; group1_10; group1_20; group1_30; group1_40];
yy1 = [all_group11; group1_11; group1_21; group1_31; group1_41];
yy2 = [all_group12; group1_12; group1_22; group1_32; group1_42];


subplot(1,3,1)
bar(yy0,'stacked')
set(gca, 'YTick',[0:20:120],'fontsize',16)

subplot(1,3,2)
bar(yy1,'stacked')
ylim([0 120])

subplot(1,3,3)
bar(yy2,'stacked')
ylim([0 120])