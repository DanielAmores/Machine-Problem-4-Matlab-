H = input ('intial height in meters:' );
V = input ('velocity in m/s:' );
angle = input ('angle in degrees with +x-axis:' );
ax = input ('accleration in x-component:' );
ay = input ('accleration in y-component:' );

if ay == 0
    error('invalid input')
end
 

time = max(roots([(ay/2),V*sind(angle),H]));
c = 0:0.01:time+1;    
a = zeros(1,length(c)+1);
b = zeros(1,length(c)+1);

time=0.01;
a(1)=0;
b(1)=H;

for i = 1:length(c)-1
    timex = ((ax*(time^2))/2) + (V*cosd(angle)*time);
    timey = ((ay*(time^2))/2) + (V*sind(angle)*time) + H;
    a(i+1) = timex;
    b(i+1) = timey;
    time=time+0.01;
end

a(length(c)+1)=(ax/2)*time^2 + V*cosd(angle)*0.01;
b(length(c)+1)=0;


plot(a,b,'k')
xlim([0 max(a)+1])
ylim([0 max(b)+1])
xlabel('Range')
ylabel('Height')
title('Motion')
grid on







