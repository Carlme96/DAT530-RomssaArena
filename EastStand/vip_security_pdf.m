function [png] = vip_security_pdf()

% Module for section VIP security
png.PN_name = 'VIPSecurity';

% pVIPSecGQ - Queue for security check
% pVIPIHold, pVIPOHold - Hold for security check
png.set_of_Ps = {'pVIPSecGQ', 'pVIPIHold', 'pVIPOHold'};

% tVIPSecI, tVIPSecO - Input and output for security check
% tVIPTs - Turnstile
% tVIPSecG1, tVIPSecG2 - Security guards
png.set_of_Ts = {'tVIPSecI', 'tVIPSecO', 'tVIPTs', 'tVIPSecG1', 'tVIPSecG2'};

png.set_of_As = {'tVIPSecI', 'pVIPIHold', 1, 'pVIPOHold', 'tVIPSecO', 1, ...
    ...% Turnstile
    'pVIPIHold', 'tVIPTs', 1, 'tVIPTs', 'pVIPSecGQ', 1, ...
    ...% Security guards
    'pVIPSecGQ', 'tVIPSecG1', 1, 'pVIPSecGQ', 'tVIPSecG2', 1, ...
    'tVIPSecG1', 'pVIPOHold', 1, 'tVIPSecG2', 'pVIPOHold', 1};

% Avoid queue in holding places
png.set_of_Is = {'pVIPSecGQ', 'tVIPSecI', 4, 'pVIPIHold', 'tVIPSecI', 2};

png.set_of_Ports = {'tVIPSecI', 'tVIPSecO'};