%use our cubic splines function
addpath('cubic_splines');

%code given by problem to get points from the screen
figure('position', get(0,'screensize'))
axes('position',[0 0 1 1])
[v,w] = ginput;

len = length(v);
%get peaks (high and low, for my fingers!
[~,peaks_indeces] = findpeaks(w);
[~,mins_indeces] = findpeaks(1.01*max(w) - w);
clf;

%%%%%%%%%%%%%%%%
% first finger %
%%%%%%%%%%%%%%%%
v_i = v(1:mins_indeces(1));
w_i = w(1:mins_indeces(1));
bonus_helper(v_i, w_i);

v_i = v(mins_indeces(1):peaks_indeces(1));
w_i = w(mins_indeces(1):peaks_indeces(1));
bonus_helper(v_i, w_i);

%%%%%%%%%%%%%%%%%%%%
% 3 middle fingers %
%%%%%%%%%%%%%%%%%%%%
for i=1:length(peaks_indeces)-1
    v_i = v(peaks_indeces(i):peaks_indeces(i+1));
    w_i = w(peaks_indeces(i):peaks_indeces(i+1));
    bonus_helper(v_i, w_i);
end

%%%%%%%%%%%%%%%%
% last finger %
%%%%%%%%%%%%%%%%
v_i = v(peaks_indeces(i):peaks_indeces(i+1)+2);
w_i = w(peaks_indeces(i):peaks_indeces(i+1)+2);
bonus_helper(v_i, w_i);

%%%%%%%%%%%%%%%%%%%
% lines for wrist %
%%%%%%%%%%%%%%%%%%%
plot([v(1),v(1)],[w(1),1]);
plot([v(len),v(len)],[w(len),1]);
