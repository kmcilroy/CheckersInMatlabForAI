function [board] = updateBoard(redPieces,bluePieces,numRows,numCols)
%Reassign piece location for the new boardstate.

board = zeros(numRows,numCols);

for iterRows = 1:numRows
    for iterCols = 1:numCols
        for iterPieces = 1:numel(redPieces)
            if redPieces(iterPieces).pos(1) == iterRows && redPieces(iterPieces).pos(2) == iterCols
                board(iterRows,iterCols) = 1;
            end
        end
    end
end

for iterRows = 1:numRows
    for iterCols = 1:numCols
        for iterPieces = 1:numel(bluePieces)
            if bluePieces(iterPieces).pos(1) == iterRows && bluePieces(iterPieces).pos(2) == iterCols
                board(iterRows,iterCols) = 2;
            end
        end
    end
end


end

