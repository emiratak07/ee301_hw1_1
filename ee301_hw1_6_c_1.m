% The code for part c(i)
% Plot the y(t) and y_delta(t)
f1 = @h_delta;
fplot(f1,[-5 5])
fig1 = figure;
f2 = @y;
fplot(f2,"red",[-5 5]);
hold on
f3 = @y_delta;
fplot(f3,"black",[-5 5]);
legend("y(t)","ydelta(t)");
title("y(t) and ydelta(t)");
xlabel("Time");
% Plot the y(t)-y_delta(t)
fig2 = figure;
f4 = @y_difference;
fplot(f4,"red",[-1 1]);
legend("Difference signal: y(t)-y_delta(t)");
title("y(t)-y_delta(t)");
xlabel("Time");
figs = [fig1,fig2];
% Define x(t)-x_delta(t)
function e = y_difference(t)
    e = y(t)-y_delta(t);
end
% Define x_delta(t)
% function a = x_delta(t)
%     delta = 0.02;
%     c = [];
%     for k = 0:1000
%         b = x(delta*k)*delta_delta(t-k*delta)*delta;
%         c(k+1) = b;
%     end
%     a = sum(c);
% end

% Define y_delta(t)
function a2 = y_delta(t)
    delta = 0.02;
    c1 = [];
    for k1 = 0:100
        b1 = x(delta*k1)*h_delta(t-k1*delta)*delta;
        c1(k1+1) = b1;
        disp(k1)
    end
    a2 = sum(c1);
end
%Define h_delta(t)
function a1 = h_delta(t)
    delta = 0.02;
    c = [];
    for k = 0:100
        b = h(delta*k)*delta_delta(t-k*delta)*delta;
        c(k+1) = b;
        % disp(k)
    end
    a1 = sum(c);
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
        b = sin(2*pi*t);
    else
        b = 0;
    end
end
% Define h(t)
function k = h(t)
    e = exp(1);
    if t > 0
        k = e^(-t/10)*cos(2*pi*t);
    else
        k = 0;
    end
end
% Define y(t)
function l = y(t)
    e2 = exp(1);
    l = -e2^(-t/10)*(200*pi*(e2^(t/10)-1)*cos(2*pi*t)-10*((1+800*pi*pi)*e2^(t/10)-800*pi*pi)*sin(2*pi*t))/(1+1600*pi*pi);
    % l = 5*sin(2*pi*t)*(1-e2^(-t/10));
end








