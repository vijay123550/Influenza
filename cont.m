%%
contact_matrix11 = xlsread('korea_cont.xlsx');
  Pop_per = xlsread('korea_pop.xlsx');
Pop_per1  =  51748738 * Pop_per(:,1)/100;
%%

for j =1:16
    for i = 1:16

       CC(i,j) =   contact_matrix11(i,j) * Pop_per1(i);

    end 
end 


%%

for i =1:16
    for j = 1:16

       CC1(i,j) =   contact_matrix11(i,j) * Pop_per1(j);

    end 
end 
%%
C1 = CC1(:,1)+ CC1(:,2) + CC1(:,3);
C2 = CC1(:,4)+ CC1(:,5) + CC1(:,6) + CC1(:,7)+ CC1(:,8) + CC1(:,9) + CC1(:,10);
C3 = CC1(:,11)+ CC1(:,12) + CC1(:,13);
C4 = CC1(:,14)+ CC1(:,15) + CC1(:,16);

C110 = [C1 C2 C3 C4];

C11 = C110(1,:)+ C110(2,:) + C110(3,:);
C12 = C110(4,:)+ C110(5,:) + C110(6,:) + C110(7,:)+ C110(8,:) + C110(9,:) + C110(10,:);
C13 = C110(11,:)+ C110(12,:) + C110(13,:);
C14 = C110(14,:)+ C110(15,:) + C110(16,:);

C0 = [C11; C12; C13; C14];

C01 = C0(1,:)/(Pop_per1(1)+Pop_per1(2)+Pop_per1(3));
C02 = C0(2,:)/(Pop_per1(4)+Pop_per1(5)+Pop_per1(6) + Pop_per1(7)+Pop_per1(8)+Pop_per1(9) + Pop_per1(10));
C03 = C0(3,:)/(Pop_per1(11)+Pop_per1(12)+Pop_per1(13));
C04 = C0(4,:)/(Pop_per1(14)+Pop_per1(15)+Pop_per1(16));

C00 = [C01; C02; C03; C04];

C001 = C00(:,1)/(Pop_per1(1)+Pop_per1(2)+Pop_per1(3));
C002 = C00(:,2)/(Pop_per1(4)+Pop_per1(5)+Pop_per1(6) + Pop_per1(7) + Pop_per1(8) + Pop_per1(9) + Pop_per1(10));
C003 = C00(:,3)/(Pop_per1(11)+Pop_per1(12)+Pop_per1(13));
C004 = C00(:,4)/(Pop_per1(14)+Pop_per1(15)+Pop_per1(16));

CCC = [C001 C002 C003 C004];
CCC0 = [C001 C002 C003 C004]./CCC(1,1);
 C = CCC0;
