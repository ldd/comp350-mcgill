function x = genp(A,b)
% genp.m Gaussian elimination with no pivoting
%
% input: A is an (2n+1) x (2n+1) nonsingular matrix
% b is a (2n + 1) x 1 vector
% output: x is the solution of Ax=b.
%
  l = length(b);
  n = (l-1)/2;
  for k = 1:n
    i = l+1-k;
    mult = A(i,k)/A(k,k);
    A(i,i) = A(i,i) - mult*A(k, i);
    b(i) = b(i) - mult*b(k);
  end
  x = zeros(l,1);
  x(l) = b(l)/A(l,l);
  for k = l-1:-1:1
    x(k) = (b(k) - A(k,k+1:l)*x(k+1:l))/A(k,k);
  end
