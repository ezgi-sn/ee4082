clc;
clear all;
N = 2;
for i=1:4*N+1
    if(i==5)
        Z(i) = 1;
    else
        Z(i) = 0;
    end
end
Z=transpose(Z);
samples = [-0.03, 0.1, 1.0, 0.2, -0.1];
x = zeros(4*N+1,2*N+1); %dim of the x must be 4n+1*2n+1
y = [transpose(samples); 0; 0; 0; 0 ]; 

for ii=1:2*N+1
   x(:,ii) = y;
   y(end) = [];
   y = [0;y];
end

R_xz = transpose(x)*Z;
R_xx = transpose(x)*x;

c = inv(R_xx)*R_xz;

samples = [0.01, 0.02, -0.03, 0.1, 1.0, 0.2, -0.1, 0.05, 0.02, 0,0];

z(1) = c(1)*samples(3)+c(2)*samples(2)+c(3)*samples(1);
z(2) = c(1)*samples(4)+c(2)*samples(3)+c(3)*samples(2)+c(4)*samples(1);
for ii = 3:9
    z(ii) = c(1)*samples(ii+2)+c(2)*samples(ii+1)+c(3)*samples(ii)+c(4)*samples(ii-1)+c(5)*samples(ii-2);
end
k=-4;
for i=1:9
    str = 'The value of output pulse at time t= ';
    msg = [str, num2str(k), ':', num2str(z(i))];
    k=k+1;
    disp(msg);
    
end

isi = z;
isi(5) = [];
isi = abs(isi);
str = 'Largest magnitude sample contributing to ISI: ';
msg = [str, num2str(max(isi))];
disp(msg);

str = 'Sum of all ISI magnitudes: ';
msg = [str, num2str(sum(isi))];
disp(msg);