clear,clc
sqen = [5 10 15 20];
for m = 1:length(sqen)
    subplot(2,2,m)
    n = sqen(m)
    %等距节点
    x1 = linspace(-1,1,n+1)
    %切比雪夫点
    tt = linspace(0,pi,n+1)
    zz = exp(1i*tt)
    x2 = real(zz)
    %绘制龙格函数图像
    t = -1:0.01:1
    fun = inline('exp(-1./x.^2)');
    % fun = inline('1./(1+25*x.^2)');
    f = fun(t)
    m1=plot(t,f,'-.k','LineWidth',1)
    
    xlim([-1.2 1.2])
    ylim([-0.3 0.7])
    xlabel('x')
    ylabel('y')
    
    title(['n=',num2str(n)],'FontSize',14)
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    box off
    hold on
    
    
    % %做等距节点的拉格朗日插值多项式
    % domon = x1.'*ones(1,n+1)-ones(n+1,1)*x1+eye(n+1)
    % numer =  t.'*ones(1,n+1)-ones(length(t),1)*x1
    % nnum=[];
    % for i = 1:n+1
    %     A = numer
    %     A(:,i) = ones(size(numer,1),1);
    %     nnum=[nnum prod(A,2)];
    % end
    % L = nnum./prod(domon,2).'
    % yk = fun(x1)
    % p = yk*L.'
    % plot(t,p,'-r','LineWidth',2)
    
    
    % %做切比雪夫点的拉格朗日插值多项式
    % domon2 = x2.'*ones(1,n+1)-ones(n+1,1)*x2+eye(n+1)
    % numer2 =  t.'*ones(1,n+1)-ones(length(t),1)*x2
    % nnum2=[];
    % for i = 1:n+1
    %     A = numer2
    %     A(:,i) = ones(size(numer2,1),1)
    %     nnum2=[nnum2 prod(A,2)];
    % end
    % L2= nnum2./prod(domon2,2).'
    % yk2 = fun(x2)
    % p2 = yk2*L2.'
    % plot(t,p2,'-r','LineWidth',2)
end