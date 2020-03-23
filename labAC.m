%To get Information About Audio File
%info = audioinfo('eric.wav')

%Read Audio File
[Y,Fs] = audioread('eric.wav');



%Spectrum of audio file
N = length(Y);          % number of samples
F = (0:N-1)*(Fs/N);     % frequency range
power = abs(fft(Y)).^2/N;    % power of the DFT

subplot(3,1,1);
plot(F,power)
xlabel('Frequency')
ylabel('Power')
title('Plot spectrum of audio file');


%design low pass filter
Fc = 4e3;  %Cut of frequency
low_passF = rectangle('Position',[0 0 Fc 1]);

Y_filter = Y.*low_passF;
subplot(3,1,2);
plot(Y_filter);
title('Plot filtered audio file');


%signal after low pass filter in time domain           
t = linspace(0,length(Y_filter)/Fs,length(Y_filter));  
subplot(3,1,3);
plot(t,Y);
title('Plot filtered audio file in time domain');

%mean squre error
