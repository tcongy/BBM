function [tdata,udata] = bbm(u0,dx,N,tspan)
    k = [0:N/2-1 0 -N/2+1:-1]'*2*pi/(N*dx);
    a = -1j*k./(2*(1+k.^2));
    v0 = fft(u0);
    % return current time
    options = odeset('OutputFcn',...
        @(t,y,flag)fprintf('t= %s\n',mat2str(t))*0);
    f = @(t,v) a.*fft(real(ifft(v)).^2);
    [tdata,vdata] = ode45(f,tspan,v0,options);
    udata = ifft(vdata,N,2);
end