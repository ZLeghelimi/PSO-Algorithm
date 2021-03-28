function [ res ] = objectivefunc(x)

QS=x(1);
QC=x(2);
   
       res=(sqrt(QS)- (QC.^2))/(log(QC)*cos(QS));
end