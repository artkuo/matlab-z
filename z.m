function z(userstring)
% z DIRSUBSTR  Change current working directory to best match
%
%    Uses a fuzzy match between input DIRSUBSTR (directory substring) and
%    the recent history of working directories.
%
%    For example, for recent directories "path/to/dir1" and "path/dir2", the
%    command "z 1" will match to "dir1" and change to that directory.

% Inspired by z directory jumping in zsh, zoxide command line tool.
% Heavy lifting is done by fzsearch, Matlab file exchange 66271-fuzzy-search.

    S = settings();
    hx = S.matlab.desktop.currentfolder.History.PersonalValue; % cell array with recent history
    [dirpath, dirname, dirext] = fileparts(hx);
    N = length(hx);
    if nargin == 0 % an empty input defaults to previous directory
        disp(hx{2})
        cd(hx{2})
        return
    end

    % A non-empty input is used to find the best match within recent history
    dist = zeros(N,1);
    for i = 1:N
        d = fzsearch(dirname{i}, userstring);
        dist(i) = d(1); % keep the best matches
    end
    [~, bestmatch] = min(dist);
    disp(hx{bestmatch})
    cd(hx{bestmatch})
end
