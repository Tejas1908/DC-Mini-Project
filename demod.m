 t1=0;
 t2=Tb;
 
 for i=1:N                          % For each signal element in the modulated (BASK) signal
     t=[t1:Tb/100:t2]               % the product of the carrier signal level and the corresponding 
     %correlator                    % modulated signal level is calculated , and the sum is found
    x=sum(c.*ask_sig(i,:));         % If sum > 0 , assign demod=1
     %decision device               % Else assign demod=0
     if x>0                         % demod is the demodulated signal obtained from BASK
    demod(i)=1;
     else
     demod(i)=0;
 end
 
 t1=t1+(Tb+.01);
 t2=t2+(Tb+.01);
 end
 
 % Plotting demodulated binary data bits
 subplot(5,1,5);
 stem(demod);
 title('BASK demodulated signal');
 xlabel('n');
 ylabel('b(n)');
 grid on 