% Fuzzy Control with PI Controller for:
% < 7% overshoot
% < 0.6 sec rise time

clear;
clc;
close all;

FLC = readfis('FLC.fis');

% 3d surface of the FLC
gensurf(FLC)

simulink;
