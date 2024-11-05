function [png] = west_entrance_imc_pdf()

% Entrance IMC for west stand
png.PN_name = 'WestEntranceIMC';

% p*Start - Tokens not yet arrived at the entrance (pre initialised)
% pNQ - North security queue
png.set_of_Ps = {'pHStart', 'pIStart', 'pJStart', 'pKStart', 'pLStart', ...
    'pNQ'};

% t*Start - Checks if tokens can arrive and gives colors
png.set_of_Ts = {'tHStart', 'tIStart', 'tJStart', 'tKStart', 'tLStart'};

png.set_of_As = {'pHStart', 'tHStart', 1, 'pIStart', 'tIStart', 1, ...
    'pJStart', 'tJStart', 1, 'pKStart', 'tKStart', 1, ...
    'pLStart', 'tLStart', 1, ...
    'tHStart', 'pNQ', 1, 'tIStart', 'pNQ', 1, ...
    'tJStart', 'pNQ', 1, 'tKStart', 'pNQ', 1, 'tLStart', 'pNQ', 1, ... 
    ...% From north queue to north security
    'pNQ', 'tNSecI', 1};
