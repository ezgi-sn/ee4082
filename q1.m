samples = [ 0.1, 0.3, -0.2, 1.0, 0.4, -0.1, 0.1 0];
X = [1 -0.2 0.3; 0.4 1 -0.2;-0.1 0.4 1];
Z = [0;1;0];
c = (X^-1)*Z;

z(1) = c(1)*samples(2)+c(2)*samples(1)+c(3)*0;
for ii = 2:7
    z(ii) = c(1)*samples(ii+1)+c(2)*samples(ii)+c(3)*samples(ii-1);
end

isi = z;
isi(4) = [];
isi = abs(isi);
str = 'Largest magnitude sample contributing to ISI: ';
msg = [str, num2str(max(isi))];
disp(msg);

str = 'Sum of all ISI magnitudes: ';
msg = [str, num2str(sum(isi))];
disp(msg);

