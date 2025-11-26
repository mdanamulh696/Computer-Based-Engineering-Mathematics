function [r2]=rsquare(y_data,y)
h = y_data;
upper_eq=sum((y-mean(h)).^2);
lower_eq=sum((h-mean(h)).^2);
r2=upper_eq/lower_eq;

