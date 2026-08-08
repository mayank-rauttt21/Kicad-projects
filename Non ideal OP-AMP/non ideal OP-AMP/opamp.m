% This is a sample m-file to calculate the output voltage of an opamp
% considering also the effects of non-ideal parameters
clear
clc
Gain=1000; % required gain of the amplifier of an ideal opamp
Av=2e5;   % open loop gain of TL084
Ib=20e-9; % Bias current from datasheet
Vio=10e-6*50;  % for 50 deg. C temp swing
Rid=10e12; %Datasheet value of Rid
Ro=300; % Estimated from datasheet values
vi=1e-3; % Input voltage of 1mV
R2=100e3; %

vin=[]; vo_inv=[]; vo_non_inv=[];
j=1;
for i=1:0.1:10
vin(j)=vi*i;
vo_inv(j)=invamp(-Gain,Av,Ib,Vio,Rid,Ro,R2,vin(j));
vo_non_inv(j)=noninvamp(Gain,Av,Ib,Vio,Rid,Ro,R2,vin(j));
j=j+1;
endfor

e_inv= 100*(vin*(-Gain) - vo_inv)./(vin*(-Gain));
e_non_inv=100*(vin*Gain - vo_non_inv)./(vin*Gain);

plot(vin,e_inv,vin,e_non_inv), grid,title('ERROR versus INPUT'), xlabel('input, v'), ylabel('percentage error')