function dpdt = lotkasystem(t,p,n)
%LOTKA  Lotka-Volterra predator-prey model for system of inputs p.
delta = 0.02;
beta = 0.01;

% Change the size of p to be: Number of equations-by-number of initial
% conditions.
p = reshape(p,[],n);

% Write equations in vectorized form.
dpdt = [p(1,:) .* (1 - beta*p(2,:)); 
        p(2,:) .* (-1 + delta*p(1,:))];

% Linearize output.
dpdt = dpdt(:);
end