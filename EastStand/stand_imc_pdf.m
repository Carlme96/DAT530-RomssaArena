function [png] = stand_imc_pdf()

% Stand IMC - East Stand
png.PN_name = 'StandIMC';

% p*Seats - Seats in each section
png.set_of_Ps = {'pASeats', 'pBSeats', 'pCSeats', 'pDSeats', 'pVIPSeats'};

png.set_of_Ts = {};

png.set_of_As = {
    ...% From stairs in East Stand Module to seats
    'tAStairs', 'pASeats', 1, 'tBStairs', 'pBSeats', 1, ...
    'tCStairs1', 'pCSeats', 1, 'tCStairs2', 'pCSeats', 1, ...
    'tDStairs1', 'pDSeats', 1, 'tDStairs2', 'pDSeats', 1, ...
    'tVIPStairs', 'pVIPSeats', 1};
