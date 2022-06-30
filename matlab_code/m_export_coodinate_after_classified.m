%%4 this code is used to export the coodinate of the particle after
%%classified

f_x = fopen('C:\Users\79092\Desktop\quartz_edge\quartz_f_x.txt','w');%%
fprintf(f_x,'%10.4f\n',x_edge_origin);
fclose(f_x);

f_y = fopen('C:\Users\79092\Desktop\quartz_edge\quartz_f_y.txt','w');%%
fprintf(f_y,'%10.4f\n',y_edge_origin);
fclose(f_y);

f_z = fopen('C:\Users\79092\Desktop\quartz_edge\quartz_f_z.txt','w');%%
fprintf(f_z,'%10.4f\n',z_edge_origin);
fclose(f_z);

f_x = fopen('C:\Users\79092\Desktop\quartz_inside\quartz_f_x.txt','w');%%
fprintf(f_x,'%10.4f\n',x_inside_origin);
fclose(f_x);

f_y = fopen('C:\Users\79092\Desktop\quartz_inside\quartz_f_y.txt','w');%%
fprintf(f_y,'%10.4f\n',y_inside_origin);
fclose(f_y);

f_z = fopen('C:\Users\79092\Desktop\quartz_inside\quartz_f_z.txt','w');%%
fprintf(f_z,'%10.4f\n',z_inside_origin);
fclose(f_z);