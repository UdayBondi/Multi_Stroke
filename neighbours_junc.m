function [n_pts] = neighbours_junc( x,y,I )
%neighbours_junc To find the neighbouringpts of a junction point
%   give the junction point and the binary matrix for reference
   count=0;
   if(I(x-1,y)==0)
       n_pts(count+1,:)=[x-1 y];
       count=count+1;
   end
   if(I(x,y-1)==0)
       n_pts(count+1,:)=[x y-1];
       count=count+1;
   end
   if(I(x,y+1)==0)
       n_pts(count+1,:)=[x y+1];
       count=count+1;
   end
   if(I(x+1,y)==0)
       n_pts(count+1,:)=[x+1 y];
       count=count+1;
   end
   if(I(x-1,y-1)==0&&count~=3&&I(x-1,y)~=0)
       n_pts(count+1,:)=[x-1 y-1];
       count=count+1;
   end
   if(I(x-1,y+1)==0&&count~=3&&I(x-1,y)~=0)
       n_pts(count+1,:)=[x-1 y+1];
       count=count+1;
   end
   if(I(x+1,y-1)==0&&count~=3&&I(x+1,y)~=0)
       n_pts(count+1,:)=[x+1 y-1];
       count=count+1;
   end
   if(I(x+1,y+1)==0&&count~=3&&I(x+11,y)~=0)
       n_pts(count+1,:)=[x+1 y+1];
       count=count+1;
   end

end

