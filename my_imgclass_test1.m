classdef my_imgclass_test1
    properties
        img=checkerboard(64);
    end
    methods
        function obj=my_imgclass_test1(varargin)
            switch nargin
                case 1
                    obj.img=varargin{1};
            end
        end
        function imshow(obj)
            figure;
            imshow(obj.img);
        end
        function obj=my_ex_comp(obj,ex_comp)
            obj.img=obj.img*ex_comp;
        end
        function obj=my_awb(obj,rgb_gain)
            obj.img=my_awb(obj.img,rgb_gain);
        end
        function obj=my_ccm(obj,ccm)
            obj.img=my_ccm(obj.img,ccm);
        end
        function obj=my_gamma(obj)
            gamma=@(x) ((x<=0.0031308)&(x>0)).*(323/25*x)+((x>0.0031308)&(x<=1)).*(1.055*x.^(1/2.4)-0.055)+(x>1);
            obj.img=gamma(obj.img);
        end
        function obj=rgb2lab(obj)
            obj.img=rgb2lab(obj.img);
        end
    end
end
        
        
        
        