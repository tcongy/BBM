# Solver for the Benjamin-Bona-Mahony equation

## Algorithm

This Matlab code is a spectral solver for the Benjamin-Bona-Mahony (BBM) equation:
$$u_t+uu_x-u_{xxt}=0,\quad u(x,t)\in \mathbb{R},$$
with periodic boundary conditions.
Let $\widetilde{u}(k,t)$ be the spatial Fourier transform of the field $u(x,t)$. The BBM equation reads
$$\widetilde{u}_t = -\frac{ik}{2(1+k^2)} {\cal F}\left(u^2 \right),\quad u={\cal F}^{-1}\left(\widetilde u \right), $$
where ${\cal F}$ is the spatial Fourier transform operator.

The Fourier transform is evaluated with the Fast Fourier Transform algorithm `fft`, and the integration of the ODE is realised via an explicit Runge-Kutta scheme (4,5) `ode45`.

## Documentation

`[t,u] = bbm(u0,dx,N,tspan)` generates the numerical approximation of the solution `u(:,i)` at different time `t(i)`.

- `u0` array containing the periodic initial condition
- `dx` spatial step used for the discretisation
- `N` number of spatial nodes
- `tspan=[t1 t2]` initial time `t1` and final time `t2` of the integration (`tspan=[t1:dt:t2]` to generate the numerical approximation every `dt`)
