function [fire, transition] = MOD_EastStand_PRE (transition)

% MOD_EastStand_PRE
% Filters colors to send to right final stairs

switch transition.name
    % From A security to section A
    case 'tAStairs'
        tokID = tokenAnyColor('pAStairs', 1, {'A'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % From B security to section B
    case 'tBStairs'
        tokID = tokenAnyColor('pBStairs', 1, {'B'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % From B security to section C
    case 'tCStairs1'
        tokID = tokenAnyColor('pBStairs', 1, {'C'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % From C security to section C
    case 'tCStairs2'
        tokID = tokenAnyColor('pCStairs', 1, {'C'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % From C security to section D
    case 'tDStairs1'
        tokID = tokenAnyColor('pCStairs', 1, {'D'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % From D security to section D
    case 'tDStairs2'
        tokID = tokenAnyColor('pDStairs', 1, {'D'});
        transition.selected_tokens = tokID;
        fire = tokID;
    % From VIP security to VIP section
    case 'tVIPStairs'
        tokID = tokenAnyColor('pVIPStairs', 1, {'VIP'});
        transition.selected_tokens = tokID;
        fire = tokID;
    otherwise
        fire = 1;
end