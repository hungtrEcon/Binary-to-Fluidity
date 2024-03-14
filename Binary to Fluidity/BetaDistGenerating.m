

X = 0:.01:1;
y1 = betapdf(X,0,0);

figure
plot(X,y1,'Color','r','LineWidth',2)


list = zeros(1,500);
for i=1:500
    list(1,i) = betarnd(1/4095,1/4095);
end
%mean(list)

list = zeros(1,100);
for i=1:100
    list(1,i) = betarnd(1,1);
end
    

plot(0:0.01:1,betacdf(0:0.01:1,1/24,1/24))
% l = 13 returns 8191 as max
betainv(0.51, 0.002, 0.002)


figure
subplot(1,2,1);
grid on
hold on
plot(0:0.01:1,betacdf(0:0.01:1,1/5000,1/5000),'-s', 'Color', 'red')
plot(0:0.01:1,betacdf(0:0.01:1,1/5,1/5),'-x', 'Color', 'blue')
plot(0:0.01:1,betacdf(0:0.01:1,1,1),'-.', 'Color', 'green')
plot(0:0.01:1,betacdf(0:0.01:1,1,5),'+', 'Color', 'black')
plot(0:0.01:1,betacdf(0:0.01:1,5,1),'-|', 'Color', [0.8500, 0.3250, 0.0980])
hold off
legend({'$\frac{1}{\lambda(\alpha)}=\frac{1}{\lambda(\beta)}=\frac{1}{5000}$', '$\frac{1}{\lambda(\alpha)}=\frac{1}{\lambda(\beta)}=0.2$', '$\frac{1}{\lambda(\alpha)}=\frac{1}{\lambda(\beta)}=1$', '$\frac{1}{\lambda(\alpha)}=1, \frac{1}{\lambda(\beta)}=5$', '$\frac{1}{\lambda(\alpha)}=5, \frac{1}{\lambda(\beta)}=1$'},'Interpreter', 'latex', 'Location', 'southeast','AutoUpdate','off') 
xlabel('$\xi$', 'Interpreter', 'latex')
ylabel('$x_i$', 'Interpreter', 'latex')


subplot(1,2,2);
grid on
hold on
ylim([-1 5])
fplot(@(z) 1/(1+(z-1)^5), [0,8], 'Color', 'red')
hold off
xlabel('$\alpha$ or $\beta$', 'Interpreter', 'latex')
ylabel('$\frac{1}{\lambda(\alpha)}$ or $\frac{1}{\lambda(\beta)}$', 'Interpreter', 'latex')





