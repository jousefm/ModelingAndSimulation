clear all; 

close all; 

clc

%% =======================================
% Jousef Murad - KIT
% Modeling and Simulation - 26.10.2019

% ========================================
%% Single-degree-of-freedom oscillator
% ========================================

% ==========
% Parameter
% ==========

m = 1;
c = 1;
d = 100;
f = 0;

% ==========
% Initial and Boundary Conditions 
% --> See also StateSpaceForm.m
% ==========

Time = 0:0.1:40; % 1x2 Matrix

IC = [0; 0.01]; % 2x1 Matrix

% ==========
% Solver Options and ode45-solver
% ==========

SolverOptions = odeset('RelTol',1e-5,'AbsTol',1e-5);

% ODE45 Solver

[T,Y] = ode45(@StateSpaceForm,Time, IC, SolverOptions, m, d, c, f);

% ==========
% Plots
% ==========

%plot(T,Y(:,1),'b',T,Y(:,2),'r');

fig2 = figure(2)
movegui(fig2,'northeast');
plot(T,Y(:,1));
title('System response');
xlabel('t[s]');
ylabel('x[m]');


% ==========
% Multiple Plots for all masses
% ==========

fig3 = figure(3);

for m = 1:1:10
%for m = 1 % Just a test line to see where the first line starts
    
    [T,Y] = ode45(@StateSpaceForm,Time, IC, SolverOptions, m, d, c, f);
    
    Matrix(m,:) = [m Y(:,1)'];
    
    C = {'y','m','c','r','g','b',[1 0.4 0.6],'k',[.5 .6 .7],[.8 .2 .6]}; % Colors for plots
    
    hold on
    
    Plot1(m)= plot(T,Matrix(m,2:end),'LineWidth',2,'color',C{m});
    
    lgd=num2str([1:1:10]','Mass = %d');

    h = legend(Plot1,lgd);
    
    %set(h,'FontSize',12); 
    
    title('System response','FontSize', 24);
    
    xlabel('t[s]','FontSize', 20);
    
    ylabel('x[m]','FontSize', 20);
   
    
end

movegui(fig3,'southeast');