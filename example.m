clearvars;
N = 2^16;
dx = 0.01;
x = (0:N-1)'*dx;
L = N*dx;

% periodic step distribution
c1 = L/4;
c2 = 2*L/3;
u1 = -0.3;
u2 = 1;
xi = 0.1;
u0 = (u2-u1)/2*(tanh((x-c1)/xi)+tanh((c2-x)/xi))+u1;

% resolution
[t,u] = bbm(u0, dx, N, [0:50:150]);

% plot solution at t=0 and t=150
figure(1)
clf
grid on
plot(x, u0, 'k--', x, u(end,:), 'k-', 'linewidth', 1)
axis tight
legend('$t=0$', '$t=150$')
xlabel('$x$')
ylabel('$u(x,t)$')
exportgraphics(gca, 'example.png', 'ContentType', 'image',...
    'Resolution', 600)