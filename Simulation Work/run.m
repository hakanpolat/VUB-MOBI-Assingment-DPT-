clear all;
clc;

%Simulation time parameters
    fsw=100e3; %frequency in Hz
    tp=1/fsw; %period in seconds
    dead_time=30e-9; %dead time in s
%Simulation Parameters
    Vin=400;            % DC voltage in V
    C_dclink=100;       % DC link capacitance in uF
    I_test=15;          % Desired Ids of DUT in A
    L_parline=1;        % Parasitic line inductance in nH
    R_parline=1e-6;     % Parasitic line resistance in Ohms
    L_parHB=1;          % Parasitic inductance between semiconductors in nH
    L_load=1e-3;        % Load inductor inductance in H
 
    sim_time=(L_load*I_test)/Vin+3*tp+1e-5;
 %Gate Driver Parameters
        %RAA226110 GaN Driver
    Vgs_on=15;          % Gate turn on voltage in V
    Vgs_off=-4;        % Gate turn off voltage in V
    R_on=17;            % Gate turn on resistance in Ohms
    R_off=17;           % Gate turn off resistance in Ohms
    L_gateloop=4;      % Gate loop parasitic inductance in nH
    ton_delay= 20;     % Gate driver turn on delay time
    toff_delay=20;     % Gate driver turn off delay time
 
 % Switch Parameters
           % C3M0120090D 
           %https://cms.wolfspeed.com/app/uploads/2020/12/c3m0120090d.pdf
 Rds_on=120e-3; % Conduction resistance in Ohms
 Ids=15;        % Drain to source current in A
 Vgs=15;        %
 Vth=2.1;       % Gate treshold voltage in V
 Temp=25;       % Junction temperature in C
 Ciss=414;      % Input parasitic capacitance in pF
 Crss=3;        % Reverse transfer capacitance in pF
 Coss=48;       % Output capacitance in pF
 
 
 
 % Body Diode Parameters
 
 I_diode=0;
 V_diode=4.4;
 t_transit=28; %in ns
 
    
