z = [0;0;1;0;0];
samples = [0.01, 0.02, -0.03, 0.1, 1.0, 0.2, -0.1, 0.05, 0.02];
samples = transpose(samples);

for ii=1:5
    x(ii,:) = [samples(ii+4) samples(ii+3) samples(ii+2) samples(ii+1) samples(ii)];
end

c = inv(x)*z;


samples = [0.01, 0.02, -0.03, 0.1, 1.0, 0.2, -0.1, 0.05, 0.02, 0,0];
Z(1) = c(1)*samples(3)+c(2)*samples(2)+c(3)*samples(1);
Z(2) = c(1)*samples(4)+c(2)*samples(3)+c(3)*samples(2)+c(4)*samples(1);
for ii = 3:9
    Z(ii) = c(1)*samples(ii+2)+c(2)*samples(ii+1)+c(3)*samples(ii)+c(4)*samples(ii-1)+c(5)*samples(ii-2);
end

k=-4;
for i=1:9
    str = 'The value of output pulse at time t=';
    msg = [str, num2str(k), ': ', num2str(Z(i))];
    k=k+1;
    disp(msg);
    
end

isi = Z;
isi(5) = [];
isi = abs(isi);
str = 'Largest magnitude sample contributing to ISI: ';
msg = [str, num2str(max(isi))];
disp(msg);

str = 'Sum of all ISI magnitudes: ';
msg = [str, num2str(sum(isi))];
disp(msg);