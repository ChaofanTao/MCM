function [y,fval]=fenpei(C)%CΪָ��n*nϵ������
C=C';
f=C(:);%����һ������������ΪĿ�꺯��ϵ����matlabĬ����������
[m,n]=size(C);
Aeq=zeros(2*n,n*n);%2*n����ʽԼ����n*n������
for i=1:n  %���������ɵ��Ǻ��ĸ���ʽԼ���������
    Aeq(1:n,1+(i-1)*n:i*n)=eye(n,n);
end
for i=1:n  %ǰ�ĸ���ʽԼ�������
    Aeq(i+n,1+(i-1)*n:i*n)=ones(1,n);
end
beq=ones(2*n,1);
lb=zeros(n*n,1);
ub=ones(n*n,1);
x=linprog(f',[],[],Aeq,beq,lb,ub);%���Թ滮����
y=reshape(x,n,n);%����ʽ�����xֵ���n�׾���
y=y';%��ʽ���ɵ��ǰ������еģ�����ת��һ��
y=round(y);%��yԪ��ȡ��������ƥ�����
sol=zeros(n,n);
for i=1:n
    for j=1:n
        if y(i,j)==1
            sol(i,j)=C(j,i);%ƥ�����
        end
    end
end
fval=sum(sol(:));%��Сֵ��Ŀ�꺯��ֵ