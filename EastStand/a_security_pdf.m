function [png] = a_security_pdf()

% Module for section A security
png.PN_name = 'ASecurity';

% pASecGQ - Queue for security check
% pAIHold, pAOHold - Hold for security check
png.set_of_Ps = {'pASecGQ', 'pAIHold', 'pAOHold'};

% tASecI, tASecO - Input and output for security check
% tATs - Turnstile
% tASecG1, tASecG2 - Security guards
png.set_of_Ts = {'tASecI', 'tASecO', 'tATs', 'tASecG1', 'tASecG2'};

png.set_of_As = {'tASecI', 'pAIHold', 1, 'pAOHold', 'tASecO', 1, ...
    ...% Turnstile
    'pAIHold', 'tATs', 1, 'tATs', 'pASecGQ', 1, ...
    ...% Security guards
    'pASecGQ', 'tASecG1', 1, 'pASecGQ', 'tASecG2', 1, ...
    'tASecG1', 'pAOHold', 1, 'tASecG2', 'pAOHold', 1};

% Avoid queue in holding places
png.set_of_Is = {'pASecGQ', 'tASecI', 4, 'pAIHold', 'tASecI', 2};

png.set_of_Ports = {'tASecI', 'tASecO'};