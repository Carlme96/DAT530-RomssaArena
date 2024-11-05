function [fire, transition] = COMMON_PRE (transition)

% COMMON_PRE for South Stand
% Checks arrival times
% Gives colors to the tokens from pSStart

global global_info
switch transition.name
    case 'tSStart'
        % Check if arrival time has passed
        if current_time() > global_info.SOUTH_ARRIVE_TIME(end)
            transition.new_color = 'S';
            global_info.SOUTH_ARRIVE_TIME(end) = []; % Remove the last arrival time
            fire = 1;
        else
            fire = 0;
        end
    otherwise
        fire = 1;
        
end