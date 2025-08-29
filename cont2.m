% clc;
% clear all;
% close all;



%%
contact_matrix11 = xlsread('korea_cont.xlsx');
  Pop_per = xlsread('korea_pop.xlsx');
Pop_per1  =  51748738 * Pop_per(:,1)/100;
%%

NN(1) = Pop_per1(1)+Pop_per1(2)+Pop_per1(3);
NN(2) = Pop_per1(4)+Pop_per1(5)+Pop_per1(6) + Pop_per1(7)+Pop_per1(8)+Pop_per1(9) + Pop_per1(10);
NN(3) = Pop_per1(11)+Pop_per1(12)+Pop_per1(13);
NN(4) = Pop_per1(14)+Pop_per1(15)+Pop_per1(16);



for i =1:16
C1(i) = sum(contact_matrix11(i,1:3));
end

for i =1:16
C2(i) = sum(contact_matrix11(i,4:10));
end

for i =1:16
C3(i) = sum(contact_matrix11(i,11:13));
end

for i =1:16
C4(i) = sum(contact_matrix11(i,14:16));
end

CC = [C1' C2' C3' C4'];


%%

for i =1:16
       CC1(i,:) =   CC(i,:) * Pop_per1(i);
end 

for j =1:4
C01(j) = sum(CC1(1:3,j))/NN(1);
end

for j =1:4
C02(j) = sum(CC1(4:10,j))/NN(2);
end

for j =1:4
C03(j) = sum(CC1(11:13,j))/NN(3);
end

for j =1:4
C04(j) = sum(CC1(14:16,j))/NN(4);
end

%%
C0 = [C01; C02; C03; C04];


%%

for i =1:4
       C10(i,:) =   C0(i,:) * NN(i);
end

AO = C0';
for i =1:4
       C20(i,:) =   AO(i,:) * NN(i);
end

C30 = 0.5*(C10+C20);

for i =1:4
       C03(i,:) =   C30(i,:)/ NN(i);
end

C = C03;


%%
figure
b1 = bar3(C03);
for k = 1:length(b1)
    zdata = b1(k).ZData;
    b1(k).CData = zdata;
    b1(k).FaceColor = 'interp' ;
end
set(gca,'XTickLabel',{'G1', 'G2', 'G3', 'G4'},'fontsize',16)
set(gca,'YTickLabel',{'G1', 'G2', 'G3' ,'G4'},'fontsize',16)
colorbar
