%Umbrela simulation$
clear
clc
p=0.3%Raining probability change it depending of the problem

P=[(1-p),p,0;p*(1-p),(1-p)^2+p^2,(1-p)*p;0,p*(1-p),1-p*(1-p)]%Tansition matrix
n=50000;%number of days
P_n=P^n;
X_n=transpose(P_n(1,:))%Stationary probability.

P_wet=p*X_n(1)+p*X_n(3)%Prob. of getting wet is that it rains in the evening with all the umbrellas at home or
% it rains in the morning with all the umbrellas at the office



