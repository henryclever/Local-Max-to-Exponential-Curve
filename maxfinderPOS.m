function [ maxplotter ] = maxfinderPOS(sh1,heavy1)
th1=1:sh1;th1=th1';
fmh1=zeros(sh1,5);
fmh1(:,1)=th1;
fmh1(:,2)=heavy1(:,1);
zz=0;
    for i=1:sh1
        j=heavy1(i,1);
        if zz<=j
            fmh1(i,3)=j;
        end 
        zz=j;
    end
    for i=1:sh1
        if fmh1(i,1)<=sh1-2
            if fmh1(i+1,3)==0
                fmh1(i,4)=fmh1(i,3);
            end
        end
    end
maxplotter=zeros(12,2);
zzz=1;
for i=1:sh1;
    if fmh1(i,4)~=0
        maxplotter(zzz,1)=fmh1(i,1);
        maxplotter(zzz,2)=fmh1(i,4);
        zzz=zzz+1;
    end
end
maxplotter(:,1)=maxplotter(:,1)./50;
for i=1:sh1-1
    fmh1(i,5)=fmh1(i+1,2)-fmh1(i,2);
end
%plot(fmh1(:,1)./50,fmh1(:,5),'k-');hold on

fmh1
end
    