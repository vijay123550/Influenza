
clc;
clear all;
close all;
%%

II = [10076; 6881; 1856; 1155];

AA = [4534; 2526; 831; 516];





%%
str = { 'G1' , 'G2' , 'G3' , 'G4'};


yy = [II, AA];

figure(4)
yyaxis left
Per = bar((1:length(yy)),II, 'barwidth', 0.4);
ylabel( ' Symptomatic Infected','fontsize',16)
yyaxis right
Total = bar((1:length(yy))+0.4,AA, 'barwidth', 0.4);
ylabel( ' Asymptomatic Infected','fontsize',16)
%xlabel( 'Groups','fontsize',16)
 %set(gca, 'XTick', 1:length(yy))
set(gca, 'XTickLabel' ,str, 'XTick' ,1:numel(str), 'FontSize' ,16)

