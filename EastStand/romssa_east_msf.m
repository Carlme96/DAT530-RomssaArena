clear;

global global_info
global_info.MAX_LOOP = 100;
global_info.DELTA_TIME = 1;

% Sold tickets
global_info.A_COUNT = 550; % Max 550 - Avg 330
global_info.B_COUNT = 350; % Max 350 - Avg 315
global_info.C_COUNT = 303; % Max 303 - Avg 272
global_info.D_COUNT = 550; % Max 550 - Avg 330
global_info.VIP_COUNT = 299; % Max 299 - Avg 299

% Arrival times
arrive_mean = 16 * 60 * 60 + 15 * 60; % 16:15
arrive_sd = 20 * 60; % 20 minutes
global_info.A_ARRIVE_TIME = sort(normrnd(arrive_mean, arrive_sd, [1, global_info.A_COUNT]), 'descend');
global_info.B_ARRIVE_TIME = sort(normrnd(arrive_mean, arrive_sd, [1, global_info.B_COUNT]), 'descend');
global_info.C_ARRIVE_TIME = sort(normrnd(arrive_mean, arrive_sd, [1, global_info.C_COUNT]), 'descend');
global_info.D_ARRIVE_TIME = sort(normrnd(arrive_mean, arrive_sd, [1, global_info.D_COUNT]), 'descend');
global_info.VIP_ARRIVE_TIME = sort(normrnd(arrive_mean, arrive_sd, [1, global_info.VIP_COUNT]), 'descend');

% Simulation start and stop time
% Normal match start time is 17:00
global_info.START_AT = [15 30 00];
global_info.STOP_AT = [17 30 00];

pns = pnstruct({'east_entrance_imc_pdf', 'east_stand_pdf', ... 
    'a_security_pdf', 'b_security_pdf', 'c_security_pdf', ...
    'd_security_pdf', 'vip_security_pdf', 'stand_imc_pdf'});

dyn.m0 = {'pAStart', global_info.A_COUNT, ...
    'pBStart', global_info.B_COUNT, ...
    'pCStart', global_info.C_COUNT, ...
    'pDStart', global_info.D_COUNT, ...
    'pVIPStart', global_info.VIP_COUNT};

TS_FT = 5; % Turnstile firing time
G_FT = 12; % Security guard firing time

% Initial priorities for choosing queue
dyn.ip = {'tCChooseB', 10000, 'tCChooseC', 10000, ...
    'tDChooseC', 10000, 'tDChooseD', 10000};

% t*Ts - Security turnstiles
% t*SecG* - Security guards
dyn.ft = {'tATs', TS_FT, 'tASecG1', G_FT, 'tASecG2', G_FT, ...
    'tBTs', TS_FT, 'tBSecG1', G_FT, 'tBSecG2', G_FT, ...
    'tCTs', TS_FT, 'tCSecG1', G_FT, 'tCSecG2', G_FT, ...
    'tDTs', TS_FT, 'tDSecG1', G_FT, 'tDSecG2', G_FT, ...
    'tVIPTs', TS_FT, 'tVIPSecG1', G_FT, 'tVIPSecG2', G_FT, ...
'allothers', 0.000001};

pni = initialdynamics(pns, dyn);

Sim_Results = gpensim(pni);
%prnss(Sim_Results);
figure('Name', 'East Stand Seats'), plotp(Sim_Results, {'pASeats', 'pBSeats', 'pCSeats', 'pDSeats', 'pVIPSeats'});
figure('Name', 'East Stand Security Queue'), plotp(Sim_Results, {'pQASec', 'pQBSec', 'pQCSec', 'pQDSec', 'pQVIPSec'});
figure('Name', 'East Stand Not Arrived'), plotp(Sim_Results, {'pAStart', 'pBStart', 'pCStart', 'pDStart', 'pVIPStart'});