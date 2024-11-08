function [png] = east_entrance_imc_pdf()

% Entrance IMC for east stand
png.PN_name = 'EastEntranceIMC';

% p*Start - Tokens not yet arrived at the entrance (pre initialised)
% p*Q - Queue for each section
png.set_of_Ps = {'pAStart', 'pBStart', 'pCStart', 'pDStart', 'pVIPStart', ...
    'pAQ', 'pBQ', 'pCQ', 'pDQ', 'pVIPQ'};

% t*Start - Checks if tokens can arrive and gives colors
png.set_of_Ts = {'tAStart', 'tBStart', 'tCStart', 'tDStart', 'tVIPStart'};

png.set_of_As = {'pAStart', 'tAStart', 1, 'pBStart', 'tBStart', 1, ...
    'pCStart', 'tCStart', 1, 'pDStart', 'tDStart', 1, ...
    'pVIPStart', 'tVIPStart', 1, ...
    'tAStart', 'pAQ', 1, 'tBStart', 'pBQ', 1, ...
    'tCStart', 'pCQ', 1, 'tDStart', 'pDQ', 1, ...
    'tVIPStart', 'pVIPQ', 1, ...
    ...% Choose queue in East Stand Module
    'pAQ', 'tAChooseA', 1, 'pBQ', 'tBChooseB', 1, ...
    'pCQ', 'tCChooseB', 1, 'pCQ', 'tCChooseC', 1, ...
    'pDQ', 'tDChooseC', 1, 'pDQ', 'tDChooseD', 1, ...
    'pVIPQ', 'tVIPChVIP', 1};
