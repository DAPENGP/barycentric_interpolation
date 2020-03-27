function p = barycentricr(X,Y,d,t)
% barycentric�������������Ĳ�ֵ�����в�ֵ��
%�������
%   X Ϊ�������Ĳ�ֵ��
%   Y Ϊ������ֵ���Ӧ�ĺ���ֵ
%   d Ϊ���������ֵ��dֵ
%   t Ϊ��Ҫ����ֵ�ĵ�����
%�������
%   p Ϊ��t���Ĳ�ֵ����ֵ

n=length(X)-1
w=[];
for k = 0:n
    Jk = [];
    for j = 0:n-d
        if j<=k && j>=k-d
            Jk = [Jk j]
        end
    end
    wk=0;
    for i = 1:length(Jk)
        nnumer = X(k+1)-X(Jk(i)+1:Jk(i)+d+1)
        nnumer(nnumer==0)=1
        wk = wk+(-1)^Jk(i)/prod(nnumer)
    end
    w=[w wk]
end

numer = t.'*ones(1,n+1)-ones(length(t),1)*X
[r,c] = find(numer==0)
p(r) = Y(c)
local = sum(numer==0,2)
r2 = find(local==0)
p(r2) = (w.*Y*(1./numer(r2,:)).')./(w*(1./numer(r2,:)).')
end