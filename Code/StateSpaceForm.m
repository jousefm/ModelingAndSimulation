function [ xp ] = StateSpaceForm( t,x,m,c,d,f )
% State space form for single mass oscillator
xp=[x(2); (1/m)*(f-d*x(2)-c*x(1))];

end

