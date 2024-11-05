function [png] = south_entrance_imc_pdf()

% Entrance IMC for south stand
png.PN_name = 'SouthEntranceIMC';

% pSStart - Tokens not yet arrived at the entrance (pre initialised)
% pSQ - Queue for south stand
png.set_of_Ps = {'pSStart', 'pSQ'};

% tSStart - Checks if tokens can arrive and gives colors
png.set_of_Ts = {'tSStart'};

png.set_of_As = {'pSStart', 'tSStart', 1, 'tSStart', 'pSQ', 1, ...
    ...% From queue to security
    'pSQ', 'tSSecI', 1};
