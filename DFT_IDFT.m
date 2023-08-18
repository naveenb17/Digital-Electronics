clc
clear all
close all
fs = 8000;
n = 0:3;
%%%%% discrete sample  %%%%%
x = [1 2 3 1 ];
h = [1 1 1 1 ];
subplot(3,1,1);
stem(n, x);
title('Discrete samples');
xlabel('index n');
%%%%% dft %%%%%%
N = 4;
k = 0:N-1;
Xk = dft(x, N);
Hk = dft(h, N);
Yk = Hk.*Xk;
f = k*fs/N;
subplot(3,1,2);
stem(f, abs(Xk)/N);
title('DFT');
xlabel('f(hz)');
%%%%   idft  %%%%
xk = zeros(1, N);
for n = 0:N-1
    for k = 0:N-1
        xk(n+1) = xk(n+1)+(Yk(k+1)*exp(i*2*pi*k*n/N)/N);
    end
end
n = 0:N-1;
subplot(3,1,3);
stem(n, xk);
title('IDFT');
xlabel('index');

