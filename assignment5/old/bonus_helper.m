function bonus_helper(x,y)
z_i = cubic_splines_z(x,y);
S_i = @(xx) cubic_splines_pval(x,y,z_i,xx);

lim_1 = min(x):0.001:max(x);
plot(lim_1, arrayfun(S_i,lim_1),'color','r');
hold on;