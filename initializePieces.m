function [redPieces, blackPieces] = initializePieces(board,color,numRows,numCols,numPieces)
%Set up the board state for the turn.

pieceCount = 1;
for iterRow = numRows:-1:1
    for iterCol = numCols:-1:1
        if board(iterRow,iterCol) == 1
            redPieces(pieceCount).color = 'red';
            redPieces(pieceCount).pos = [iterRow iterCol];
            redPieces(pieceCount).king = 'N';
            pieceCount = pieceCount + 1;
        end
    end
end


pieceCount = 1;
for iterRow = numRows:-1:1
    for iterCol = numCols:-1:1
        if board(iterRow,iterCol) == 2
            blackPieces(pieceCount).color = 'black';
            blackPieces(pieceCount).pos = [iterRow iterCol];
            blackPieces(pieceCount).king = 'N';
            pieceCount = pieceCount + 1;
        end
    end
end



end

