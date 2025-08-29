function Para_estimation1


clc;   % to clear the command window
clear all; % to clear the workspace
close all;   % to close the already open matlab figure

format long



%format long  % specifying higher precision
kappa = 1/1.9*7;
q = 2/3;

cont1;
Data_file1;   % to include the data
t_data = linspace(1,35,35);

Initial_Condition11; % to include the initial condition for the variables

 

                       
% Initial guess for  to be estimated  


%initial_para = [ 4.1684    0.2946    0.1055    0.2723    0.2868];

initial_para = [ 3.5114    0.59273    0.35928    0.14023    0.27405];

% 12.7645    0.2274    0.2522    0.2428    0.0059



options = optimset('Display','iter','TolX',1e-5,'MaxIter',3000,'MaxFunEvals',1e3); % To set the number of maximum iteration in the estimation process


%Use fminsearch to minimize the error function
para = fminsearch(@(para) error_function1(para, t_data,C), initial_para,options);



  

% Display the estimated value of parameters
disp('Optimal Parameters:');
disp(para);




