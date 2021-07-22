function [rgb_mean,rgb_std,poly_position,extra_data]=my_impoly(varargin)
%MY_IMPOLY 框选24色卡，输出每个色块的均值、方差
% rgb_mean=my_impoly(H_FIG)
% [rgb_mean,rgb,std]=my_impoly(H_FIG);
% [rgb_mean,rgb_std,poly_position,block_cell]=my_impoly(H_FIG,poly_position);
%%
%{
H_FIG=figure('name','原始图像');imshow(img);
%}
H_FIG=varargin{1};
figure(H_FIG);
hold on;
if nargin==1
%     h_poly=impoly;
    h_poly=drawpolygon;
    poly_position=h_poly.Position;
    delete(h_poly);
else
    poly_position=varargin{2};
end
poly_x=poly_position(:,1);
poly_y=poly_position(:,2);
%%
plot(poly_x,poly_y,'rx');
%%
x_1=poly_position(1,:);
x_2=poly_position(2,:);
x_3=poly_position(3,:);
x_4=poly_position(4,:);

[n,m]=meshgrid(1/12:1/6:11/12,1/8:1/4:7/8);
n=n';
m=m';
block_center=((1-m(:)).*(1-n(:)))*x_1+...
            ((1-m(:)).*(n(:)))*x_2+...
            ((m(:)).*(1-n(:)))*x_4+...
            ((m(:)).*(n(:)))*x_3;
%%
r=min([norm(x_1-x_2)/6,norm(x_2-x_3)/4,norm(x_3-x_4)/6,norm(x_4-x_1)/4])/2;
r=round(r*0.3);
plot(round(block_center(:,1))-r,round(block_center(:,2))-r,'y+');
plot(round(block_center(:,1))-r,round(block_center(:,2))+r,'y+');
plot(round(block_center(:,1))+r,round(block_center(:,2))-r,'y+');
plot(round(block_center(:,1))+r,round(block_center(:,2))+r,'y+');
%%
img=getimage(H_FIG);
rgb_mean=zeros(24,3);
rgb_std=zeros(24,3);
extra_data=struct;
extra_data.block_cell=cell(24,1);
extra_data.Y_mean=zeros(24,1);
extra_data.Y_std=zeros(24,1);
for block_idx=1:24
    block=img(round(block_center(block_idx,2))+(-r:r),round(block_center(block_idx,1))+(-r:r),:);
    rgb_vector=my_im2vector(block);
    y_vector=([0.299,0.587,0.114]*rgb_vector')';
    rgb_mean(block_idx,:)=mean(rgb_vector);
    rgb_std(block_idx,:)=std(rgb_vector);
    extra_data.block_cell{block_idx}=block;
    extra_data.Y_mean(block_idx)=mean(y_vector);
    extra_data.Y_std(block_idx)=std(y_vector);
end






