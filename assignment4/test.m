%constants used for almost every method. min and max guesses
x_min = 1;
x_max = 2;

%plot the function
figure;
fplot('f',x_min:x_max);
refline(0,0);
title('y = x^3 - 5x + 3');

%constants used for newton's method, modified newton's method and the secant method
xtol = 1.e-12;
ftol = 1.e-12;
%constant used for the bisection method
delta = 1.e-12;

%maximum number of iterations (big number)
n_max = 1000;

fprintf('\nNewton''s method results\n')
newton('f','fd',x_max,xtol,ftol,n_max,1);

fprintf('\nNew method results\n')
new_method('f','fd','fd2',x_max,xtol,ftol,n_max,1);

fprintf('\nBisection method results\n')
bisection('f',x_min,x_max,delta,1);

fprintf('\nSecant method results\n')
secant('f',x_min,x_max,xtol,ftol,n_max,1);
