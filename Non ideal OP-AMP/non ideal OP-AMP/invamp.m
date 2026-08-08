function [vo] = noninvamp(Avc,Av,Ib,Vio,Rid,Ro,R2,vi)
B = 1/(1 - Avc);
R1 = R2/(1/B - 1);
num = vi*Avc + Ib*R2 + Vio/B;
den = 1 + 1/(Av*B) + Ro/(Av*R2*B) + R2/(Av*Rid);
vo = num/den;
endfunction