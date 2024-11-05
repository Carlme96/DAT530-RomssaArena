function [fire, transition] = COMMON_PRE (transition)

% COMMON_PRE for West Stand
% Checks arrival times
% Gives colors to the tokens from pXStart
% Makes sure no tokens goes too far in the corridor (HIJK Corridors)

global global_info
switch transition.name
    case 'tHStart'
        % Check if arrival time has passed
        if current_time() > global_info.H_ARRIVE_TIME(end) % Remove the last arrival time
            transition.new_color = 'H';
            global_info.H_ARRIVE_TIME(end) = [];
            fire = 1;
        else
            fire = 0;
        end
    case 'tIStart'
        if current_time() > global_info.I_ARRIVE_TIME(end)
            transition.new_color = 'I';
            global_info.I_ARRIVE_TIME(end) = [];
            fire = 1;
        else
            fire = 0;
        end
    case 'tJStart'
        if current_time() > global_info.J_ARRIVE_TIME(end)
            transition.new_color = 'J';
            global_info.J_ARRIVE_TIME(end) = [];
            fire = 1;
        else
            fire = 0;
        end
    case 'tKStart'
        if current_time() > global_info.K_ARRIVE_TIME(end)
            transition.new_color = 'K';
            global_info.K_ARRIVE_TIME(end) = [];
            fire = 1;
        else
            fire = 0;
        end
    case 'tLStart'
        if current_time() > global_info.L_ARRIVE_TIME(end)
            transition.new_color = 'L';
            global_info.L_ARRIVE_TIME(end) = [];
            fire = 1;
        else
            fire = 0;
        end
    % Corridor behind section L
    % Only used by ticket holders in sections H, I, J and K
    case 'tHIJKCorrI'
        tokID = tokenAnyColor('pNCorr', 1, {'H', 'I', 'J', 'K'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % Corridor behind section K
    % Only used by ticket holders in sections H, I, and J
    case 'tHIJCorrI'
        tokID = tokenAnyColor('pLToK', 1, {'H', 'I', 'J'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % Corridor behind section J
    % Only used by ticket holders in sections H and I
    case 'tHICorrI'
        tokID = tokenAnyColor('pKToJ', 1, {'H', 'I'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % Corridor behind section I
    % Only used by ticket holders in section H
    case 'tHCorrI'
        tokID = tokenAnyColor('pJToI', 1, {'H'});
        transition.selected_tokens = tokID;
        fire = tokID;
    otherwise
        fire = 1;
end