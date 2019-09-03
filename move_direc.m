function [pt_now]=move_direc(x0,y0,x1,y1,count)
% clc
% clear all
point = [x0 y0 x1 y1];
invert=0;
token=0;
done=0;
dx = abs(x1 - x0) ;                              % Distance to travel in x-direction
dy = abs(y1 - y0);                               % Distance to travel in y-direction
sx = sign(x1 - x0);                              % sx indicates direction of travel in X-dir
sy = sign(y1 - y0);                              % Ensures positive slope line

x = x0; y = y0;
if((y1-y0)==0)
   for i=1:count
      x = x + 1*sx;  
   end
   pt_now=[x y0];
   done=1;
end
if((x1-x0)==0&&done==0)
     for i=1:count
      y = y + 1*sy;  
     end
   pt_now=[x0 y];
   done=1;
end
if(done==0)
if (abs(y1-y0) > abs(x1-x0))       % If the line is steep                                
    x0 = point(2);y0 = point(1); x1 = point(4);y1=point(3);% then it would be converted to 
    token =1;                                              % non steep by changing coordinate
else
    x0 = point(1);y0 = point(2); x1 = point(3);y1=point(4);
    token = 0; 
end
if(x0 >x1)
    temp1 = x0; x0 = x1; x1 = temp1;
    temp2 = y0; y0 = y1; y1 = temp2;
    invert=1;
end
% clf, subplot(2,1,1) ,hold on , grid on ,axis([x0-1 x1+1 y0-1 y1+1]);
% title('Bresenham Line Generation Algorithm: Point form')
dx = abs(x1 - x0) ;                              % Distance to travel in x-direction
dy = abs(y1 - y0);                               % Distance to travel in y-direction
sx = sign(x1 - x0);                              % sx indicates direction of travel in X-dir
sy = sign(y1 - y0);                              % Ensures positive slope line

x = x0; y = y0;                                  % Initialization of line
param = 2*dy - dx ;                              % Initialization of error parameter
for i = 0:dx                                  % FOR loop to travel along X
    x_coord(i+1) = x;                            % Saving in matrix form for plot
    y_coord(i+1) = y;
%     if (token ==0)                               % Plotting in point form 
%         plot(x,y,'r*');                          % For steep line coordinate is again
%     else                                         % converted for actual line drawing.
%         plot(y,x,'r*');
%     end
                           % parameter value is modified
    if (param >0)                                % if parameter value is exceeded
        y = y +1*sy;                             % then y coordinate is increased
        param = param - 2*(dx )+2*(dy);                 % and parameter value is decreased
    else
         param = param + 2*dy; 
    end
    x = x + 1*sx;                                % X-coordinate is increased for next point
end
% subplot(2,1,2)                                   % Plotting in line fragment form
if(invert==0)
    x_cd=x_coord(count+1);
    y_cd=y_coord(count+1);
else
    x_cd=x_coord(dx-count+1);
    y_cd=y_coord(dx-count+1);
    
end
if (token ==0)
%     plot(x_coord,y_coord,'r-','LineWidth',2);
    pt_now=[x_cd y_cd];
else
%     plot(y_coord,x_coord,'r-','LineWidth',2);
     pt_now=[y_cd x_cd];
end
end
% grid on
% axis([x0-1 x1+1 y0-1 y1+1]);
% title('Bresenham Line Generation Algorithm: Line fragment form')