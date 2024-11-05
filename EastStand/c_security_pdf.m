function [png] = c_security_pdf()

% Module for section C security
png.PN_name = 'CSecurity';

% pCSecGQ - Queue for security check
% pCIHold, pCOHold - Hold for security check
png.set_of_Ps = {'pCSecGQ', 'pCIHold', 'pCOHold'};

% tCSecI, tCSecO - Input and output for security check
% tCTs - Turnstile
% tCSecG1, tCSecG2 - Security guards
png.set_of_Ts = {'tCSecI', 'tCSecO', 'tCTs', 'tCSecG1', 'tCSecG2'};

png.set_of_As = {'tCSecI', 'pCIHold', 1, 'pCOHold', 'tCSecO', 1, ...
    ...% Turnstile
    'pCIHold', 'tCTs', 1, 'tCTs', 'pCSecGQ', 1, ...
    ...% Security guards
    'pCSecGQ', 'tCSecG1', 1, 'pCSecGQ', 'tCSecG2', 1, ...
    'tCSecG1', 'pCOHold', 1, 'tCSecG2', 'pCOHold', 1};

% Avoid queue in holding places
png.set_of_Is = {'pCSecGQ', 'tCSecI', 4, 'pCIHold', 'tCSecI', 2};

png.set_of_Ports = {'tCSecI', 'tCSecO'};