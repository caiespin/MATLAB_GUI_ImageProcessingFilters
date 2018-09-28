function Histograma_Acum(J)

[f c p]=size(J);

if p==1
I=J;
else
I=rgb2gray(J); 
end

[f c]=size(I);
h=zeros(256,2);
g=zeros(256,2);
II=zeros(f,c);
for k=1:256
   h(k,1)=k;
   g(k,1)=k;
end
for i=1:f
    for j=1:c
        v=I(i,j);
        h(v+1,2)=h(v+1,2)+1;
    end
end
for k=1:256
    h(k,3)=sum(h(1:k,2));
end
figure
bar (h(1:256,3))
title('Histograma Acumulado')