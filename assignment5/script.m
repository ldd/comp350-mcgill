%add to script required paths
addpath('newton');
addpath('cubic_splines');
addpath('least_squares');
%setup common variables
n = 7;
min = -1;
max = 1;
h = (max-min)/(n-1);
x = (min:h:max);
y = arrayfun(@f,x);%get f(x) at points x_1...x_n

%newton
a = newton_coef(x,y);
p = @(xx) newton_pval(a,x,xx);

%cubic splines
z = cubic_splines_z(x,y);
S = @(xx) cubic_splines_pval(x,y,z,xx);

%least_squares
d = least_squares_coef(x,y)
%we write the explicit expression of g(x)
g = @(xx) d(1)+d(2)*xx^2+ d(3)*xx^4

%preparations to create the table
table_points = (min:h/2:max);
f_table_results = arrayfun(@f, table_points).';
p_table_results = f_table_results - arrayfun(p, table_points).';
S_table_results = f_table_results - arrayfun(S, table_points).';
g_table_results = f_table_results - arrayfun(g, table_points).';
column_names = {'x','f_x','p_diff','S_diff','g_diff'};
%draw table

table(table_points.', f_table_results, p_table_results, S_table_results, g_table_results, 'VariableNames', column_names)

%prepare to make plots
points = (min:0.001:max);
f_results = arrayfun(@f, points);
p_results = arrayfun(p, points);
S_results = arrayfun(S, points);
g_results = arrayfun(g, points);

%plot everything
clf;
plot(points, f_results, 'color', 'g');
hold on;
plot(points, p_results, 'color', 'r');
hold on;
plot(points, S_results, 'color', 'b');
hold on;
plot(points, g_results, 'color', 'm');
title('f(x) = 1 /(1+25x^2)');
legend('f(x)', 'p(x) [Newton Approach]', 'S(x) [cubic spline]', 'g(x) [least squares]');