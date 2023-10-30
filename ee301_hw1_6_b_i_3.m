% The code for part b(i)(3)
% Plot the h(t), h_delta(t) and the x(t)-x_delta(t)
f2 = @h;
fplot(f2,"cyan");
hold on
f3 = @h_delta;
fplot(f3,"black");
hold on
f4 = @h_difference;
fplot(f4,"red");
legend("h(t)","hdelta(t)","Difference signal: h(t)-h_delta(t)");
title("h(t), hdelta(t) and h(t)-hdelta(t)");
xlabel("Time");
% Define h(t)-h_delta(t)
function e = h_difference(t)
    e = h(t)-h_delta(t);
end
% Define h_delta(t)
function a = h_delta(t)
    delta = 0.002;
    c = [];
    for k = 0:1000
        b = h(delta*k)*delta_delta(t-k*delta)*delta;
        c(k+1) = b;
    end
    a = sum(c);
end
% Define the delta delta function
function a = delta_delta(t)
    delta = 0.002;
    if t >= 0 && t < delta
        a = 1/ delta;
    else 
        a = 0;
    end
end
% Define h(t)
function b = h(t)
    e = exp(1);
    if t>0
        b = cos(2*pi*t)*e^(-t/10);
    else
        b = 0;
    end
end