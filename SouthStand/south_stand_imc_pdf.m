function [png] = south_stand_imc_pdf()

% South Stand IMC
png.PN_name = 'SouthStandIMC';

% pSSeats - Seats in South Stand
% pSStairs - Stairs in South Stand
png.set_of_Ps = {'pSSeats', 'pSStairs'};

% tSStairs - Stairs to South Stand
png.set_of_Ts = {'tSStairs'};

png.set_of_As = {'tSSecO', 'pSStairs', 1, ...
    'pSStairs', 'tSStairs', 1, ...
    'tSStairs', 'pSSeats', 1};
