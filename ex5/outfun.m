function  stop  =  outfun  (  curr_p  ,  ~  ,  ~  )
global prev_p;
global color;
stop  =  false;
if ~isnan(prev_p)
    line([prev_p(1) curr_p(1)], [prev_p(2) curr_p(2)], 'Color',color,'LineWidth',5)
end
prev_p = curr_p;


end