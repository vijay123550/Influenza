clc;
clear all;
close all;

%%

delta = 0.5;
eta = 1/6*7;
alpha = 1/6*7;

d = 7e-2*[ 0.0033, 0.02, 0.1, 0.56];

 kappa = 1/1.9*7;
q = 0.67;

Initial_Condition11;
  


beta1  = [  4.1604    0.3042    0.1071    0.2720 ];
       a0 =  0.2866; 
       t0 = 22;

cont1;

       t_data = linspace(1,35,35);




    ode_options = odeset('NonNegative', 1:36);

tvac = 12;
tvacc = 9;
tvaccc = 9;



tvac0 = 10;
tvacc0 = 10;
tvaccc0 = 11;

epsilon1 = 0.625;
New_Cov_1 = 69.5;

% epsilon4 = 0.478;
% New_Cov_4 = 82.5;

%%
epsilon_4 = linspace(0.4,0.9,51) ;
New_Cov_41 = linspace(40,90,51) ;



[X,Y] = meshgrid(New_Cov_41,epsilon_4);
%%

for i = 1: length(epsilon_4) 
    for j = 1: length(New_Cov_41) 
epsilon4 = epsilon_4(i);
New_Cov_4 = New_Cov_41(j);


    [t, y0] =  ode45(@(t, y) ODE_System02_Cov(t,y,beta1,a0,t0,C,tvac0,tvacc0,tvaccc0,epsilon1,epsilon4,New_Cov_1,New_Cov_4) ,  t_data, int, ode_options);
    [t, y1] =  ode45(@(t, y) ODE_System02_Cov(t,y,beta1,a0,t0,C,tvac,tvacc,tvaccc,epsilon1,epsilon4,New_Cov_1,New_Cov_4) ,  t_data, int, ode_options);

  %%
%Total_E = (sum(kappa.*q.*(y0(:,5) + y0(:,6) + y0(:,7) + y0(:,8))));
 


%% cumulative %
  model_predictions1 = q*kappa*y1(:,5).*1.57;
     model_predictions2 = q*kappa*y1(:,6).*0.965;
     model_predictions3 = q*kappa*y1(:,7).*1.325;
     model_predictions4 = q*kappa*y1(:,8)./3.41;
     model_predictions = model_predictions1+model_predictions2+model_predictions3+model_predictions4;

%%% cumulative %
all_group1 = cumsum(model_predictions)/51717590*100;
all_group(i,j) = all_group1(end);

death(i,j) = sum(d(1) * y1(:,13) + d(2) * y1(:,14) + d(3) * y1(:,15) + d(4) * y1(:,16)./1.4) ;






%%


%% cumulative %
  model_predictions1 = q*kappa*y0(:,5).*1.57;
     model_predictions2 = q*kappa*y0(:,6).*0.965;
     model_predictions3 = q*kappa*y0(:,7).*1.325;
     model_predictions4 = q*kappa*y0(:,8)./3.41;
     model_predictions = model_predictions1+model_predictions2+model_predictions3+model_predictions4;

%%% cumulative %
all_group01 = cumsum(model_predictions)/51717590*100;
all_group0(i,j) = all_group01(end);

death0(i,j) = sum(d(1) * y0(:,13) + d(2) * y0(:,14) + d(3) * y0(:,15) + d(4) * y0(:,16)./1.4) ;
    end
end

%%

figure(1)
pcolor(New_Cov_41,epsilon_4,all_group)
 hold on
 %shading interp
 colorbar
val = 4.8392;         % Value of Z to plot contour for
    tol = .06;         % numerical tolerance
    idxZval1 = (all_group <= val+tol) & (all_group >= val-tol);
    plot(X(idxZval1),Y(idxZval1),'r-','LineWidth',2)

 set(gca,'YTick',[0.4:0.1:0.90],'xticklabels',{'40', '50','60','70','80','90'},'fontsize',16)
 set(gca,'XTick',[40:10:90],'yticklabels',{'40', '50','60','70','80','90'},'fontsize',16)
   ylabel('Vaccination Effectiveness (in %)')
   xlabel('Vaccination Coverage in G4 (in %)')
      title('% cumulative cases' )


     %%
     con110 = log10(death);
figure(3)
pcolor(New_Cov_41,epsilon_4,con110)
 hold on
 %shading interp
 colorbar
val1 = 3.0582;         % Value of Z to plot contour for
    tol = .01;         % numerical tolerance

    idxZval2 = (con110 <= val1+tol) & (con110 >= val1-tol);
    plot(X(idxZval2),Y(idxZval2),'r-','LineWidth',2)

 set(gca,'YTick',[0.4:0.1:0.90],'xticklabels',{'40', '50','60','70','80','90'},'fontsize',16)
 set(gca,'XTick',[40:10:90],'yticklabels',{'40', '50','60','70','80','90'},'fontsize',16)
   ylabel('Vaccination Effectiveness (in %)')
   xlabel('Vaccination Coverage in G4 (in %)')
   title('Cumulative death in log scale' )



   %%

   figure(3)
pcolor(New_Cov_41,epsilon_4,(death0-death)/death*100)
