function [boardFigure] = printBoard(redPieces,blackPieces,numRows,numCols,fancy,boardFigure)
%Disp our boardstate. This is primerily for the viewer.


if nargin < 5
    fancy = 'N';
end
if nargin < 6
    boardFigure = 0;
end

board = zeros(numRows,numCols);

for iterRows = 1:numRows
    for iterCols = 1:numCols
        if ~xor(rem(iterRows,2),rem(iterCols,2))
            board(iterRows,iterCols) = -1;
        end
    end
end

for iterRows = 1:numRows
    for iterCols = 1:numCols
        for iterPieces = 1:numel(redPieces)
            if redPieces(iterPieces).pos(1) == iterRows && redPieces(iterPieces).pos(2) == iterCols
                if strcmp(redPieces(iterPieces).king,'Y')
                    board(iterRows,iterCols) = 2;
                else
                    board(iterRows,iterCols) = 1;
                end
            end
        end
    end
end

for iterRows = 1:numRows
    for iterCols = 1:numCols
        for iterPieces = 1:numel(blackPieces)
            if blackPieces(iterPieces).pos(1) == iterRows && blackPieces(iterPieces).pos(2) == iterCols
                if strcmp(blackPieces(iterPieces).king,'Y')
                    board(iterRows,iterCols) = 6;
                else
                    board(iterRows,iterCols) = 5;
                end
            end
        end
    end
end

disp(num2str(board))
% disp(board)

if strcmp(fancy,'Y')
    close all;
    whiteSquare = zeros(11,11,3); whiteSquare(2:end-1,2:end-1,:) = 1;
    darkGreySquare = zeros(11,11,3); darkGreySquare(2:end-1,2:end-1,:) = 90/255;
    redSquare = darkGreySquare;
    redSquare(3:end-2,3:end-2,1) = 1;
    redSquare(3:end-2,3:end-2,2) = 50/255;
    redSquare(3:end-2,3:end-2,3) = 50/255;
    blueSquare = darkGreySquare;
    blueSquare(3:end-2,3:end-2,2) = 162/255;
    blueSquare(3:end-2,3:end-2,3) = 1;
    redSquareKing = redSquare;
    redSquareKing(4:end-3,4:end-3,:) = 0;
    blueSquareKing = blueSquare;
    blueSquareKing(4:end-3,4:end-3,:) = 0;
    
    boardFancy = 0;
    
    for iterRows = 1:numRows
        thisRow = 0;
        for iterCols = 1:numCols
            switch board(iterRows,iterCols)
                case -1
                    if thisRow == 0
                        thisRow = whiteSquare;
                    else
                        thisRow = cat(2,thisRow,whiteSquare);
                    end
                case 0
                    if thisRow == 0
                        thisRow = darkGreySquare;
                    else
                        thisRow = cat(2,thisRow,darkGreySquare);
                    end
                case 1
                    if thisRow == 0
                        thisRow = redSquare;
                    else
                        thisRow = cat(2,thisRow,redSquare);
                    end
                case 2
                    if thisRow == 0
                        thisRow = redSquareKing;
                    else
                        thisRow = cat(2,thisRow,redSquareKing);
                    end
                case 5
                    if thisRow == 0
                        thisRow = blueSquare;
                    else
                        thisRow = cat(2,thisRow,blueSquare);
                    end
                case 6
                    disp('hi')
                    if thisRow == 0
                        thisRow = blueSquareKing;
                    else
                        thisRow = cat(2,thisRow,blueSquareKing);
                    end
                    
            end
        end
        if boardFancy == 0
            boardFancy = thisRow;
        else
            boardFancy = cat(1,boardFancy,thisRow);
        end
    end
    
    
    boardFigure = figure;
    imagesc(boardFancy);
    xticks((1:numCols)*11-5);
    yticks((1:numRows)*11-5);
    for iter = 1:numRows%:-1:1
        xlabel(iter) = num2realStr(iter);
    end
    for iter = 1:numRows
        ylabel(iter) = num2realStr(iter);
    end
    xticklabels(xlabel)
    yticklabels(ylabel)
    %movegui([450,650])
%     movegui('west');
    
    % imshow(board,'InitialMagnification', 'fit');
    % figure; imagesc(boardFancy);
    
end

end

% boarder = '*';
% for iter = 2:3*(numCols)+1
%     boarder(iter) = '*';
% end
