function DY = ODE_System02_Cov(t,X,beta1,a0,t0,C,tvac,tvacc,tvaccc,epsilon1,epsilon4,New_Cov_1,New_Cov_4) 

delta = 0.5;
kappa = 1/1.9*7;
q = 0.67;
eta = 1/6*7;
alpha =  1/6*7;
omega = 1/10*7;
rho = 1/1*7;
qh = [0.011 0.010 0.018 0.04];
sigma = [0.2077 0.215 0.21 0.1865]*7 ;
d = 7e-2*[ 0.0033, 0.02, 0.1, 0.56];

epsilon =[ epsilon1, 0.54, 0.54, epsilon4];
%epsilon1 = 0.625;
%epsilon4 = 0.478;


if t < tvac+25
        gamma1 =0 ;
        else
            gamma1 = 1/180*7;   
end

if t < tvacc+25
        gamma2 =0 ;
        else
            gamma2 = 1/180*7;   
end


if t < tvaccc+25
        gamma4 =0 ;
        else
            gamma4 = 1/180*7;   
end



Pre_Cov_1 = 69.5;
Pre_Cov_4 = 82.5;



if t < tvac
        u(1) = 0;  
          elseif (t >= tvac) && (t < tvac+1)
      u(1) = New_Cov_1/Pre_Cov_1*0.57e6;   
        elseif (t >= tvac+1) && (t < tvac+2)
      u(1) = New_Cov_1/Pre_Cov_1*0.75e6;   
         elseif (t >= tvac+2) && (t < tvac+3)
      u(1) = New_Cov_1/Pre_Cov_1*0.6e6;  
       elseif (t >= tvac+3) && (t < tvac+4)
      u(1) = New_Cov_1/Pre_Cov_1*0.41e6; 
       elseif (t >= tvac+4) && (t < tvac+5)
      u(1) = New_Cov_1/Pre_Cov_1*0.29e6;  
       elseif (t >= tvac+5) && (t < tvac+6)
      u(1) = New_Cov_1/Pre_Cov_1*0.21e6; 
      elseif (t >= tvac+6) && (t < tvac+7)
      u(1) = New_Cov_1/Pre_Cov_1*0.18e6; 
      elseif (t >= tvac+7) && (t < tvac+8)
      u(1) = New_Cov_1/Pre_Cov_1*0.17e6; 
      elseif (t >= tvac+8) && (t < tvac+9)
      u(1) = New_Cov_1/Pre_Cov_1*0.11e6;  
      elseif (t >= tvac+9) && (t < tvac+10)
      u(1) = New_Cov_1/Pre_Cov_1*0.1e6;  
      elseif (t >= tvac+10) && (t < tvac+11)
      u(1) = New_Cov_1/Pre_Cov_1*0.057e6;  
      elseif (t >= tvac+11) && (t < tvac+12)
      u(1) = New_Cov_1/Pre_Cov_1*0.05e6; 
      elseif (t >= tvac+12) && (t < tvac+13)
      u(1) = 0.05e6;  
      elseif (t >= tvac+13) && (t < tvac+14)
      u(1) = New_Cov_1/Pre_Cov_1*0.02e6;  
       elseif (t >= tvac+14) && (t < tvac+15)
      u(1) = New_Cov_1/Pre_Cov_1*0.04e6;  
        else
            u(1) = 0;
end


if t < tvacc
       u(2) = 0; u(3) = 0;  
          elseif (t >= tvacc) && (t < tvacc+1)
       u(2) = 0.0266e6; u(3) = 0;   
        elseif (t >= tvacc+1) && (t < tvacc+2)
    u(2) = 0.0266e6; u(3) = 0;   
         elseif (t >= tvacc+2) && (t < tvacc+3)
       u(2) =  0.0266e6; u(3) = 0;  
       elseif (t >= tvacc+3) && (t < tvacc+4)
    u(2) = 0.0266e6; u(3) = 0; 
       elseif (t >= tvacc+4) && (t < tvacc+5)
       u(2) =  0.0266e6; u(3) = 0;    
        else
           u(2) = 0; u(3) = 0;   
end



if t < tvaccc
          u(4) = 0;  
       elseif (t >= tvaccc) && (t < tvaccc+1)
       u(4) = New_Cov_4/Pre_Cov_4*2.4e6;
       elseif (t >= tvaccc+1) && (t < tvaccc+2)
       u(4) = New_Cov_4/Pre_Cov_4*2.8e6;
       elseif (t >= tvaccc+2) && (t < tvaccc+3)
       u(4) = New_Cov_4/Pre_Cov_4*1.25e6;
      elseif (t >= tvaccc+3) && (t < tvaccc+4)
       u(4) = New_Cov_4/Pre_Cov_4*0.49e6;
      elseif (t >= tvaccc+4) && (t < tvaccc+5)
       u(4) = New_Cov_4/Pre_Cov_4*0.3e6;
      elseif (t >= tvaccc+5) && (t < tvaccc+6)
       u(4) = New_Cov_4/Pre_Cov_4*0.25e6;
      elseif (t >= tvaccc+6) && (t < tvaccc+7)
      u(4) = New_Cov_4/Pre_Cov_4*0.15e6;
      elseif (t >= tvaccc+7) && (t < tvaccc+8)
       u(4) = New_Cov_4/Pre_Cov_4*0.1e6;
      elseif (t >= tvaccc+8) && (t < tvaccc+9)
     u(4) = New_Cov_4/Pre_Cov_4*0.09e6;
      elseif (t >= tvaccc+9) && (t < tvaccc+10)
   u(4) = New_Cov_4/Pre_Cov_4*0.08e6;
      elseif (t >= tvaccc+10) && (t < tvaccc+11)
       u(4) = New_Cov_4/Pre_Cov_4*0.05e6;
       elseif (t >= tvaccc+11) && (t < tvaccc+12)
    u(4) = New_Cov_4/Pre_Cov_4*0.08e6;
        else
    u(4) = 0;   
end



for j =1:1:4
S(j) = X(j);     E(j) = X(j+4);    I(j) = X(j+2*4); H(j) = X(j+3*4);
A(j) = X(j+4*4);  R(j) = X(j+5*4); U(j) = X(j+6*4);  V(j) = X(j+7*4);
P(j) = X(j+8*4);
N(j) = (S(j) + E(j) + I(j) + A(j) + R(j) + U(j)  + V(j) + P(j));
end
 NN = 51748700;


 %beta = beta0*(1+a0*cos(2*pi*(t-t0)/52));


for j =1:1:4
    for k = 1:1:4
     lambda(j) =  beta1(j)*(1+a0*cos(2*pi*(t-t0)/52))*sum(C(j,k)*(I(k) + delta * A(k))/(N(k)));
    end  
end
  

%%%
dS1  = -u(1) - lambda(1) * S(1) + gamma1 * P(1);
dS2  = -u(2) - lambda(2) * S(2) + gamma2 * P(2);
dS3  = -u(3) - lambda(3) * S(3) + gamma2 * P(3);
dS4  = -u(4) - lambda(4) * S(4) + gamma4 * P(4);

%%%%
dE1 = lambda(1) * (S(1) +  V(1) + U(1)) - kappa * E(1);
dE2 = lambda(2) * (S(2) +  V(2) + U(2)) - kappa * E(2);
dE3 = lambda(3) * (S(3) +  V(3) + U(3)) - kappa * E(3);
dE4 = lambda(4) * (S(4) +  V(4) + U(4)) - kappa * E(4);

%%%
%%%

dI1 = q * kappa * E(1) -  (1 - qh(1)) * alpha * I(1) - qh(1) * rho * I(1);
dI2 = q * kappa * E(2) -  (1 - qh(2)) * alpha * I(2) - qh(2) * rho * I(2);
dI3 = q * kappa * E(3) -  (1 - qh(3)) * alpha * I(3) - qh(3) * rho * I(3);
dI4 = q * kappa * E(4) -  (1 - qh(4)) * alpha * I(4) - qh(4) * rho * I(4);

%%%% 

dH1 = qh(1) * rho * I(1) - (sigma(1) + d(1)) * H(1) ;
dH2 = qh(2) * rho * I(2) - (sigma(2) + d(2)) * H(2) ;
dH3 = qh(3) * rho * I(3) - (sigma(3) + d(3)) * H(3) ;
dH4 = qh(4) * rho * I(4) - (sigma(4) + d(4)) * H(4) ;

%%%% 

dA1 = (1-q) * kappa * E(1) - eta * A(1) ;
dA2 = (1-q) * kappa * E(2) - eta * A(2) ;
dA3 = (1-q) * kappa * E(3) - eta * A(3) ;
dA4 = (1-q) * kappa * E(4) - eta * A(4) ;


%%% 


%%% 


dR1 = eta * A(1) + (1 - qh(1)) * alpha * I(1)  +  sigma(1) * H(1) ;
dR2 = eta * A(2) + (1 - qh(2)) * alpha * I(2)  +  sigma(2) * H(2) ;
dR3 = eta * A(3) + (1 - qh(3)) * alpha * I(3)  +  sigma(3) * H(3) ;
dR4 = eta * A(4) + (1 - qh(4)) * alpha * I(4)  +  sigma(4) * H(4) ;

%%% 

dU1 = (1 - epsilon(1)) * u(1) -  lambda(1) * U(1) ;
dU2 = (1 - epsilon(2)) * u(2) -  lambda(2) * U(2) ;
dU3 = (1 - epsilon(3)) * u(3) -  lambda(3) * U(3) ; 
dU4 = (1 - epsilon(4)) * u(4) -  lambda(4) * U(4) ;

%%% 

dV1 = epsilon(1) * u(1) -  lambda(1) * V(1) - omega * V(1) ;
dV2 = epsilon(2) * u(2) -  lambda(2) * V(2) - omega * V(2) ;
dV3 = epsilon(3) * u(3) -  lambda(3) * V(3) - omega * V(3) ; 
dV4 = epsilon(4) * u(4) -  lambda(4) * V(4) - omega * V(4) ;




%%%
dP1 = omega * V(1) - gamma1 * P(1);
dP2 = omega * V(2) - gamma2 * P(2);
dP3 = omega * V(3) - gamma2 * P(3);
dP4 = omega * V(4) - gamma4 * P(4);



DY = [dS1; dS2; dS3; dS4
      dE1; dE2; dE3; dE4
      dI1; dI2; dI3; dI4
      dH1; dH2; dH3; dH4
      dA1; dA2; dA3; dA4
      dR1; dR2; dR3; dR4
      dU1; dU2; dU3; dU4
      dV1; dV2; dV3; dV4
      dP1; dP2; dP3; dP4];
end
