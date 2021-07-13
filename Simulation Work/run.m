clear all;
clc;

%Simulation time parameters
    fsw=200e3; %frequency in Hz
    tp=1/fsw; %period in seconds
    
%Simulation Parameters
    Vin=100;            % DC voltage in V
    C_dclink=100;       % DC link capacitance in uF
    I_test=10;          % Desired Ids of DUT in A
    L_parline=1;        % Parasitic line inductance in nH
    R_parline=1e-6;     % Parasitic line resistance in Ohms
    L_parHB=1;          % Parasitic inductance between semiconductors in nH
    L_load=1e-4;        % Load inductor inductance in H
 
 %Gate Driver Parameters
    Vgs_on=6;          % Gate turn on voltage in V
    Vgs_off=-3;        % Gate turn off voltage in V
    R_on=2;            % Gate turn on resistance in Ohms
    R_off=2;           % Gate turn off resistance in Ohms
    L_gateloop=4;      % Gate loop parasitic inductance in nH
    ton_delay= 50;     % Gate driver turn on delay time
    toff_delay=50;     % Gate driver turn off delay time
 
 % Switch Parameters
 
 
 
    
