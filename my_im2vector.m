function [rgb,func_reverse]=my_im2vector(img)
if size(img,3)==3
    sizeI=size(img);
    rgb=reshape(img,[sizeI(1)*sizeI(2),3]);
    func_reverse=@(rgb) reshape(rgb,sizeI);
elseif size(img,3)==1
    sizeI=size(img);
    rgb=reshape(img,[sizeI(1)*sizeI(2),1]);
    func_reverse=@(rgb) reshape(rgb,sizeI);
else    
    error('不支持的文件格式');
end