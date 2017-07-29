function [numI,count] = adapt_simpson(f, a, b, tolerance, level, level_max)

	%persistance needed to count the number of function calls
	persistent simpson_count;
	if(isempty(simpson_count))
	    simpson_count = 0;
	end
	%calls to f at a,b,c,d and e
	simpson_count = simpson_count +5;

	%actual adaptive simpson algorithm
	h = b-a;
	c = (a + b)/2;
	%minimize some function calls
 	[fa,fb,fc] = deal(f(a), f(b), f(c));
	I1 = h*[fa + 4*fc + fb]/6;
	level = level + 1;
	d = (a + c)/2;
	e = (c + b)/2;
	%minimize other function calls
 	[fd,fe] = deal(f(d), f(e));
	I2 = h*[fa + 4*fd + 2*fc + 4*fe + fb]/12;
	if (level >= level_max)
		numI = I2;
	else
		if (abs(I2 - I1) <= 15*tolerance) 
			numI = I2 + 1/15*(I2 - I1);
		else
			left  = adapt_simpson(f, a, c, tolerance/2, level, level_max);
	       		right = adapt_simpson(f, c, b, tolerance/2, level, level_max);
			numI = left + right;
		end 
	end
	count = simpson_count;
