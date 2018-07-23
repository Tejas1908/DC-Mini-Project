clc;
close all;
EbN0dB=-10:1:24;             % Normalised Carrier-to-noise ratio in decibel(dB)
EbN0lin=10.^(EbN0dB/10);     % Normalised Carrier-to-noise ratio
 
figure(1);
%BASK                           
BASK = 0.5*erfc(sqrt(EbN0lin));
semilogy(EbN0dB,BASK,'k*-');
hold on;

%4-ASK
ASK_4 = (3/8)*erfc(sqrt((6*EbN0lin/15)));
semilogy(EbN0dB,ASK_4,'m*-');
hold on;

%8-ary ASK
ASK_8 = 7*erfc(sqrt(9*EbN0lin/63))/24;
semilogy(EbN0dB,ASK_8,'b*-');
hold on;

%16-ary ASK
ASK_16 = 15*erfc(sqrt(12*EbN0lin/255))/64;
semilogy(EbN0dB,ASK_16,'r*-');
hold on;


ylim([10^-7,10^0]);
xlim([0,25]);
legend('BASK','4-ary ASK','8-ary ASK','16-ary ASK','Location','NorthEast');
xlabel('Eb/N0 in dB');
ylabel('Probability of BER for M-ASK');
title('Probablity of BER for M-ASK');
grid on;
