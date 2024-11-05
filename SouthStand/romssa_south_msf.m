clear;

global global_info
global_info.MAX_LOOP = 100;
global_info.DELTA_TIME = 1;

% Sold tickets
global_info.SOUTH_COUNT = 630; % Max 630 - Avg 200

% Arrival times
arrive_mean = 16 * 60 * 60 + 15 * 60;
arrive_sd = 20 * 60;
global_info.SOUTH_ARRIVE_TIME = sort(normrnd(arrive_mean, arrive_sd, [1, global_info.SOUTH_COUNT]), 'descend');

% Simulation start and stop time
% Normal match start time is 17:00
global_info.START_AT = [15 30 00];
global_info.STOP_AT = [17 30 00];

pns = pnstruct({'south_entrance_imc_pdf', 'south_security_pdf', ...
    'south_stand_imc_pdf'});

dyn.m0 = {'pSStart', global_info.SOUTH_COUNT};

TS_FT = 5;
G_FT = 10;

% tSTs* - Security turnstiles
% tSSecG* - Security guards
dyn.ft = {'tSTs1', TS_FT, 'tSTs2', TS_FT, ...
    'tSSecG1', G_FT, 'tSSecG2', G_FT, 'tSSecG3', G_FT, ...
'allothers', 0.000001};

pni = initialdynamics(pns, dyn);

Sim_Results = gpensim(pni);
%prnss(Sim_Results);
figure('Name', 'South Stand Seats'), plotp(Sim_Results, {'pSSeats'});
figure('Name', 'South Stand Security Queue'), plotp(Sim_Results, {'pSQ'});
figure('Name', 'South Stand Not Arrived'), plotp(Sim_Results, {'pSStart'});