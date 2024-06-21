%BARBER SHOP
clear
clc

%parameters
s=2;%number of barbers.Nº of servers 
Qs=2;%Number of chairs.Queue size
capacity=s+Qs;%System capacity
lam=1/12;% Arrival rate clients/minute
mu=1/30;%Service rate clients/minute
time=180;%Sim time in min

%Initial state
L=0;%clients in the system.
Ls=0;%clients being served.

%sim loop
% We create an array for the costumers with as many entries as sim time to
% allocate the data.
Ls_array=zeros(1,time+1);
L_array=  zeros(1,time+1);
t=0;%initial time

for i =1:time
    %ARRIVALS
    if rand()<lam
        if L<capacity
            L=L+1;
        end
    end
    %DEPARTURES
    if rand()<mu&&Ls>0
        Ls=Ls-1;
    end
    while Ls<s&&L>0
        L=L-1;
        Ls=Ls+1;
    end
    %Store data
    Ls_array(i+1)=Ls;
    L_array(i+1)=L;
    t=t+1;
end
%Plotting
x=0:time;
figure
plot(x,L_array,"r")
ylabel("Nº of costumers")
hold on
plot(x,Ls_array,"g")
legend("Costumers in the shop","Costumers being attended")
xlabel("Time in min")
grid on
hold off

%Now we can use the Q matrix to dermine the probability of reaching each
%state after the Simulation time.
Q=[-lam,lam,0,0,0;
    mu,-mu-lam,lam,0,0;
    0,2*mu,-2*mu-lam,lam,0;
    0,0,2*mu,-2*mu-lam,lam;
    0,0,0,2*mu,-2*mu]
I=eye(5);
V_t=I*expm(Q*time)
S1=sum(V_t(:,1))/5
S2=sum(V_t(:,2))/5
S3=sum(V_t(:,3))/5
S4=sum(V_t(:,4))/5
S5=sum(V_t(:,5))/5