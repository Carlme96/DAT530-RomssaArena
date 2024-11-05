function [png] = b_security_pdf()

% Module for section B security
png.PN_name = 'BSecurity';

% pBSecGQ - Queue for security check
% pBIHold, pBOHold - Hold for security check
png.set_of_Ps = {'pBSecGQ', 'pBIHold', 'pBOHold'};

% tBSecI, tBSecO - Input and output for security check
% tBTs - Turnstile
% tBSecG1, tBSecG2 - Security guards
png.set_of_Ts = {'tBSecI', 'tBSecO', 'tBTs', 'tBSecG1', 'tBSecG2'};

png.set_of_As = {'tBSecI', 'pBIHold', 1, 'pBOHold', 'tBSecO', 1, ...
    ...% Turnstile
    'pBIHold', 'tBTs', 1, 'tBTs', 'pBSecGQ', 1, ...
    ...% Security guards
    'pBSecGQ', 'tBSecG1', 1, 'pBSecGQ', 'tBSecG2', 1, ...
    'tBSecG1', 'pBOHold', 1, 'tBSecG2', 'pBOHold', 1};

% Avoid queue in holding places
png.set_of_Is = {'pBSecGQ', 'tBSecI', 4, 'pBIHold', 'tBSecI', 2};

png.set_of_Ports = {'tBSecI', 'tBSecO'};