function solnSlice = sliceSoln(soln, level, direction, includeEndPts)
%SLICESOLN Slice the solution along the x-, y-, diagonal, or the off-diagonal direction
%   Note: This function returns a column vector

if nargin < 4
    includeEndPts = true;
end

% Reshape solution array
solnLen = length(soln) ^ 0.5;
soln = reshape(soln, [solnLen, solnLen]);

% Slice solution at level. Max makes sure the index is not 0
levelIndex = ceil(solnLen * level);
fprintf("level = %f, levelIndex = %d\n", level, levelIndex);

if direction == "x direction"
    if includeEndPts
        solnSlice = [0; soln(:,levelIndex); 0];
    else
        solnSlice = soln(:,levelIndex);
    end
elseif direction == "y direction"
    if includeEndPts
        solnSlice = [0 soln(levelIndex,:) 0];
    else
        solnSlice = soln(levelIndex,:)';
    end
elseif direction == "diag direction"
    if includeEndPts
        solnSlice = [0; diag(soln); 0];
    else
        solnSlice = diag(soln);
    end
elseif direction == "offdiag direction"
    if includeEndPts
        solnSlice = [0; diag(fliplr(soln)); 0];
    else
        solnSlice = diag(fliplr(soln));
    end
end

end

