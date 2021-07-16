clear all;
clc;

%%%First please run the parameters. Then run the simulink model. 
%Finally you can plot the graphs

%Simulation time parameters
    fsw=200e3; %frequency in Hz
    tp=1/fsw; %period in seconds
    dead_time=30e-9; %dead time in s
%Simulation Parameters
    Vin=600;            % DC voltage in V
    C_dclink=100;       % DC link capacitance in uF
    I_test=15;          % Desired Ids of DUT in A
    L_parline=10;        % Parasitic line inductance in nH
    R_parline=1e-6;     % Parasitic line resistance in Ohms
    L_parHB=1;          % Parasitic inductance between semiconductors in nH
    L_load=1e-3;        % Load inductor inductance in H
 
    sim_time=(L_load*I_test)/Vin+3*tp+1e-5;
 %Gate Driver Parameters
        %RAA226110 GaN Driver
    Vgs_on=15;          % Gate turn on voltage in V
    Vgs_off=-4;        % Gate turn off voltage in V
    R_exton=5;            % Gate turn on resistance in Ohms
    R_extoff=5;           % Gate turn off resistance in Ohms
    L_gateloop=7;      % Gate loop parasitic inductance in nH
    ton_delay= 20;     % Gate driver turn on delay time
    toff_delay=20;     % Gate driver turn off delay time
 
 % Switch Parameters
           % C3M0120090D 
           %https://cms.wolfspeed.com/app/uploads/2020/12/c3m0120090d.pdf
 Rds_on=120e-3; % Conduction resistance in Ohms
 Ids=15;        % Drain to source current in A
 Vgs=15;        %
 Vth=2.1;       % Gate treshold voltage in V
 R_internal=13; % Internal gate resistance in ohms
 Temp=25;       % Junction temperature in C
 
 Ciss=[414,414,414,414,414,414,414,414,414,414];% Input parasitic capacitance in pF
 Crss=[10,5,4,3,3,3,3,3,3,3];% Reverse transfer capacitance in pF
 Coss=[120,105,100,70,60,50,50,50,50,50];% Output capacitance in pF
 V_dscorrespond= [20,60,100,200,300,400,500,600,700,800]; 

 R_on=R_internal+R_exton;
 R_off=R_internal+R_extoff;
 
 % Body Diode Parameters 
 I_diode=0;
 V_diode=4.4;
 t_transit=28; %in ns
 %% Plot Code 1
 %This code plots the overall switchings
    
 figure; 
 subplot(4,1,1) 
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(1).values,'LineWidth',2)
   title("$L_{HB}=10nH$",'interpreter','latex')
 xlim([5 sim_time*1e6]);
 ylim([0 1.2])
 ylabel("$V_{gate}$ (V)",'interpreter','latex')
 grid minor;
 set(gca,'FontSize',15)
 subplot(4,1,2)
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(2).values,'LineWidth',2)
 xlim([5 sim_time*1e6]);
  ylim([0 800])
   ylabel("$V_{ds}$ (V)",'interpreter','latex')
  grid minor;
  set(gca,'FontSize',15)
  subplot(4,1,3)
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(3).values,'LineWidth',2)
 xlim([5 sim_time*1e6]);
  ylim([0 30])
   ylabel("$I_{ds}$ (A)",'interpreter','latex')
  grid minor;
  set(gca,'FontSize',15)
  subplot(4,1,4) 
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(4).values,'LineWidth',2) 
 xlim([5 sim_time*1e6]);
  ylim([0 30])
   ylabel("$I_{load}$ (A)",'interpreter','latex')
  grid minor;
 xlabel("time($\mu s$)",'interpreter','latex');
 set(gca,'FontSize',15)
 
 %% Plot Code 2
 %This code plots the turn-off
 figure; 
 subplot(4,1,1) 
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(1).values,'LineWidth',2)
   title("$L_{HB}=10nH$",'interpreter','latex')
 xlim([((L_load*I_test)/Vin+(1e-5)-(5e-8))*1e6 ((L_load*I_test)/Vin+(1e-5)+5e-8)*1e6 ]);
 ylim([0 1.2])
 ylabel("$V_{gate}$ (V)",'interpreter','latex')
 grid minor;
 set(gca,'FontSize',15)
 subplot(4,1,2)
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(2).values,'LineWidth',2)
xlim([((L_load*I_test)/Vin+(1e-5)-(5e-8))*1e6 ((L_load*I_test)/Vin+(1e-5)+5e-8)*1e6 ]);
  ylim([0 800])
   ylabel("$V_{ds}$ (V)",'interpreter','latex')
  grid minor;
  set(gca,'FontSize',15)
  subplot(4,1,3)
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(3).values,'LineWidth',2)
xlim([((L_load*I_test)/Vin+(1e-5)-(5e-8))*1e6 ((L_load*I_test)/Vin+(1e-5)+5e-8)*1e6 ]);
  ylim([-5 30])
   ylabel("$I_{ds}$ (A)",'interpreter','latex')
  grid minor;
  set(gca,'FontSize',15)
  subplot(4,1,4) 
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(4).values,'LineWidth',2) 
xlim([((L_load*I_test)/Vin+(1e-5)-(5e-8))*1e6 ((L_load*I_test)/Vin+(1e-5)+5e-8)*1e6 ]);
  ylim([0 30])
   ylabel("$I_{load}$ (A)",'interpreter','latex')
  grid minor;
 xlabel("time($\mu s$)",'interpreter','latex');
 set(gca,'FontSize',15)
 
 %% Plot Code 3
 %This code plots the turn-on
 figure; 
 subplot(4,1,1) 
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(1).values,'LineWidth',2)
   title("$L_{HB}=10nH$",'interpreter','latex')
 xlim([((L_load*I_test)/Vin+(1e-5)-(5e-8)+tp)*1e6 ((L_load*I_test)/Vin+(1e-5)+5e-8+tp)*1e6 ]);
 ylim([0 1.2])
 ylabel("$V_{gate}$ (V)",'interpreter','latex')
 grid minor;
 set(gca,'FontSize',15)
 subplot(4,1,2)
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(2).values,'LineWidth',2)
xlim([((L_load*I_test)/Vin+(1e-5)-(5e-8)+tp)*1e6 ((L_load*I_test)/Vin+(1e-5)+5e-8+tp)*1e6 ]);
  ylim([0 800])
   ylabel("$V_{ds}$ (V)",'interpreter','latex')
  grid minor;
  set(gca,'FontSize',15)
  subplot(4,1,3)
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(3).values,'LineWidth',2)
xlim([((L_load*I_test)/Vin+(1e-5)-(5e-8)+tp)*1e6 ((L_load*I_test)/Vin+(1e-5)+5e-8+tp)*1e6 ]);
  ylim([-5 30])
   ylabel("$I_{ds}$ (A)",'interpreter','latex')
  grid minor;
  set(gca,'FontSize',15)
  subplot(4,1,4) 
 plot(out.ScopeData1.time.*1e6,out.ScopeData1.signals(4).values,'LineWidth',2) 
xlim([((L_load*I_test)/Vin+(1e-5)-(5e-8)+tp)*1e6 ((L_load*I_test)/Vin+(1e-5)+5e-8+tp)*1e6 ]);
  ylim([0 30])
   ylabel("$I_{load}$ (A)",'interpreter','latex')
  grid minor;
 xlabel("time($\mu s$)",'interpreter','latex');
 set(gca,'FontSize',15)
 
 