%%%%%%%%%
% CAS 2
% Code Author: Ellisa Booker
%%%%%%%%%
%%
% Clear workspace
close all;
clear;
clc;

% Load in ECG data
data = load('ecg_data.txt'); 

% List of main variables
t = data(:,1); 
x = data(:,2); 
fs = 1000;

% Creates a 3rd order analog stop bandpass filter, skipping 60Hz frequency
% Outputs b,a as filter coefficients
[b,a] = cheby1(1,3,2*pi*[59 61],'stop','s');

% Uses filter coefficients to create a transfer function. Output to cmd line 
H = tf(b,a)

% Simulates the time response of our data x given the transfer function H
% This is a simulation of the filter created above
y = lsim(H,x,t);

%% Plotting Section

% Plot the original signal with respect to time
subplot(1,2,1);
plot(t,x);
xlabel('time (s)');
ylabel('Original ECG signal');

% Plot filtered data with respect to time
subplot(1,2,2)
plot(t,y);
xlabel('time (s)');
ylabel('Filtered ECG signal');