% Using entropy weight method to find the index weight
% R is the input matrix, weight vector weights

function weights = EntropyWeight(R)
% get the size of the matrix, rows for the number of objects
% cols forindex number
[rows,cols]=size(R); 
h=1/log(rows);
F=zeros(rows,cols);   
sumBycols=sum(R,1);   
% calculate F
for i=1:rows
  for j=1:cols
      F(i,j)=R(i,j)./sumBycols(1,j);
  end
end

entropy=zeros(rows,cols);
% calculate entropy
for i=1:rows
  for j=1:cols
      if F(i,j)==0
          entropy(i,j)=0;
      else
          entropy(i,j)=log(F(i,j));
      end
  end
end

Hj=-h*(sum(F.*entropy,1)); % Calculate the entropy value Hj
weights=(1-Hj)/(cols-sum(Hj));
end