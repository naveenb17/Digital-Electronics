clc
close all
clear all

x = [1 2 3 1];
h = [1 1 1 1];

%%%% performing circular convolution %%%%%

N = max(length(x), length(h));

if(length(x) < length(h))
    x = [x, zeros(1, N - length(x))];
end

if(length(x) > length(h))
    h = [h, zeros(1, N - length(h))];
end

y = zeros(1, N);

for m = 0:N-1
    for n = 0:N-1
        z = mod(m-n, N);
        y(m+1) = y(m+1) + x(n+1).*h(z+1); 
    end
end

stem(y);
xlabel('x(n)*h(n)');
ylabel('samples');



