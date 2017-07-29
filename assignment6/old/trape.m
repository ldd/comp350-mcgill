function I_T = trape(fname,a,b,n)
	h = (b-a)/n;
	x = linspace(a,b,n+1);
	f=feval(fname,x);
	I_T = (sum(f(2:n))+(f(n+1))/2)*h;

