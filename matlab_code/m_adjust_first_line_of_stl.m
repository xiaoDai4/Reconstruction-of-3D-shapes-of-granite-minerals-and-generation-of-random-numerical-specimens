%%2
%%This code is used to adjust the first line of STL file
clear;
clc;
path_old_pre = 'D:\avizo wen jian\20200411data_A5sample\biotitebanktest\A5';   %%Address of particle file before processing
path_new_pre = 'D:\avizo wen jian\20200411data_A5sample\biotitebanktest\A5_handled'; %%Address of particle file after processing
n_start = 0;%%start number,min 0
n_ = 654;%%total number-1
particle_ = 'biotite';%%paticle type

for i = n_start : n_
    path_old = [path_old_pre, '\\',particle_, num2str(i),'.stl'];
    path_new = [path_new_pre, '\\',particle_, num2str(i),'.stl'];
    filestl=fopen(path_old,'r');%
    filenew=fopen(path_new,'w');%

    tline=fgetl(filestl);
    fprintf(filenew,'solid\n');%%The first line becomes 'solid'

    while ~feof(filestl) %
        tline=fgetl(filestl);%
        fprintf(filenew,'%s\n',tline);%The rest is written in turn
    end
    fclose(filestl);
    fclose(filenew);
end
