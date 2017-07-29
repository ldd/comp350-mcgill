
function x = gepp(A,b)
% genp.m GE with partial pivoting
% input: A is a (2n+1) x (2n+1) nonsingular matrix
% b is a (2n+1) x 1 vector
% output: x is the solution of Ax=b.
  l = length(b);
  n = (l-1)/2;
  for k = 1:n
    i = l+1-k;
    %we only need to compare with 1 other row
    %q = k;
    if ( abs(A(i,k)) > abs(A(k,k)) )
     %5 q = i;
    %end;
    A([k,i],k) = A([i,k],k);
    A([k,i],i) = A([i,k],i);
    b([k,i]) = b([i,k]);
    end;
    %end of comparison and change of rows

    mult = A(i,k)/A(k,k);
    A(i,i) = A(i,i) - mult*A(k,i);
    b(i) = b(i) - mult*b(k);
  end;
  x = zeros(l,1);
  x(l) = b(l)/A(l,l);
  for k = l-1:-1:1
    x(k) = (b(k) - A(k,k+1:l)*x(k+1:l))/A(k,k);
  end;
