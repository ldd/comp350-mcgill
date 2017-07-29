n = 4;
l = 2*n+1;
genp_smaller = 0;
genp_bigger = 0;
genp_equal = 0;
for z = 1: 1000
A = zeros(l,l);
b = zeros(l,1);
d_elements = randn(1,l);
a_elements = randn(1,l);
%d_1 must be very small
%a_{n+1} must be equal to d_{n+1}
a_elements(n+1) = d_elements(n+1);
%fill out A
for k = 1:l
 A(k,k) = d_elements(k);
 i = l+1-k;
 A(i,k) = a_elements(i);
end
%fill out b
for k = 1:l
  if( k == n+1)
    b(k) = A(k,k);
  else  
    i = l+1-k;
    b(k) = A(k,k) + A(k,i);
  end
end
%fill solution
x = ones(l,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% calculate relative errors %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
genp_result = genp(A,b);
gepp_result = gepp(A,b);
norm_2_genp = 0;
norm_2_gepp = 0;
norm_2_x = 0;
for k = 1:l
  norm_2_genp = norm_2_genp + (x(k) - genp_result(k))^2;
  norm_2_gepp = norm_2_gepp + (x(k) - gepp_result(k))^2;
  norm_2_x = norm_2_x + x(k)^2;
end
norm_2_genp = norm_2_genp^0.5;
norm_2_gepp = norm_2_gepp^0.5;
norm_2_x = norm_2_x^0.5;

genp_error = norm_2_genp/norm_2_x;
gepp_error = norm_2_gepp/norm_2_x;
if(genp_error < gepp_error)
 genp_smaller = genp_smaller + 1;
elseif (genp_error > gepp_error)
 genp_bigger = genp_bigger + 1;
else
 genp_equal = genp_equal + 1;
end

end
%printing data
fprintf('genp_error smallest: \t%d/1000\n', genp_smaller)
fprintf('both are equal: \t%d/1000\n', genp_equal)
fprintf('genp_error biggest: \t%d/1000\n', genp_bigger)
