function [png] = hij_corr_pdf()

% Module for HIJ corridor (Between sections K and J)
% Only used by ticket holders in sections H, I and J
% Used to simulate time taken to move between sections
png.PN_name = 'HIJCorridor';

png.set_of_Ps = {'pHIJIHold', 'pHIJOHold'};

% tHIJCorrI, tHIJCorrO - Input and output for HIJ corridor
% tHIJ* - transition through corridor, amount based on capacity
png.set_of_Ts = {'tHIJCorrI', 'tHIJCorrO', ...
    'tHIJ1', 'tHIJ2', 'tHIJ3', 'tHIJ4', 'tHIJ5', ...
    'tHIJ6', 'tHIJ7', 'tHIJ8', 'tHIJ9', 'tHIJ10'};

png.set_of_As = {'tHIJCorrI', 'pHIJIHold', 1, 'pHIJOHold', 'tHIJCorrO', 1, ...
    'pHIJIHold', 'tHIJ1', 1, 'pHIJIHold', 'tHIJ2', 1, ...
    'pHIJIHold', 'tHIJ3', 1, 'pHIJIHold', 'tHIJ4', 1, ...
    'pHIJIHold', 'tHIJ5', 1, 'pHIJIHold', 'tHIJ6', 1, ...
    'pHIJIHold', 'tHIJ7', 1, 'pHIJIHold', 'tHIJ8', 1, ...
    'pHIJIHold', 'tHIJ9', 1, 'pHIJIHold', 'tHIJ10', 1, ...
    'tHIJ1', 'pHIJOHold', 1, 'tHIJ2', 'pHIJOHold', 1, ...
    'tHIJ3', 'pHIJOHold', 1, 'tHIJ4', 'pHIJOHold', 1, ...
    'tHIJ5', 'pHIJOHold', 1, 'tHIJ6', 'pHIJOHold', 1, ...
    'tHIJ7', 'pHIJOHold', 1, 'tHIJ8', 'pHIJOHold', 1, ...
    'tHIJ9', 'pHIJOHold', 1, 'tHIJ10', 'pHIJOHold', 1};

png.set_of_Ports = {'tHIJCorrI', 'tHIJCorrO'};