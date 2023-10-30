% The code for part a(i)(2)
% Plot the x(t), x_delta(t) and x(t)-x_delta(t)
f2 = @x;
fplot(f2,"cyan");
hold on
f3 = @x_delta;
fplot(f3,"black");
hold on
f4 = @x_difference;
fplot(f4,"red");
legend("x(t)","x_(delta)(t)","Difference signal: x(t)-x_delta(t)");
title("x(t), xdelta(t) and x(t)-x_delta(t)");
xlabel("Time");
% Define x(t)-x_delta(t)
function e = x_difference(t)
    e = x(t)-x_delta(t);
end
% Define x_delta(t)
function a = x_delta(t)
    delta = 0.2;
    c = [];
    for k = 0:1000
        b = x(delta*k)*delta_delta(t-k*delta)*delta;
        c(k+1) = b;
    end
    a = sum(c);
end
% Define the delta delta function
function a = delta_delta(t)
    delta = 0.2;
    if t >= 0 && t < delta
        a = 1/ delta;
    else 
        a = 0;
    end
end
% Define x(t)
function b = x(t)
    if t>0
        b = sin(2*pi*t);
    else
        b = 0;
    end
end