%use our cubic splines function (define S)
addpath('cubic_splines');

%code given by problem to get points from the screen
figure('position', get(0,'screensize'))
axes('position',[0 0 1 1])
[v,w] = ginput;

len = length(v);
clf;
%%%%%%%%%%%%%%%%%%%%%%%%%
% 2 splines for fingers %
%%%%%%%%%%%%%%%%%%%%%%%%%
t= 0:1/(len-1):1;
z_x = cubic_splines_z(t,v);
S_x = @(xx) cubic_splines_pval(t,v,z_x,xx);

z_y = cubic_splines_z(t,w);
S_y = @(xx) cubic_splines_pval(t,w,z_y,xx);

points = (0:0.001:1);
x_results = arrayfun(S_x, points);
y_results = arrayfun(S_y, points);

plot(x_results, y_results);
hold on;

%%%%%%%%%%%%%%%%%%%%
%NB: read MEE!!!!!
%%%%%%%%%%%%%%%%%%%
%in the figure, if we wanted more clearly defined fingers, we would have
%1 spline per finger. This would follow the idea presented in the book
%for non-continuity at some points,
%and I would use the peaks of v,w

%[~,peaks_indeces] = findpeaks(w);
%[~,mins_indeces] = findpeaks(1.01*max(w) - w);
