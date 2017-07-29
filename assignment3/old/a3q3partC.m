n = 4;
l = 2*n+1
A = zeros(l,l);
b = zeros(l,1);
d_elements = randn(1,l);
a_elements = randn(1,l);
d_elements(1) = 1e-13;
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
    b(k) = A(k,k) + A(k,i)
  end
end
%fill solution
x = ones(l,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% calculate relative errors %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

genp_error = (norm(x-genp(A,b))^2)/norm(x)^2
gepp_error = (norm(x-gepp(A,b))^2)/norm(x)^2
