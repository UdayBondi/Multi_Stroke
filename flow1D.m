function [ pt_now,pt_prev ] = flow_1D(I,start_x,start_y,previous_x,previous_y,count)
%flow_1D Use this function to move in one direction, one pixel at a time
%  Give the binary matrix,starting point,previous points(direction) and the number of pixels u want to move
temp_x=start_x;
temp_y=start_y;

prev_x=previous_x;
prev_y=previous_y;
for i=1:count
        done=0;
         if((I(temp_x-1,temp_y)==0&&temp_x-1~=prev_x&&done==0)||(I(temp_x-1,temp_y)==0&&temp_y~=prev_y&&done==0))
           
            prev_x=temp_x;
            prev_y=temp_y;
            temp_x=temp_x-1;
            temp_y=temp_y;
           done=1;
         end
         if((I(temp_x,temp_y-1)==0&&temp_x~=prev_x&&done==0)||(I(temp_x,temp_y-1)==0&&temp_y-1~=prev_y&&done==0))
            
            prev_x=temp_x;
            prev_y=temp_y;
            temp_x=temp_x;
            temp_y=temp_y-1;
            done=1;
         end
         
         if((I(temp_x,temp_y+1)==0&&temp_x~=prev_x&&done==0)||(I(temp_x,temp_y+1)==0&&temp_y+1~=prev_y&&done==0))
            
            prev_x=temp_x;
            prev_y=temp_y;
            temp_x=temp_x;
            temp_y=temp_y+1;
            done=1;
        end
         if((I(temp_x+1,temp_y)==0&&temp_x+1~=prev_x&&done==0)||(I(temp_x+1,temp_y)==0&&temp_y~=prev_y&&done==0))
           
            prev_x=temp_x;
            prev_y=temp_y;
            temp_x=temp_x+1;
            temp_y=temp_y;
            done=1;
         end
            if((I(temp_x-1,temp_y-1)==0&&temp_x-1~=prev_x&&done==0)||(I(temp_x-1,temp_y-1)==0&&temp_y-1~=prev_y&&done==0))
                if((temp_x~=prev_x||temp_y-1~=prev_y)&&(temp_x-1~=prev_x||temp_y~=prev_y))
                
                prev_x=temp_x;
                prev_y=temp_y;
                temp_x=temp_x-1;
                temp_y=temp_y-1;
                done=1;
                end
            end

           if((I(temp_x-1,temp_y+1)==0&&temp_x-1~=prev_x&&done==0)||(I(temp_x-1,temp_y+1)==0&&temp_y+1~=prev_y&&done==0))
                 if((temp_x~=prev_x||temp_y+1~=prev_y)&&(temp_x-1~=prev_x||temp_y~=prev_y))
                
                prev_x=temp_x;
                prev_y=temp_y;
                temp_x=temp_x-1;
                temp_y=temp_y+1;
                done=1;
                end
            end

             if((I(temp_x+1,temp_y-1)==0&&temp_x+1~=prev_x&&done==0)||(I(temp_x+1,temp_y-1)==0&&temp_y-1~=prev_y&&done==0))
                if((temp_x~=prev_x||temp_y-1~=prev_y)&&(temp_x+1~=prev_x||temp_y~=prev_y)) 
                
                prev_x=temp_x;
                prev_y=temp_y;
                temp_x=temp_x+1;
                temp_y=temp_y-1;
                done=1;
                end
            end
            if((I(temp_x+1,temp_y+1)==0&&temp_x+1~=prev_x&&done==0)||(I(temp_x+1,temp_y+1)==0&&temp_y+1~=prev_y&&done==0))
                 if((temp_x~=prev_x||temp_y+1~=prev_y)&&(temp_x+1~=prev_x||temp_y~=prev_y))
                
                prev_x=temp_x;
                prev_y=temp_y;
                temp_x=temp_x+1;
                temp_y=temp_y+1;
                done=1;
                 end
            end
end
pt_now=[temp_x temp_y];
pt_prev=[prev_x prev_y];

end

