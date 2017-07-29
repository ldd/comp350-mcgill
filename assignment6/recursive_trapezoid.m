function [I_T,counter] = recursive_trapezoid(f,a,b,tolerance)
	m = 1;
	h = b-a;
	IT_old = 0.5*h*[f(a) + f(b)];
	IT_new = IT_old;
	counter = 1;
	while (m == 1 || abs(IT_old - IT_new) > tolerance)
		m = 2*m;
		h = h/2;
		f_sum = 0;
		for j = 1: m/2
			x = a + (2*j-1)*h;
			f_sum = f_sum + f(x);
		end
		IT_old = IT_new;
		IT_new = IT_old/2 + h*f_sum;
		counter = counter + 1;
	end
	I_T = IT_new;	
