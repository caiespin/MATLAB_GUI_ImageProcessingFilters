function Hough(J)

[x y z]=size(J);

if z==1
BW=J;
else
BW=rgb2gray(J); 
end


% clear all
% clc
% J=imread('holo.jpg'); 
% I=rgb2gray(J);
% 
% BW=edge(I,'canny',0.1,2);


[m n]=size(BW);
MRAcc=zeros(m,n);
Fin=zeros(m,n);
m2=m/2;
n2=n/2;
rmax=round(sqrt(m2*m2+n2*n2));
iA=pi/n;
ir=(2*rmax)/m;
for re=1:m
    for co=1:n
        if(BW(re,co))
            for an=1:n
                x=co-n2;
                y=re-m2;
                theta=an*iA;
                r=round(((x*cos(theta)+y*sin(theta))/ir)+m2);
                if((r>=0)&&(r<=m))
                    MRAcc(r,an)=MRAcc(r,an)+1;
                end
            end
        end
    end
end
Bandera=MRAcc>100;
pix=15;
for re=1:m
    for co=1:n
        if(Bandera(re,co))
            I1=[re-pix 1];
            I2=[re+pix m];
            I3=[co-pix 1];
            I4=[co+pix n];
            datxi=max(I1);
            datxs=min(I2);
            datyi=max(I3);
            datys=min(I4);
            Bloc=MRAcc(datxi:1:datxs,datyi:1:datys);
            MaxB=max(max(Bloc));
            if(MRAcc(re,co)>=MaxB)
                Fin(re,co)=255;
            end
        end
    end
end
[dx dy]=find(Fin);
[indx nada]=size(dx);
rm=m;
cn=n;
apunta=1;
M=zeros(rm,cn);
for dat=1:indx
    pr=dx(dat);
    pa=dy(dat);
    re2=round(rm/2);
    co2=round(cn/2);
    pvr=(pr-re2)*ir;
    pva=pa*(pi/cn);
    x=round(pvr*cos(pva));
    y=round(pvr*sin(pva));
    apunta=apunta+1;
    for c=x:1:co2
        r=round((-1*(x/y)*c)+y+(x*x/y))+re2;
        if((r>0)&&(r<rm))
            M(r,c+co2)=1;
        end
    end
    MRAcc=mat2gray(MRAcc);
    for c=x:-1:1-co2
        r=round((-1*(x/y)*c)+y+(x*x/y))+re2;
        if((r>0)&&(r<rm))
            M(r,c+co2)=1;
        end
    end
end
M=mat2gray(M);
% g1=uint8(MRAcc);
 g2=uint8(Fin);
 g3=uint8(M);
 hg=[0 1 2 1 0;1 3 5 3 1;2 5 9 5 2;1 3 5 3 1;0 1 2 1 0];
 hg=hg*(1/9);
 A=imfilter(g2,hg);
 
figure
subplot (2,2,1)
imshow(BW)
subplot(2,2,2)
imshow(MRAcc)
subplot(2,2,3)
imshow(A)
subplot(2,2,4)
imshow(M)