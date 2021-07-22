function rgb=my_ccm(rgb,ccm)

    if (size(rgb,3)==1)&&(size(rgb,2)==3)
        rgb=rgb_ccm_func(rgb,ccm);
    elseif (size(rgb,3)==3)
        [rgb,func_reverse]=my_im2vector(rgb);
        rgb=rgb_ccm_func(rgb,ccm);
        rgb=func_reverse(rgb);
    end
    clip_flag=1;
    if clip_flag
        rgb(rgb<0)=0;
        rgb(rgb>1)=1;
    end
end
function rgb=rgb_ccm_func(rgb,ccm)
    rgb=(ccm*(rgb'))';
end