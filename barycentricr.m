function p = barycentricr(X,Y,d,t)
% barycentric函数是利用重心插值法进行插值的
%输入参数
%   X 为所给定的插值点
%   Y 为所给插值点对应的函数值
%   d 为重心有理插值的d值
%   t 为需要求函数值的点或点列
%输出参数
%   p 为在t处的插值函数值

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