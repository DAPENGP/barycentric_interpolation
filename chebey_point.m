clear,clc
subplot(2,1,1)
n = 20
tt = linspace(0,pi,n+1)
zz = exp(1i*tt)
hold off
plot(zz,'.-k')
axis equal
ylim([0 1.1])
xlim([-1.2 1.2])

xx =real(zz)
hold on
for j = 2:n
    plot([xx(j) zz(j)],'k','linewidth',0.7)
end
plot(xx,0*xx,'ok')
text(0.9,0.9,'n=20','FontSize',14)

subplot(2,1,2)
n = 50
tt = linspace(0,pi,n+1)
zz = exp(1i*tt)
hold off
plot(zz,'.-k')
axis equal
ylim([0 1.1])
xlim([-1.2 1.2])

xx =real(zz)
hold on
for j = 2:n
    plot([xx(j) zz(j)],'k','linewidth',0.7)
end
plot(xx,0*xx,'ok')
text(0.9,0.9,'n=50','FontSize',14)