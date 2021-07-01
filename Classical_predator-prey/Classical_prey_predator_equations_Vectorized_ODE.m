% Compute Multiple Initial Conditions with Vectorized ODE Function

clear; clc; close all;

t0 = 0; tfinal = 15;  % time interval
p0 = [50; 50];  % initial size for x, y
y0 = 10:10:400;

n = length(y0);  % the number of initial conditions
p0_all = [50*ones(n,1) y0(:)]';

% Solve the eqations for all of the initial conditions using ode45 
% (ode45 requirements : two inputs)
[t, p] = ode45(@(t, p) lotkasystem(t, p, n),[t0 tfinal], p0_all);

p = reshape(p,[],n);  % (numTimeSteps*s)¡¿n
nt = length(t);

for k = 1:n
    plot(p(1:nt, k), p(nt+1:end, k));
    hold on
end

% plot : Comparison of the solutions for all of the initial conditions
title('Predator/Prey populations over time')
xlabel('t')
ylabel('Population')
hold off
