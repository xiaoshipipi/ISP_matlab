function stop = my_ccm_plot(x,optionValues,state,varargin)

stop = false;
switch state
    case 'init'
        set(gcf,'position',[50,50,800,900]);
        [a,b]=meshgrid(linspace(-60,70,550),linspace(-55,100,750));
        L=75*ones(size(a));
        img_background=lab2rgb(cat(3,L,a,b));
        H_IMG=imshow(img_background);
        set(H_IMG,'XData',[-60,70],'YData',[-60,70],'YData',[-55,100]);
        set(gca,'XLim',[-60,70],'YLim',[-55,100],'Visible','on','YDir','normal');
        hold on;
        Lab_ideal=varargin{1};
        Lab_measured=varargin{2};
        Lab=Lab_measured(x);
        q_x=Lab_ideal(:,2);
        q_y=Lab_ideal(:,3);
        q_u=Lab(:,2)-q_x;
        q_v=Lab(:,3)-q_y;
        quiver(q_x,q_y,q_u,q_v,0,'color','k','ShowArrowHead','off','tag','quiver');
        text(q_x(1:18)+5,q_y(1:18),{'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18'});
        plot(Lab_ideal(:,2),Lab_ideal(:,3),'ks','tag','Lab_ideal');
        plot(Lab(:,2),Lab(:,3),'ko','tag','Lab');    
    case 'iter'
        Lab_ideal=varargin{1};
        Lab_measured=varargin{2};
        Lab=Lab_measured(x);
        q_u=Lab(:,2)-Lab_ideal(:,2);
        q_v=Lab(:,3)-Lab_ideal(:,3);
        H_quiver=findobj(gcf,'tag','quiver');
        H_Lab=findobj(gcf,'tag','Lab');
        set(H_quiver,'UData',q_u,'VData',q_v);
        set(H_Lab,'XData',Lab(:,2),'YData',Lab(:,3));
end
        
        