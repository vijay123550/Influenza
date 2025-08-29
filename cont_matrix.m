contact_matrix1 = xlsread('A12.xlsx');


b = bar3(contact_matrix1);
%surf(contact_matrix );
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp' ;
 end

colorbar



%%  
contact_matrix = xlsread('korea_cont.xlsx');


b = bar3(contact_matrix );
%surf(contact_matrix );
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp' ;
 end

colorbar
