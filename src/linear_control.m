% Linear control with PI Controller for:
% < 10% overshoot
% < 1.2 sec rise time

clear vars;
close all;
clc;

% Define Transfer Functions
Gp = zpk([], [-1 -9],10);
Gc = zpk(-3 , 0 , 2);

% Tune Controller
controlSystemDesigner(Gp, Gc);

% Results with Tuned Controller
Kp = 2.2959;
Ki = 3.0742;
c = Ki/Kp; % 1.3390

% Closed Loop System
Gc = zpk(-c,0,Kp);

open_loop_tf = series(Gp,Gc);
disp("Open Loop TF:")
disp(open_loop_tf)
closed_loop_tf = feedback(open_loop_tf,1,-1);
disp("Closed Loop TF:")
disp(closed_loop_tf)

figure()
step(closed_loop_tf)