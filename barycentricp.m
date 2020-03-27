function p = barycentricp(X,Y,t)
% barycentric�������������Ĳ�ֵ�����в�ֵ��
%�������
%   X Ϊ�������Ĳ�ֵ��
%   Y Ϊ������ֵ���Ӧ�ĺ���ֵ
%   t Ϊ��Ҫ����ֵ�ĵ�����
%�������
%   p Ϊ��t���Ĳ�ֵ����ֵ

n=length(X)-1
w =1./prod(ones(n+1,1)*X-X.'*ones(1,n+1)+eye(n+1),1)
numer = t.'*ones(1,n+1)-ones(length(t),1)*X
[r,c] = find(numer==0)
p(r) = Y(c)
local = sum(numer==0,2)
r2 = find(local==0)
p(r2) = (w.*Y*(1./numer(r2,:)).')./(w*(1./numer(r2,:)).')
%��һ�����Ĳ�ֵ��ʽ
% p(r2)=prod(numer(r2,:),2).'.*(w.*Y*(1./numer(r2,:)).')
end