function [] = MOD_EastStand_POST (transition)

% MOD_EastStand_POST
% Changes priorities of which queue to choose

%{
Tokens should choose the smallest queue.
When token chooses an entrance, the priority of the entrance decreases.

When leaving the queue, the priority of the entrance increases.

B can use B entrance
C can use B or C entrances
D can use C or D entrances
%}
switch transition.name
    % B chooses B, dec B
    case 'tBChooseB'
        pvalue = get_priority('tCChooseB');
        priorset('tCChooseB', pvalue-1);
    % C chooses B, dec B
    case 'tCChooseB'
        pvalue = get_priority('tCChooseB');
        priorset('tCChooseB', pvalue-1);
    % C chooses C, dec C
    case 'tCChooseC'
        pvalue = get_priority('tCChooseC');
        priorset('tCChooseC', pvalue-1);
        priorset('tDChooseC', pvalue-1);
    % D chooses C, dec C
    case 'tDChooseC'
        pvalue = get_priority('tDChooseC');
        priorset('tCChooseC', pvalue-1);
        priorset('tDChooseC', pvalue-1);
    % D chooses D, dec D
    case 'tDChooseD'
        pvalue = get_priority('tDChooseD');
        priorset('tDChooseD', pvalue-1);
    % B leaves B, inc B
    case 'tBStairs'
        pvalue = get_priority('tCChooseB');
        priorset('tCChooseB', pvalue+1);
    % C leaves B, inc B
    case 'tCStairs1'
        pvalue = get_priority('tCChooseB');
        priorset('tCChooseB', pvalue+1);
    % C leaves C, inc C
    case 'tCStairs2'
        pvalue = get_priority('tCChooseC');
        priorset('tCChooseC', pvalue+1);
        priorset('tDChooseC', pvalue+1);
    % D leaves C, inc C
    case 'tDStairs1'
        pvalue = get_priority('tDChooseC');
        priorset('tCChooseC', pvalue+1);
        priorset('tDChooseC', pvalue+1);
    % D leaves D, inc D
    case 'tDStairs2'
        pvalue = get_priority('tDChooseD');
        priorset('tDChooseD', pvalue+1);
    otherwise
end