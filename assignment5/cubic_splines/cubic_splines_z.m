function z = cubic_splines_z(t,y)
%
% input
%   t:  vector
%   y:  vector
%
% output
%   a:  column vector containing the coefficients of the cubic splines
%       algorithm. Minor alteration to the algorithm found in
%       the notes/books: t_1, t_2, ... t_n (no t_0)

n = length(t);

for i = 1:n-1
    h(i) = t(i+1) - t(i);
    b(i) = (y(i+1) - y(i))/h(i);
end
% Forward elimination
u(2) = 2*(h(1) + h(2));
v(2) = 6*(b(2) - b(1));

for i =3:n-1 %3 used due to minor alterations to the algorithm
  u(i) = 2*(h(i-1) + h(i)) - h(i-1)*h(i-1)/u(i-1);
  v(i) = 6*(b(i) - b(i-1)) - h(i-1)*v(i-1)/u(i-1);
end

% Back substitution
z(n) = 0;
for i = n-1:-1:2
  z(i) = (v(i) - h(i)*z(i+1))/u(i);
end
z(1) = 0;
