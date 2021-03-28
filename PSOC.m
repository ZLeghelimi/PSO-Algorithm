N=2; 
Iterations=10; 
Popsize=50; 
w=1;
c1=2;
c2=2;

LB=[2 6];
UB=[10 8];

for i=1:Popsize
        for j=1:N
            x(i,j)=LB(j)+rand()*(UB(j)-LB(j));
        end
end


v=x*0.1;

for i = 1: Popsize
    G(i)=objectivefunc(x(i,:));
end


fitness = G';
[gBestf,index]=max(fitness);

gBest=x(index,:);
lBest=x;

 for i=1:Iterations; 
 
    r1=rand (Popsize,N);
    r2=rand (Popsize,N);
    
    v=v+w*v+c1*r1.*(lBest-x)+c2*r2.*(ones(Popsize,1)*gBest-x);
    x=x+v;
    
    s=x(:,1);
    t=x(:,2);
    
    s(s>UB(1))=UB(1);
    s(s<LB(1))=LB(1);
    t(t>UB(2))=UB(2);
    t(t<LB(2))=LB(2);
    
    x(:,1)=s;
    x(:,2)=t;
        
    for j = 1: Popsize
        G(j)=objectivefunc(x(j,:));
        if G(j)>=fitness(j)
           fitness(j)=G(j);
          lBest(j,:)=x(j,:);
        end
         
    end
    
    [gBestf,index]=max(fitness);
     gBest=lBest(index,:);
      fprintf('Meilleur QS et QC dans la %d. generation est: QS = %d  QC= %d est le gout est : G = %d \n',i,gBest(1),gBest(2),gBestf); 
 end
 
 
