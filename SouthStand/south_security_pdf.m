function [png] = south_security_pdf()

% Module for South security
png.PN_name = 'SouthSecurity';

% pSSecGQ - Queue for security check
% pSIHold, pSOHold - Hold for security check
png.set_of_Ps = {'pSSecGQ', 'pSIHold', 'pSOHold'};

% tSSecI, tSSecO - Input and output for security check
% tSTs1, tSTs2 - Turnstile
% tSSecG1, tSSecG2, tSSecG3 - Security guards
png.set_of_Ts = {'tSSecI', 'tSSecO', 'tSTs1', 'tSTs2', ...
    'tSSecG1', 'tSSecG2', 'tSSecG3'};

png.set_of_As = {'tSSecI', 'pSIHold', 1, 'pSOHold', 'tSSecO', 1, ... 
    ...% Turnstile
    'pSIHold', 'tSTs1', 1, 'pSIHold', 'tSTs2', 1, ... 
    'tSTs1', 'pSSecGQ', 1, 'tSTs2', 'pSSecGQ', 1, ... 
    ...% Security guards
    'pSSecGQ', 'tSSecG1', 1, 'pSSecGQ', 'tSSecG2', 1, ...
    'pSSecGQ', 'tSSecG3', 1, ... 
    'tSSecG1', 'pSOHold', 1, 'tSSecG2', 'pSOHold', 1 ... 
    'tSSecG3', 'pSOHold', 1}; 

% Avoid queue in holding places
png.set_of_Is = {'pSSecGQ', 'tSSecI', 4, 'pSIHold', 'tSSecI', 2};

png.set_of_Ports = {'tSSecI', 'tSSecO'};