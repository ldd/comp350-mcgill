function S = cublic_splines_pval(t,y, z, x)
% 
% input  z:  coefficient vector 
%        t:  a vector
%        y:  a vector
%        x:  where the cubic splines method will be evaluated
% output S: result at x

n = length(t);
for i = 1:n-1
  if(x-t(i+1)<=0)
    break;
  end
end
h = t(i+1) -t(i);
B = -h*z(i+1)/6 - h*z(i)/3 + (y(i+1) - y(i))/h;
D = (z(i+1) - z(i))/(6*h);
S = y(i) +(x-t(i))*(B+(x-t(i))*(z(i)/2+(x-t(i))*D));
