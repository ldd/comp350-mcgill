function [result,count] = composite_gaussian(f,a,b,n)
	h = (b-a)/n;
	result = 0;
	count = 0;
	for k = 1:n
		result = result + f((2*a+ (2*k-1)*h)/2+h/(2*sqrt(3))) + f((2*a+ (2*k-1)*h)/2-h/(2*sqrt(3)));
		%we make 2 function calls above
		count = count + 2;
 	end
	result = result*h/2;

