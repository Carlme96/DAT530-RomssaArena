function [fire, transition] = MOD_WestStand_PRE (transition)

% MOD_WestStand_PRE
% Makes sure tokens use the correct stairs

switch transition.name
    % Stairs to section L
    case 'tLStairs'
        tokID = tokenAnyColor('pNCorr', 1, {'L'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % Stairs to section K
    case 'tKStairs'
        tokID = tokenAnyColor('pLToK', 1, {'K'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % Stairs to section J
    case 'tJStairs'
        tokID = tokenAnyColor('pKToJ', 1, {'J'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % Stairs to section I
    case 'tIStairs'
        tokID = tokenAnyColor('pJToI', 1, {'I'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % Stairs to section H
    case 'tHStairs'
        tokID = tokenAnyColor('pIToH', 1, {'H'});
        transition.selected_tokens = tokID;
        fire = tokID;
    otherwise
        fire = 1;
end
