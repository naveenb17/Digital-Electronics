close all % Close all instances
clc % Clear the Command Window

% Read the entire audio file
[x, Fs] = audioread('Billie Eilish - Ocean Eyes (Official Music Video).mp3');
% Extract a portion of the audio file
start_sec = 1;                              % start time in seconds
end_sec = 15;                               % end time in seconds
start_sample = round(start_sec * Fs);       % convert start time to sample index
end_sample = round(end_sec * Fs);           % convert end time to sample index
x = x(start_sample:end_sample, :);          % extract portion of audio data
x = x(:, 1);
N = length(x);
t = (0:N-1)/Fs;
J = fft(x, N)/N;                            %fft of input audio file
f = Fs*(0:N/2)/N;

%%%%% Define filter specifications %%%%%%%%%
fc = [500 3000 6000 15000];                 % center frequencies (Hz)
bw = [300 1000 2000 4000];                  % bandwidths (Hz)

%%%%%% low pass filter preset %%%%%%%%%
b = zeros(4, 17);
gain = [-3 0 0 0]; % gains (dB)
%for band 1 : centre frequency fc = 500Hz
%             bandwidth BW = 300
%             400 - 600hz
%             [fc(1) - bw(1)/2, fc(1)+bw(1)/2]
b(1, :) = fir1(16, fc(1)*2/Fs,  'low');
b(1, :) = gain(1)*b(1, :);
y1 = filter(b(1, :), 1, x);

figure(5);
subplot(2,1,1)
H = fft(y1);
plot(f, abs(H(1:N/2+1)));
title('Band 1 with Filter');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([390 610]);
grid on;

subplot(2,1,2);
plot(f, abs(J(1:N/2+1)));
title("Band 1 without Filter");
xlabel('frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([390 610]);
grid on;
sgtitle('Low Pass Filter');

%for band 2 : centre frequency fc = 3000Hz
%             bandwidth BW = 1000 
%             [fc(2) - bw(2)/2, fc(2)+bw(2)/2]
b(2, :) = fir1(16, [fc(2)-bw(2) fc(2) + bw(2)]*2/Fs,  'stop');
b(2, :) = gain(2)*b(2, :);
y2 = filter(b(2, :), 1, x);

figure(6);
subplot(2,1,1)
H = fft(y2);
plot(f, abs(H(1:N/2+1)));
title('Band 2 with filter');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([1900 4100]);
grid on;

subplot(2,1,2);
plot(f, abs(J(1:N/2+1)));
title("Band 2 without filter");
xlabel('frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([1900 4100]);
grid on;
sgtitle('Low Pass Filter');

%for band 3 : centre frequency fc = 6000Hz
%             bandwidth BW = 2000
%             [fc(3) - bw(3)/2, fc(3)+bw(3)/2]
b(3, :) = fir1(16, [fc(3)-bw(3) fc(3) + bw(3)]*2/Fs,  'stop');
b(3, :) = gain(3)*b(3, :);
y3 = filter(b(3, :), 1, x);

figure(7);
subplot(2,1,1)
H = fft(y3);
plot(f, abs(H(1:N/2+1)));
title('Band 3 with filter');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([3900 8100]);
grid on;

subplot(2,1,2);
plot(f, abs(J(1:N/2+1)));
title("Band 3 without filter");
xlabel('frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([3900 8100]);
grid on;
sgtitle('Low Pass Filter');

%for band 4 : centre frequency fc = 15000Hz
%             bandwidth BW = 4000
%             [fc(4) - bw(4)/2, fc(4)+bw(4)/2]
b(4, :) = fir1(16, fc(4)*2/Fs,  'high');
b(4, :) = gain(4)*b(4, :);
y4 = filter(b(4, :), 1, x);


figure(8);
subplot(2,1,1)
H = fft(y4);
plot(f, abs(H(1:N/2+1)));
title('Band 4 with filter');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([10900 19100]);
grid on;

subplot(2,1,2);
plot(f, abs(J(1:N/2+1)));
title("Band 4 without filter");
xlabel('frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([10900 19100]);
grid on;
sgtitle('Low Pass Filter');

y = (y1+y2+y3+y4)/4; 
filename = 'lowpassoutput.wav';
audiowrite(filename, y, Fs);

%plots to compare outputs
figure(1);                       
%comparing time domain outputs
subplot(2,1,1);                  
plot(t, x);
title('Unfiltered');
xlabel('time(s)');
ylabel('amplitude (dB)');
grid on;
ylim([-1 1]);

subplot(2,1,2);
plot(t, y);
title('Filtered');
xlabel('time(s)');
ylabel('amplitude (dB)');
grid on;
ylim([-1 1]);
sgtitle('Low Pass Filter(Time domain analysis)');

%comparing freq domain outputs
figure(2);
subplot(2,1,1);
plot(f, abs(J(1:N/2+1)));
title("Input signal");
xlabel('freq(Hz)');
ylabel('Magnitude(dB)');
grid on;

subplot(2,1,2);
n = length(y);
K=fft(y, n)/n;               %fft of filtered audio file
FF=Fs*(0:n/2)/n;
plot(FF, abs(K(1:n/2 + 1)));
title("filtered freq spectrum");
xlabel('freq(Hz)');
ylabel('Magnitude(dB)');
grid on;

linkaxes([subplot(2,1,1), subplot(2,1,2)], 'xy');
sgtitle('Low Pass Filter(Frequency domain analysis)');

%%%%%% high pass filter preset %%%%%%%%%
b = zeros(4, 17);
gain = [0 2 3 2]; % gains (dB)
%for band 1 : centre frequency fc = 500Hz
%             bandwidth BW = 300
%             400 - 600hz
%             [fc(1) - bw(1)/2, fc(1)+bw(1)/2]
b(1, :) = fir1(16, fc(1)*2/Fs,  'low');
b(1, :) = gain(1)*b(1, :);
y1 = filter(b(1, :), 1, x);

figure(9);
subplot(2,1,1)
H = fft(y1);
plot(f, abs(H(1:N/2+1)));
title('Band 1 with filter');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([390 610]);
grid on;

subplot(2,1,2);
plot(f, abs(J(1:N/2+1)));
title("Band 1 without filter");
xlabel('frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([390 610]);
grid on;

sgtitle('High Pass Filter');

%for band 2 : centre frequency fc = 3000Hz
%             bandwidth BW = 1000 
%             [fc(2) - bw(2)/2, fc(2)+bw(2)/2]
b(2, :) = fir1(16, [fc(2)-bw(2) fc(2) + bw(2)]*2/Fs,  'stop');
b(2, :) = gain(2)*b(2, :);
y2 = filter(b(2, :), 1, x);

figure(10);
subplot(2,1,1)
H = fft(y2);
plot(f, abs(H(1:N/2+1)));
title('Band 2 with filter');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([1900 4100]);
grid on;

subplot(2,1,2);
plot(f, abs(J(1:N/2+1)));
title("Band 2 without filter");
xlabel('frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([1900 4100]);
grid on;

sgtitle('High Pass Filter');
%for band 3 : centre frequency fc = 6000Hz
%             bandwidth BW = 2000
%             [fc(3) - bw(3)/2, fc(3)+bw(3)/2]
b(3, :) = fir1(16, [fc(3)-bw(3) fc(3) + bw(3)]*2/Fs,  'stop');
b(3, :) = gain(3)*b(3, :);
y3 = filter(b(3, :), 1, x);

figure(11);
subplot(2,1,1)
H = fft(y3);
plot(f, abs(H(1:N/2+1)));
title('Band 3 with filter');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([3900 8100]);
grid on;

subplot(2,1,2);
plot(f, abs(J(1:N/2+1)));
title("Band 3 without filter");
xlabel('frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([3900 8100]);
grid on;

sgtitle('High Pass Filter');

%for band 4 : centre frequency fc = 15000Hz
%             bandwidth BW = 4000
%             [fc(4) - bw(4)/2, fc(4)+bw(4)/2]
b(4, :) = fir1(16, fc(4)*2/Fs,  'high');
b(4, :) = gain(4)*b(4, :);
y4 = filter(b(4, :), 1, x);

figure(12);
subplot(2,1,1)
H = fft(y4);
plot(f, abs(H(1:N/2+1)));
title('Band 4 with filter');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([10900 19100]);
grid on;

subplot(2,1,2);
plot(f, abs(J(1:N/2+1)));
title("Band 4 without filter");
xlabel('frequency(Hz)');
ylabel('Magnitude(dB)');
xlim([10900 19100]);
grid on;

sgtitle('High Pass Filter');

y = (y1+y2+y3+y4)/4; 
filename_2 = 'highpassoutput.wav';
audiowrite(filename_2, y, Fs);

%%%%    plots to compare outputs   %%%%%

%comparing time domain outputs
figure(3);
subplot(2,1,1);
plot(t, x);
title('Unfiltered');
grid on;
xlabel('time(s)');
ylabel('amplitude(dB)');
ylim([-1 1]);


subplot(2,1,2);
plot(t, y);
title('Filtered');
xlabel('time(s)');
ylabel('amplitude(dB)');
grid on;
ylim([-1 1]);
sgtitle('High Pass Filter(Time domain analysis)');

%comparing freq domain outputs
figure(4);
subplot(2,1,1);
plot(f, abs(J(1:N/2+1)));
title("Input signal");
xlabel('freq(Hz)');
ylabel('Magnitude(dB)');
grid on;

subplot(2,1,2);
plot(FF, abs(K(1:n/2 + 1)));
title("filtered freq spectrum");
xlabel('freq(Hz)');
ylabel('Magnitude(dB)');
grid on;

linkaxes([subplot(2,1,1), subplot(2,1,2)], 'xy');
sgtitle('High Pass Filter(Frequency domain analysis)');


