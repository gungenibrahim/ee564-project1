%% ýnductor design 
%25C
%% part1
u0 = 4*pi*10^-7;

core_Al = 5020; % nH/turn^2
core_le = 82.9 * 10^-3; % m  eff length
core_Ae = 115.6 * 10^-6; %m^2 cross sec area

core_inner_r = 19e-3;
core_outer_r = 38.1e-3;


core_init_ur = 3000;    %initial ur

core_ur = 4500;         % @ 375mT

B_op = 0.375;

N = 20; 
Imax = B_op*core_le/(core_ur*u0*N);

core_R = core_le/(core_ur*u0*core_Ae); %reluctance

core_L = N^2/core_R;


