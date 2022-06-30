%%3  remember save the work space
clear;
clc;
cd('D:\avizo wen jian\20200411data_A5sample')  %%data file's directory
data = importdata('biotite.txt');
rock_volume3d = 8.87204e+08;%%Sample volume
rock_area3d = 5.17091e+06;%%Surface area of rock sample
rock_x = 475.942;
rock_y = 485.939;
rock_z = 749.462;%%Core coordinate of rock sample
start_n = 1; %%min 1
n_ =   655;  %%Number of particles
edge = 120;  %%Length of screening edge particles, biotite is 106, quartz is 188
sample_r = 863; %%Radius of rock sample on image
sample_z_max = 750; %%Maximum value of Z coordinate of rock sample,half of the rock sample lenth
path_ = 'D:\\avizo wen jian\\20200411data_A5sample\\biotitebanktest\\A5_handled'; %%particle's path
particle_ = 'biotite'; %%particle type


%%Here's how to import data,data.data(1::) is volume3d
%%data.data(:,2) is area3d
%%data.data(:,3) is _x
%%data.data(:,4) is _y
%%data.data(:,5) is _z
%%data.data(:,6) is mean
%%data.data(:,7) is index




%%%The following code is to translate the particles according to the centroid coordinates of the rock sample
translation_x = zeros(n_,1);
translation_y = zeros(n_,1);
translation_z = zeros(n_,1);
translation_x = data.data(:,3)-rock_x;
translation_y = data.data(:,4)-rock_y;
translation_z = data.data(:,5)-rock_z;


%%%
%%%The following code transforms the particle coordinate into a cylindrical coordinate
r = zeros(n_,1);
theta = zeros(n_,1);
z = zeros(n_,1);
r = sqrt(translation_x.^2+translation_y.^2);
z = translation_z;
%%value of theta,if x == 0,take 0,then,in each quadrant,the value also needs to be converted according to the actual situation
for i = 1:n_
    if translation_x(i,1) == 0
        theta(i,1) = pi/2;
    else
        theta(i,1) = atan(translation_y(i,1)/translation_x(i,1));
    end
 end

for i = 1:n_
    if translation_x(i,1) <= 0 && translation_y(i,1) <= 0 %%Third quadrant conversion
        theta(i,1) = theta(i,1) + pi;
    elseif translation_x(i,1) > 0 && translation_y(i,1) < 0%%Fourth quadrant conversion
        theta(i,1) = theta(i,1) + 2*pi;
    elseif translation_x(i,1) < 0 && translation_y(i,1) > 0%%second quadrant conversion
        theta(i,1) = theta(i,1) +pi ;
    end
end

%%Here is the code to classify particles(Edge particles and internal particles)
j_edge = 0;
j_inside = 0;
cd(path_)
r_edge = zeros(n_,1);
theta_edge = zeros(n_,1);
z_edge = zeros(n_,1);
v_edge = zeros(n_,1);
x_edge_origin = zeros(n_,1);
y_edge_origin = zeros(n_,1);
z_edge_origin = zeros(n_,1);



r_inside = zeros(n_,1);
theta_inside = zeros(n_,1);
z_inside = zeros(n_,1);
v_inside = zeros(n_,1);
x_inside_origin = zeros(n_,1);
y_inside_origin = zeros(n_,1);
z_inside_origin = zeros(n_,1);

for i = start_n:n_
    if r(i) > sample_r - edge || z(i) > sample_z_max - edge || z(i) < edge - sample_z_max
        old_name = [particle_ , num2str(i-1),'.stl'];
        new_name = ['edge_', particle_ , num2str(j_edge+1),'.stl'];
        movefile (old_name,new_name)
        r_edge(j_edge+1) = r(i);
        theta_edge(j_edge+1) = theta(i);
        z_edge(j_edge+1) = z(i);
        v_edge(j_edge+1) = data.data(i,1);
        x_edge_origin(j_edge+1) = data.data(i,3);
        y_edge_origin(j_edge+1) = data.data(i,4);
        z_edge_origin(j_edge+1) = data.data(i,5);
        j_edge = j_edge +1;
        
    else
        old_name = [particle_ , num2str(i-1),'.stl'];
        new_name = ['inside_', particle_ , num2str(j_inside+1),'.stl'];
        movefile (old_name,new_name)
        r_inside(j_inside+1) = r(i);
        theta_inside(j_inside+1) = theta(i);
        z_inside(j_inside+1) = z(i);
        v_inside(j_inside+1) = data.data(i,1);
        x_inside_origin(j_inside+1) = data.data(i,3);
        y_inside_origin(j_inside+1) = data.data(i,4);
        z_inside_origin(j_inside+1) = data.data(i,5);
        j_inside = j_inside +1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



