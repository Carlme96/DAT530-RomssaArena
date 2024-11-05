function [png] = d_security_pdf()

% Module for section D security
png.PN_name = 'DSecurity';

% pDSecGQ - Queue for security check
% pDIHold, pDOHold - Hold for security check
png.set_of_Ps = {'pDSecGQ', 'pDIHold', 'pDOHold'};

% tDSecI, tDSecO - Input and output for security check
% tDTs - Turnstile
% tDSecG1, tDSecG2 - Security guards
png.set_of_Ts = {'tDSecI', 'tDSecO', 'tDTs', 'tDSecG1', 'tDSecG2'};

png.set_of_As = {'tDSecI', 'pDIHold', 1, 'pDOHold', 'tDSecO', 1, ...
    ...% Turnstile
    'pDIHold', 'tDTs', 1, 'tDTs', 'pDSecGQ', 1, ...
    ...% Security guards
    'pDSecGQ', 'tDSecG1', 1, 'pDSecGQ', 'tDSecG2', 1, ...
    'tDSecG1', 'pDOHold', 1, 'tDSecG2', 'pDOHold', 1};

% Avoid queue in holding places
png.set_of_Is = {'pDSecGQ', 'tDSecI', 4, 'pDIHold', 'tDSecI', 2};

png.set_of_Ports = {'tDSecI', 'tDSecO'};