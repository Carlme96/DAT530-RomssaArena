function [png] = west_stand_pdf()

% Module for West Stand
png.PN_name = 'WestStand';

% p*Seats - Seats in each section
png.set_of_Ps = {'pHSeats', 'pISeats', 'pJSeats', 'pKSeats', 'pLSeats'};

% t*Stairs - Stairs to each section
png.set_of_Ts = {'tHStairs', 'tIStairs', 'tJStairs', 'tKStairs', 'tLStairs'};

png.set_of_As = {'tHStairs', 'pHSeats', 1, 'tIStairs', 'pISeats', 1, ...
    'tJStairs', 'pJSeats', 1, 'tKStairs', 'pKSeats', 1, ...
    'tLStairs', 'pLSeats', 1};

png.set_of_Ports = {'tHStairs', 'tIStairs', 'tJStairs', 'tKStairs', 'tLStairs'};