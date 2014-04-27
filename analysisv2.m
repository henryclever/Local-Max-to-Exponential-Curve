%Henry M. Clever
%4-17-14

clc;clear;
%here load your data set. should be 3 columns with position, load, accel
data1=load('heavy1.m');
data2=load('heavy2.m');

data1(:,2)=data1(:,2);
sh1=size(data1(:,1));sh1=sh1(1,1);
th1=1:sh1;th1=th1';th1=th1./50;

sh2=size(data2(:,1));sh2=sh2(1,1);
th2=1:sh2;th2=th2';th2=th2./50;


plot((1:sh1)./50,data1(1:sh1,1),'b-');hold on

%here's where we call out the local max finding function
fmh1=maxfinderPOS(sh1,data1);

%here you can manually choose what points you want to model the curve on
%throw out the ones that are not part of what you want by 
%making the interval smaller
x=fmh1(2:16,1);y=fmh1(2:16,2);

plot(x,y,'r.');hold on

%exponential regression
err = @(v) trapz(x,(y - v(1)+v(2).*exp(x./-v(3))).^2); 
[v,fval,exitflag,output] = fminsearch(err,[0.01 1 11],optimset('Tolx',1e-10,'MaxFunEvals',200000,'MaxIter',40000))
xcurve=1:800;xcurve=xcurve./50;
ycurve=v(1)-v(2).*exp((xcurve./-v(3)));
plot(xcurve,ycurve,'k--');hold on


xlabel('Time, Seconds');
ylabel('Position of superheavy weight');
