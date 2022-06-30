%%1
%%this file export data for avizo to export particles

clear;
clc;

cd('C:\Users\79092\Desktop\A5')
data = importdata('quartz.txt');

f_x = fopen('C:\Users\79092\Desktop\quartz_f_x.txt','w');%%
fprintf(f_x,'%10.4f\n',data.data(:,3));
fclose(f_x);

f_y = fopen('C:\Users\79092\Desktop\quartz_f_y.txt','w');%%
fprintf(f_y,'%10.4f\n',data.data(:,4));
fclose(f_y);

f_z = fopen('C:\Users\79092\Desktop\quartz_f_z.txt','w');%%
fprintf(f_z,'%10.4f\n',data.data(:,5));
fclose(f_z);


