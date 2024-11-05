function [fire, transition] = COMMON_PRE (transition)

% COMMON_PRE for East Stand
% Checks arrival times
% Gives colors to the tokens from pXStart

global global_info
switch transition.name
    case 'tAStart'
        % Check if arrival time has passed
        if current_time() > global_info.A_ARRIVE_TIME(end)
            transition.new_color = 'A';
            global_info.A_ARRIVE_TIME(end) = []; % Remove the last arrival time
            fire = 1;
        else
            fire = 0;
        end
    case 'tBStart'
        if current_time() > global_info.B_ARRIVE_TIME(end)
            transition.new_color = 'B';
            global_info.B_ARRIVE_TIME(end) = [];
            fire = 1;
        else
            fire = 0;
        end
    case 'tCStart'
        if current_time() > global_info.C_ARRIVE_TIME(end)
            transition.new_color = 'C';
            global_info.C_ARRIVE_TIME(end) = [];
            fire = 1;
        else
            fire = 0;
        end
    case 'tDStart'
        if current_time() > global_info.D_ARRIVE_TIME(end)
            transition.new_color = 'D';
            global_info.D_ARRIVE_TIME(end) = []; 
            fire = 1;
        else
            fire = 0;
        end
    case 'tVIPStart'
        if current_time() > global_info.VIP_ARRIVE_TIME(end)
            transition.new_color = 'VIP';
            global_info.VIP_ARRIVE_TIME(end) = [];
            fire = 1;
        else
            fire = 0;
        end
    otherwise
        fire = 1;
        
end