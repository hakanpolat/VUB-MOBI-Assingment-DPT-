clear all;
clc;

%Simulation time parameters
    fsw=200e3; %frequency in Hz
    tp=1/fsw; %period in seconds
    dead_time=30e-9; %dead time in s
%Simulation Parameters
    Vin=400;            % DC voltage in V
    C_dclink=100;       % DC link capacitance in uF
    I_test=10;          % Desired Ids of DUT in A
    L_parline=1;        % Parasitic line inductance in nH
    R_parline=1e-6;     % Parasitic line resistance in Ohms
    L_parHB=1;          % Parasitic inductance between semiconductors in nH
    L_load=1e-3;        % Load inductor inductance in H
 
 %Gate Driver Parameters
        %RAA226110 GaN Driver
    Vgs_on=6;          % Gate turn on voltage in V
    Vgs_off=-3;        % Gate turn off voltage in V
    R_on=10;            % Gate turn on resistance in Ohms
    R_off=4;           % Gate turn off resistance in Ohms
    L_gateloop=4;      % Gate loop parasitic inductance in nH
    ton_delay= 20;     % Gate driver turn on delay time
    toff_delay=20;     % Gate driver turn off delay time
 
 % Switch Parameters
        % GS66508T https://gansystems.com/wp-content/uploads/2020/04/GS66508T-DS-Rev-200402.pdf
    %Parameters are for 25C
 Rds_on=50e-3;  % Conduction resistance in Ohms
 Ids=30;        % Drain to source current in A
 Vgs=6;         %
 Vth=1.7;       % Gate treshold voltage in V
 Temp=25;       % Junction temperature in C
 Ciss=242;      % Input parasitic capacitance in pF
 Crss=1.5;      % Reverse transfer capacitance in pF
 Coss=65;       % Output capacitance in pF
 
 
 
    
