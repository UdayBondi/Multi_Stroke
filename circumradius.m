function [ radius] = circumradius(a,b,c )
%circumradius: Used to calculate circumradius of a triangle from three
%given sides(lengths)
de_ator=sqrt((a+b+c)*(b+c-a)*(a-b+c)*(a+b-c));
radius=a*b*c/de_ator;
end

