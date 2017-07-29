function h = least_squares_coef(x,y)
m = length(x);
A = [ones(1,m); x.^2; x.^4];
h = (A.')\(y');
