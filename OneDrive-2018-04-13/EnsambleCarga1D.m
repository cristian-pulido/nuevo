function b = EnsambleCarga1D(x,f)
n = length(x)-1;
b = zeros(n+1,1);
for i = 1:n
	h = x(i+1) - x(i);
	b(i) = b(i) + feval(f,x(i))*h/2;
	b(i+1) = b(i+1) + feval(f,x(i+1))*h/2;
end
