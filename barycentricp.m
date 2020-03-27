function p = barycentricp(X,Y,t)
% barycentric函数是利用重心插值法进行插值的
%输入参数
%   X 为所给定的插值点
%   Y 为所给插值点对应的函数值
%   t 为需要求函数值的点或点列
%输出参数
%   p 为在t处的插值函数值

n=length(X)-1
w =1./prod(ones(n+1,1)*X-X.'*ones(1,n+1)+eye(n+1),1)
numer = t.'*ones(1,n+1)-ones(length(t),1)*X
[r,c] = find(numer==0)
p(r) = Y(c)
local = sum(numer==0,2)
r2 = find(local==0)
p(r2) = (w.*Y*(1./numer(r2,:)).')./(w*(1./numer(r2,:)).')
%第一型重心插值公式
% p(r2)=prod(numer(r2,:),2).'.*(w.*Y*(1./numer(r2,:)).')
end