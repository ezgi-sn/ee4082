N=9;
for ii=1:2*N-1
    if(ii==N)
        z(ii)=1
    else
        z(ii)=0
    end
end
samples = [0.01, 0.02, -0.03, 0.1, 1.0, 0.2, -0.1, 0.05, 0.02];

y = [transpose(samples); 0; 0; 0; 0; 0; 0; 0; 0]; 
x = zeros(2*N-1,N);
for(ii=1:9)
   x(:,ii) = y;
   y(end) = [];
   y=[0;y];
end