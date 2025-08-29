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


  

beta1  = [  4.1604    0.3042    0.1071    0.2720 ];
       a0 =  0.2866; 
       t0 = 22;
cont1;

       t_data = linspace(1,35,35);


 E0 =     [4351, 2384, 798, 496];
 I0 = 2*[10076, 6881, 1856, 1155];
 H0 = 0*ones(1,4);
 A0 =[4534, 2526, 831, 516];
U0 = 0*ones(1,4);
V0 = zeros(1,4);
P0 = zeros(1,4);



imu_level1 = [1 1.5 2.25];




for i = 1: length(imu_level1)


 R0 = imu_level1(i)*[1079096, 901842, 87651, 43329];
S0 = 517175*[10.7, 45.3, 24.8, 19.2] - E0 - R0 - I0 - A0;
int = [S0,E0,I0,H0, A0,R0,U0,V0,P0];

    ode_options = odeset('NonNegative', 1:36);

tvac = 10;
tvacc = 10;
tvaccc = 11;
    [t, y0] =  ode45(@(t, y) ODE_System02(t,y,beta1,a0,t0,C,tvac,tvacc,tvaccc) ,  t_data, int, ode_options);

  %%
Total_E = y0(:,5) + y0(:,6) + y0(:,7) + y0(:,8);
  model_predictions1 = q*kappa*y0(:,5).*1.57;
     model_predictions2 = q*kappa*y0(:,6).*0.965;
     model_predictions3 = q*kappa*y0(:,7).*1.325;
     model_predictions4 = q*kappa*y0(:,8)./3.41;
     model_predictions = model_predictions1+model_predictions2+model_predictions3+model_predictions4;
     model_predictions0(i,:)= model_predictions;

%%% cumulative %
all_group = cumsum(model_predictions)/51717590*100;

%%% Annual per %
all_group10(i) = all_group(end);

%%  %%% Total deaths

death10 = sum(d(1) * y0(:,13)) ;
death20 = sum(d(2) * y0(:,14));
death30 = sum(d(3) * y0(:,15));
death40 = sum(d(4) * y0(:,16)./1.4) ;


hopi0 = y0(:,16)./1.4+y0(:,15)+y0(:,14)+y0(:,13);
hopit0(i,:)  = hopi0;
death0(i) = death10 + death20 + death30 + death40;



%%




tvac = 10;
tvacc = 10;
tvaccc = 10;
    [t, y1] =  ode45(@(t, y) ODE_System02(t,y,beta1,a0,t0,C,tvac,tvacc,tvaccc) ,  t_data, int, ode_options);

  %%
Total_E = y1(:,5) + y1(:,6) + y1(:,7) + y1(:,8);
   model_predictions1 = q*kappa*y1(:,5).*1.57;
     model_predictions2 = q*kappa*y1(:,6).*0.965;
     model_predictions3 = q*kappa*y1(:,7).*1.325;
     model_predictions4 = q*kappa*y1(:,8)./3.41;
     model_predictions = model_predictions1+model_predictions2+model_predictions3+model_predictions4;
model_predictions01(i,:)= model_predictions;
%%% cumulative %
all_group = cumsum(model_predictions)/51717590*100;

%%% Annual per %
all_group11(i) = all_group(end);


%%  %%% Total deaths

death11 = sum(d(1) * y1(:,13)) ;
death21 = sum(d(2) * y1(:,14));
death31 = sum(d(3) * y1(:,15));
death41 = sum(d(4) * y1(:,16)./1.4) ;


hopi1 = y1(:,16)./1.4+y1(:,15)+y1(:,14)+y1(:,13);
hopit1(i,:)  = hopi1;
death1(i) = death11 + death21 + death31 + death41;



%%




tvac = 12;
tvacc = 9;
tvaccc = 9;
    [t, y2] =  ode45(@(t, y) ODE_System02(t,y,beta1,a0,t0,C,tvac,tvacc,tvaccc) ,  t_data, int, ode_options);

  %%
Total_E = y2(:,5) + y2(:,6) + y2(:,7) + y2(:,8);


   model_predictions1 = q*kappa*y2(:,5).*1.57;
     model_predictions2 = q*kappa*y2(:,6).*0.965;
     model_predictions3 = q*kappa*y2(:,7).*1.325;
     model_predictions4 = q*kappa*y2(:,8)./3.41;
     model_predictions = model_predictions1+model_predictions2+model_predictions3+model_predictions4;
model_predictions02(i,:)= model_predictions;
%%% cumulative %
all_group = cumsum(model_predictions)/51717590*100;


%%% Annual per %
all_group12(i) = all_group(end);

%%  %%% Total deaths

death12 = sum(d(1) * y2(:,13)) ;
death22 = sum(d(2) * y2(:,14));
death32 = sum(d(3) * y2(:,15));
death42 = sum(d(4) * y2(:,16)./1.4) ;


hopi2 = y2(:,16)./1.4+y2(:,15)+y2(:,14)+y2(:,13);
hopit2(i,:)  = hopi2;
death2(i) = death12 + death22 + death32 + death42;


end
 
%%
Cum_case = [all_group10(1), all_group10(2), all_group10(3) ; all_group11; all_group12];
Cum_death = [death0(1), death0(2), death0(3); death1; death2];
%%

xvalues = {'L1','L2','L3'};
yvalues = {'S0','S1','S2'};





figure(1)
h1 = heatmap(xvalues,yvalues,Cum_case);
colorbar off
h1.Title = '% cummulative cases';
h1.XLabel = 'Immunity Level';
h1.YLabel = 'Scenarios';
h1.FontSize = 16;

figure(2)
h2 =  heatmap(xvalues,yvalues,Cum_death);
colorbar off
h2.Title = 'cummulative deaths';
h2.XLabel = 'Immunity Level';
h2.YLabel = 'Scenarios';
h2.FontSize = 16;

%%
figure(3)
subplot(3,1,1)
plot(t_data,model_predictions0,'LineWidth',2)
legend('L1','L2','L3')
title('S0')
xlim([1 35])
set(gca, 'XTickLabel', [],'fontsize',16)



subplot(3,1,2)
plot(t_data,model_predictions01,'LineWidth',2)
title('S1')
xlim([1 35])
set(gca, 'XTickLabel', [],'fontsize',16)
ylabel('Influenza Cases','fontsize',16)



subplot(3,1,3)
plot(t_data,model_predictions02,'LineWidth',2)
title('S2')
xlim([1 35])
set(gca,'XTick',[0:5:35],'xticklabels',{'0','5','10','15','20','25','30','35'},'fontsize',16)
xlabel('Weeks','fontsize',16)


%%



 V0 = max(model_predictions0,[],2);
 idx0 = model_predictions0==V0; % logical indices
[~,col0] = find(idx0);


 V1 = max(model_predictions01,[],2);
 idx1 = model_predictions01==V1; % logical indices
[~,col1] = find(idx1);

 V2 = max(model_predictions02,[],2);
 idx2 = model_predictions02==V2; % logical indices
[~,col2] = find(idx2);

peak_matrix = [V0'; V1'; V2'];
peakposition_matrix = [col0'; col1'; col2'];

peak_reduction = (peak_matrix(1,1)-peak_matrix)./peak_matrix(1,1).*100;



figure(4)
h1 = heatmap(xvalues,yvalues,peak_matrix);
colorbar off
h1.Title = 'Peak of cases';
h1.XLabel = 'Immunity Level';
h1.YLabel = 'Scenarios';
h1.FontSize = 16;

figure(5)
h2 =  heatmap(xvalues,yvalues,peakposition_matrix);
colorbar off
h2.Title = 'Week of the peak';
h2.XLabel = 'Immunity Level';
h2.YLabel = 'Scenarios';
h2.FontSize = 16;

figure(6)
h2 =  heatmap(xvalues,yvalues,peak_reduction);
colorbar off
h2.Title = '% reduction in peak';
h2.XLabel = 'Immunity Level';
h2.YLabel = 'Scenarios';
h2.FontSize = 16;






%%
figure(7)
subplot(3,1,1)
plot(t_data,hopit0,'LineWidth',2)
yline(5000,'LineWidth',1)
legend('L1','L2','L3')
title('S0')
xlim([1 35])
set(gca, 'XTickLabel', [],'fontsize',16)



subplot(3,1,2)
plot(t_data,hopit1,'LineWidth',2)
yline(5000,'LineWidth',1)
title('S1')
xlim([1 35])
set(gca, 'XTickLabel', [],'fontsize',16)
ylabel('Hospitalized Cases','fontsize',16)



subplot(3,1,3)
plot(t_data,hopit2,'LineWidth',2)
yline(5000,'LineWidth',1)
title('S2')
xlim([1 35])
set(gca,'XTick',[0:5:35],'xticklabels',{'0','5','10','15','20','25','30','35'},'fontsize',16)
xlabel('Weeks','fontsize',16)


%%
aa = [hopit0(1,:); hopit1(1,:);  hopit2(1,:); hopit0(2,:); hopit1(2,:);  hopit2(2,:); hopit0(3,:); hopit1(3,:);  hopit2(3,:)] ;

threshold_hopi = 5000;

[xx,yy] = find(aa>threshold_hopi);
Duration  = sum(aa>threshold_hopi,2);



Duration_matrix =    [Duration(1), Duration(2), Duration(3);
                      Duration(4), Duration(5), Duration(6); 
                      Duration(7), Duration(8), Duration(9)]

figure(8)
scatter(yy,xx,'bo','MarkerFaceColor','b')


xlim([1 35])
ylim([1 9])
set(gca,'XTick',[0:5:35],'xticklabels',{'0','5','10','15','20','25','30','35'},'fontsize',16)
xlabel('Time (week)')
set(gca,'YTick',[1:1:9],'yticklabels',{'S0','S1','S2'},'fontsize',16)

box on

%%

%scatterhistogram(yy,xx)