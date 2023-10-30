% The code for part b(i)(1)
% Plot the h(t) and h_delta(t)
fig1 = figure;
f2 = @h;
fplot(f2,"cyan");
hold on
f3 = @h_delta;
fplot(f3,"black");
legend("h(t)","hdelta(t)");
title("h(t) and hdelta(t)");
xlabel("Time");
% Plot the x(t)-x_delta(t)
fig2 = figure;
f4 = @h_difference;
fplot(f4,"red");
legend("Difference signal: h(t)-hdelta(t)");
title("h(t) and hdelta(t)");
xlabel("Time");
figs = [fig1,fig2];
% Define h(t)-h_delta(t)
function e = h_difference(t)
    e = h(t)-h_delta(t);
end
% Define h_delta(t)
function a = h_delta(t)
    delta = 0.02;
    c = [];
    for k = 0:1000
        b = h(delta*k)*delta_delta(t-k*delta)*delta;
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
% Define h(t)
function b = h(t)
    e = exp(1);
    if t>0
        b = cos(2*pi*t)*e^(-t/10);
    else
        b = 0;
    end
end