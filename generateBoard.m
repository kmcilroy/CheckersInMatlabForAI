function [board] = generateBoard(numRows,numCols,numPieces)
% This creates a new game state where all the checkers are in the starting
% positions



piece = false;
numPiecesTop = 0;
numPiecesBot = 0;
for iterRow = 1:numRows
    for iterCol = 1:numCols
%         disp(numPiecesTop)
        if numPiecesTop < numPieces && piece
            board(iterRow,iterCol) = 1;
            numPiecesTop = numPiecesTop + 1;
        end
        piece = ~piece;
    end
    piece = ~piece;
end

piece = 0;
for iterRow = numRows:-1:1
    for iterCol = numCols:-1:1
        if numPiecesBot < numPieces && piece
            board(iterRow,iterCol) = 2;
            numPiecesBot = numPiecesBot + 1;
        end
        piece = ~piece;
    end
    piece = ~piece;
end


end

