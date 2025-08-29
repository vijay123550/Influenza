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
%tvaccc = 5;
epsilon1 = 0.625;
New_Cov_1 = 69.5;
epsilon4 = 0.478;

t_vacc41 = linspace(7,11,5) ;
New_Cov_41 = linspace(40,90,51) ;
[X,Y] = meshgrid(New_Cov_41,t_vacc41);

for i = 1: length(t_vacc41) 
    for j = 1: length(New_Cov_41) 
tvaccc = t_vacc41(i);
New_Cov_4 = New_Cov_41(j);

    [t, y0] =  ode45(@(t, y) ODE_System02_Cov(t,y,beta1,a0,t0,C,tvac,tvacc,tvaccc,epsilon1,epsilon4,New_Cov_1,New_Cov_4) ,  t_data, int, ode_options);

  %%
%Total_E = (sum(kappa.*q.*(y0(:,5) + y0(:,6) + y0(:,7) + y0(:,8))));
 


%%% cumulative %
  model_predictions1 = q*kappa*y(:,5).*1.57;
     model_predictions2 = q*kappa*y(:,6).*0.965;
     model_predictions3 = q*kappa*y(:,7).*1.325;
     model_predictions4 = q*kappa*y(:,8)./3.41;
     model_predictions = model_predictions1+model_predictions2+model_predictions3+model_predictions4;

%%% cumulative %
all_group1 = cumsum(model_predictions)/51717590*100;
all_group(i,j) = all_group1(end);
%%%%% Total deaths
death(i,j) = sum(d(1) * y0(:,13) + d(2) * y0(:,14) + d(3) * y0(:,15) + d(4) * y0(:,16)./1.4) ;
hopi(i,j) = sum(y0(:,16))+sum(y0(:,15))+sum(y0(:,14))+sum(y0(:,13)./3.9);

    end
end

%%

figure(1)
pcolor(New_Cov_41,t_vacc41,all_group)
 hold on
 %shading interp
 colorbar
val = 4.75;         % Value of Z to plot contour for
    tol = .6;         % numerical tolerance
    idxZval1 = (all_group <= val+tol) & (all_group >= val-tol);
    plot(X(idxZval1),Y(idxZval1),'r-','LineWidth',2)

 set(gca,'YTick',[7:1:11],'yticklabels',{'2', '1','0','1','2'},'fontsize',16)
 set(gca,'XTick',[40:10:90],'xticklabels',{'40', '50','60','70','80','90'},'fontsize',16)
  ylabel('Timing (weeks)')
  xlabel('Vaccination Coverage in G4 (in %)')
     title('% cumulative cases' )


     %%
     con110 = log10(death);
figure(3)
pcolor(New_Cov_41,t_vacc41, con110)
 hold on
 %shading interp
 colorbar
val = 3.0582;         % Value of Z to plot contour for
    tol = .05;         % numerical tolerance
    idxZval1 = ( con110 <= val+tol) & ( con110 >= val-tol);
    plot(X(idxZval1),Y(idxZval1),'r-','LineWidth',2)

 set(gca,'YTick',[7:1:11],'yticklabels',{'2', '1','0','1','2'},'fontsize',16)
 set(gca,'XTick',[40:10:90],'xticklabels',{'40', '50','60','70','80','90'},'fontsize',16)
  ylabel('Timing (weeks)')
  xlabel('Vaccination Coverage in G4 (in %)')
   title('Cumulative death in log scale' )
