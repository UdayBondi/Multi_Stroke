function [ angle] = angle( a,b,c )
%angle :find the angle in a triangle using length of sides.
% the first side that you give is the side opp to which this angle is in a
% triangle.
x=(-a*a+b*b+c*c)/(2*b*c);
%disp(x);
angle=acosd(x);
end

