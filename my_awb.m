function rgb=my_awb(rgb,rgb_gain)
%MY_AWB °×Æ½ºâ
% rgb=my_awb(rgb,rgb_gain)
%%
if size(rgb,3)==3
    rgb(:,:,1)=rgb(:,:,1)*rgb_gain(1);
    rgb(:,:,2)=rgb(:,:,2)*rgb_gain(2);
    rgb(:,:,3)=rgb(:,:,3)*rgb_gain(3);
elseif (size(rgb,3)==1)&&(size(rgb,2)==3)
    rgb(:,1)=rgb(:,1)*rgb_gain(1);
    rgb(:,2)=rgb(:,2)*rgb_gain(2);
    rgb(:,3)=rgb(:,3)*rgb_gain(3);
end
%%
clip_flag=1;
if clip_flag
    rgb(rgb>1)=1;
    rgb(rgb<0)=0;
end
end