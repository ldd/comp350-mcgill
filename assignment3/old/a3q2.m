function x = testp(n)
% genp.m Gaussian elimination with no pivoting
%
% input: A is an n x n nonsingular matrix
% b is an n x 1 vector
% output: x is the solution of Ax=b.
%
c = 0
for i = 1: n
  for j = i:n
    for k = j:n
      c = c+1
    end
  end
end
