V_B=...;  %Battery voltage in volts 
R=...;  %limiting current resistor in ohms
V_gamma=...;  %Diode cut-in voltage in Volts 
w=2*pi*50; %angular frequency in rad/s 
t=linspace(0,0.02,360); %time interval for the plot
theta=rad2deg(t*w); %the angle theta 
v_s=24.*sind(theta); %the input signal; 
for n=1:360 
   if (v_s(n)>=V_gamma+V_B)  %forward bias condition 
      i_diode(n)=(v_s(n)-(V_gamma+V_B)).*1000/R; %diode current in mA 
                     %when in conduction 
     v_diode(n)=V_gamma; %diode voltage when conducting is simply
               %the cut-in voltage   
        else
        v_diode(n)=v_s(n)-V_B;  %reverse bias condition 
                  % is the sum of the battery voltage and 
                 %source voltage-the polarity   
                %of the source changes making the two                               
               %voltages additive in the negative   
             %direction   
i_diode(n)=0;   
end
end
figure %plotting the graphs
 subplot(2,1,1) 
 plot(theta,v_s,'b',theta,v_diode,'g');
 grid on 
 set(gca,'XAxisLocation','origin','YAxisLocation','origin')%Matlab version newer than 2015
 title('Source Voltage and Diode Voltage');
 xlabel('Conduction angle in Degrees');
 ylabel('Voltage in Volts)'); 
 legend('Input signal V_s in Volts','diode voltage v_d in Volts');
 subplot(2,1,2)
plot(theta,i_diode,'r'); 
title('Diode Current');
 xlabel('Conduction angle in Degrees');  
 ylabel('Diode Current in mA)'); 
 legend('diode current i_d in mA'); 
 grid on
set(gca,'XAxisLocation','origin','YAxisLocation','origin')% matlab version newer than 2015  
