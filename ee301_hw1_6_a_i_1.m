% The code for part a(i)
% Plot the x(t) and x_delta(t)
fig1 = figure;
f2 = @x;
fplot(f2,"red",[-1 1]);
hold on
f3 = @x_delta;
fplot(f3,"black",[-1 1]);
legend("x(t)","xdelta(t)");
title("x(t) and xdelta(t)");
xlabel("Time");
% Plot the x(t)-x_delta(t)
fig2 = figure;
f4 = @x_difference;
fplot(f4,"red",[-1 1]);
legend("Difference signal: x(t)-x_delta(t)");
title("x(t) and xdelta(t)");
xlabel("Time");
figs = [fig1,fig2];
% Define x(t)-x_delta(t)
function e = x_difference(t)
    e = x(t)-x_delta(t);
end
% Define x_delta(t)
function a = x_delta(t)
    delta = 0.02;
    c = [];
    for k = 0:1000
        b = x(delta*k)*delta_delta(t-k*delta)*delta;
        c(k+1) = b;
    end
    a = sum(c);
end
% Define the delta delta function
function a = delta_delta(t)
    delta = 0.02;
    if t >= 0 && t < delta
        a = 1/ delta;
    else 
        a = 0;
    end
end
% Define x(t)
function b = x(t)
    if t>0
        b = sin(20*pi*t);
    else
        b = 0;
    end
end



