%% �nductor design 
%25C
%% part1
u0 = 4*pi*10^-7;

core_Al = 5040; % nH/turn^2
core_le = 103e-3; % m  eff length
core_Ae = 138e-6; %m^2 cross sec area
core_height = 18e-3;

core_inner_r = 13.1e-3;
core_outer_r = 20.9e-3;


core_init_ur = 3000;    %initial ur

core_ur = 4500;         % @ 425mT

B_op = 0.425;

N = 20; 
Imax = B_op*core_le/(core_ur*u0*N);

I = 0.43;

core_R = core_le/(core_ur*u0*core_Ae); %reluctance

core_L = N^2/core_R     %H


%% part2

% L = N*fi/I , fi = NI/R, L = N^2(1/R1+1/R2...)

% in order to modelled this I have calculated 10 different reluctance 
% which is effected flux and inductance then calculated inductance


core_r_div = linspace(core_inner_r,core_outer_r, 11);

core_r_div_effective = zeros(10,0);
core_R_div_effective = zeros(10,0);
core_le_div_effective    = zeros(10,0);   
core_Ae_div          = zeros(10,0);
core_L_div           = zeros(10,0);
core_flux_div        = zeros(10,0);  
total_div_flux           = 0;
total_div_inductance     = 0;

for i = 1:10
    
    core_r_div_effective(i) = (core_r_div(i) + core_r_div(i+1))/2;

    core_le_div_effective(i) = 2*pi*core_r_div_effective(i);

    core_R_div_effective(i) = core_le_div_effective(i)/(core_ur*u0*core_Ae/10);

    core_L_div(i) = N^2 / core_R_div_effective(i);
    
    core_flux_div(i) = N*I/core_R_div_effective(i);
    
    total_div_inductance = total_div_inductance + core_L_div(i);
    total_div_flux       = total_div_flux + core_flux_div(i);

end


plot(core_r_div_effective,core_L_div);
title('inductance vs radius part 1');
xlabel('radius');
ylabel('inductance');

figure;

plot(core_r_div_effective,core_flux_div);
title('flux vs radius part 1');
xlabel('radius');
ylabel('flux');

total_div_flux      

total_div_inductance



%% part 3

% NI = B*A*R 
core_u_part3 = 0;
I_part3 =0;
core_ur_part3 = 0;

I_part3 = I*1.5;

core_B_sat = 0.53;

core_u_part3 = (core_B_sat * core_le) /(N*I_part3);

core_ur_part3 = core_u_part3 /(4*pi*10e-7) 

core_R_part3 = core_le/(core_ur_part3*u0*core_Ae); %reluctance


core_L_part3 = N^2/core_R_part3     %H

core_flux_part3 = N*I_part3/core_R_part3


% part 3 division 

core_R_div_effective_part3 = zeros(10,0);
core_L_div_part3  = zeros(10,0);
core_flux_div_part3 =zeros(10,0);
total_inductance_div_part3 = 0;
total_flux_div_part3  = 0;

for i = 1:10

    core_R_div_effective_part3(i) = core_le_div_effective(i)/(core_ur_part3*u0*core_Ae/10);
    
    core_L_div_part3(i) = N^2 / core_R_div_effective_part3(i);
    
    core_flux_div_part3(i) = N*I_part3/core_R_div_effective_part3(i);
    
    total_inductance_div_part3 = total_inductance_div_part3 + core_L_div_part3(i);
    total_flux_div_part3       = total_flux_div_part3 + core_flux_div_part3(i);
    
end


plot(core_r_div_effective,core_L_div_part3);
title('inductance vs radius part 3');
xlabel('radius');
ylabel('inductance');

figure;

plot(core_r_div_effective,core_flux_div_part3);
title('flux vs radius part 3');
xlabel('radius');
ylabel('flux');

total_flux_div_part3      

total_inductance_div_part3



%% part 4

d_gap = 2e-3;

core_le_part4 = core_le - 2e-3;

gap_R = d_gap/(core_Ae*u0);

core_R_part4 = core_le_part4/(core_ur*u0*core_Ae); %reluctance

core_L_part4 = N^2/(core_R_part4+gap_R)     %H



%% part 5

% In this part, in order to model firingig flux 











