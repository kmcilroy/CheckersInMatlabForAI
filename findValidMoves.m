function [myPieces,arrayOfMoves,arrayOfJumps] = findValidMoves(board,myPieces,numRows,numCols,turn)
%A monster of a function that outputs possible jumping and sliding moves.


if strcmp(turn,'red')
    myNum = 1;
    theirNum = 2;
    primeDir = 'down';
elseif strcmp(turn,'blue')
    myNum = 2;
    theirNum = 1;
    primeDir = 'up';
else
    disp('Prob in find Valid Moves')
end


arrayOfMoves = zeros(4*numel(myPieces),4);
arrayOfJumps = zeros(4*numel(myPieces),6);
for iterPieces = 1:numel(myPieces)
    canJump = 0;
    %initialize array
    arrayOfMoves((iterPieces*4-3:iterPieces*4),1) = myPieces(iterPieces).pos(1);
    arrayOfMoves((iterPieces*4-3:iterPieces*4),2) = myPieces(iterPieces).pos(2);
    arrayOfJumps((iterPieces*4-3:iterPieces*4),1) = myPieces(iterPieces).pos(1);
    arrayOfJumps((iterPieces*4-3:iterPieces*4),2) = myPieces(iterPieces).pos(2);
    
    %check single moves
    if strcmp(turn,'red')
        if strcmp(myPieces(iterPieces).king,'Y')
            if myPieces(iterPieces).pos(1) > 1 && myPieces(iterPieces).pos(2) > 1
                if board(myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)-1) == 0
                    myPieces(iterPieces).validSingleMoves.UL = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)-1];
                    arrayOfMoves(iterPieces*4-3,3:4) = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)-1];
                end
            end
            if myPieces(iterPieces).pos(1) > 1 && myPieces(iterPieces).pos(2) < numCols
                if board(myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)+1) == 0
                    myPieces(iterPieces).validSingleMoves.UR = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)+1];
                    arrayOfMoves(iterPieces*4-2,3:4) = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)+1];
                end
            end
        end
        if myPieces(iterPieces).pos(1) < numRows && myPieces(iterPieces).pos(2) > 1
            if board(myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)-1) == 0
                myPieces(iterPieces).validSingleMoves.DL = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)-1];
                arrayOfMoves(iterPieces*4-1,3:4) = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)-1];
            end
        end
        if myPieces(iterPieces).pos(1) < numRows && myPieces(iterPieces).pos(2) < numCols
            if board(myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)+1) == 0
                myPieces(iterPieces).validSingleMoves.DR = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)+1];
                arrayOfMoves(iterPieces*4,3:4) = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)+1];
            end
        end
        
        
        
    elseif strcmp(turn,'blue')
        
        if myPieces(iterPieces).pos(1) > 1 && myPieces(iterPieces).pos(2) > 1
            if board(myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)-1) == 0
                myPieces(iterPieces).validSingleMoves.UL = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)-1];
                arrayOfMoves(iterPieces*4-3,3:4) = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)-1];
            end
        end
        if myPieces(iterPieces).pos(1) > 1 && myPieces(iterPieces).pos(2) < numCols
            if board(myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)+1) == 0
                myPieces(iterPieces).validSingleMoves.UR = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)+1];
                arrayOfMoves(iterPieces*4-2,3:4) = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)+1];
            end
        end
        if strcmp(myPieces(iterPieces).king,'Y')
            if myPieces(iterPieces).pos(1) < numRows && myPieces(iterPieces).pos(2) > 1
                if board(myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)-1) == 0
                    myPieces(iterPieces).validSingleMoves.DL = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)-1];
                    arrayOfMoves(iterPieces*4-1,3:4) = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)-1];
                end
            end
            if myPieces(iterPieces).pos(1) < numRows && myPieces(iterPieces).pos(2) < numCols
                if board(myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)+1) == 0
                    myPieces(iterPieces).validSingleMoves.DR = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)+1];
                    arrayOfMoves(iterPieces*4,3:4) = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)+1];
                end
            end
        end
    end
    
    
    %check jump moves
    if strcmp(turn,'red')
        
        myPieces(iterPieces).validJumps = [];
        if myPieces(iterPieces).pos(1) < numRows-1 && myPieces(iterPieces).pos(2) > 2
            if board(myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)-1) == theirNum
                if board(myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)-2) == 0
                    myPieces(iterPieces).validJumps.DL = [myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)-2];
                    arrayOfJumps(iterPieces*4-1,3:4) = [myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)-2];
                    arrayOfJumps(iterPieces*4-1,5:6) = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)-1];
                    canJump = 1;
                end
            end
        end
        if myPieces(iterPieces).pos(1) < numRows-1 && myPieces(iterPieces).pos(2) < numCols-1
            if board(myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)+1) == theirNum
                if board(myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)+2) == 0
                    myPieces(iterPieces).validJumps.DR = [myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)+2];
                    arrayOfJumps(iterPieces*4,3:4) = [myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)+2];
                    arrayOfJumps(iterPieces*4,5:6) = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)+1];
                    canJump = 1;
                end
            end
        end
        if strcmp(myPieces(iterPieces).king,'Y')
            if myPieces(iterPieces).pos(1) > 2 && myPieces(iterPieces).pos(2) > 2
                if board(myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)-1) == theirNum
                    if board(myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)-2) == 0
                        myPieces(iterPieces).validJumps.UL = [myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)-2];
                        arrayOfJumps(iterPieces*4-3,3:4) = [myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)-2];
                        arrayOfJumps(iterPieces*4-3,5:6) = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)-1];
                        canJump = 1;
                    end
                end
            end
            if myPieces(iterPieces).pos(1) > 2 && myPieces(iterPieces).pos(2) < numCols-1
                if board(myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)+1) == theirNum
                    if board(myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)+2) == 0
                        myPieces(iterPieces).validJumps.UR = [myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)+2];
                        arrayOfJumps(iterPieces*4-2,3:4) = [myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)+2];
                        arrayOfJumps(iterPieces*4-2,5:6) = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)+1];
                        canJump = 1;
                    end
                end
            end
            
        end
    elseif strcmp(turn,'blue')
        
        myPieces(iterPieces).validJumps = [];
        if myPieces(iterPieces).pos(1) > 2 && myPieces(iterPieces).pos(2) > 2
            if board(myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)-1) == theirNum
                if board(myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)-2) == 0
                    myPieces(iterPieces).validJumps.UL = [myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)-2];
                    arrayOfJumps(iterPieces*4-3,3:4) = [myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)-2];
                    arrayOfJumps(iterPieces*4-3,5:6) = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)-1];
                    canJump = 1;
                end
            end
        end
        if myPieces(iterPieces).pos(1) > 2 && myPieces(iterPieces).pos(2) < numCols-1
            if board(myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)+1) == theirNum
                if board(myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)+2) == 0
                    myPieces(iterPieces).validJumps.UR = [myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)+2];
                    arrayOfJumps(iterPieces*4-2,3:4) = [myPieces(iterPieces).pos(1)-2,myPieces(iterPieces).pos(2)+2];
                    arrayOfJumps(iterPieces*4-2,5:6) = [myPieces(iterPieces).pos(1)-1,myPieces(iterPieces).pos(2)+1];
                    canJump = 1;
                end
            end
        end
        if strcmp(myPieces(iterPieces).king,'Y')
            
            if myPieces(iterPieces).pos(1) < numRows-1 && myPieces(iterPieces).pos(2) > 2
                if board(myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)-1) == theirNum
                    if board(myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)-2) == 0
                        myPieces(iterPieces).validJumps.DL = [myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)-2];
                        arrayOfJumps(iterPieces*4-3,3:4) = [myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)-2];
                        arrayOfJumps(iterPieces*4-3,5:6) = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)-1];
                        canJump = 1;
                    end
                end
            end
            if myPieces(iterPieces).pos(1) < numRows-1 && myPieces(iterPieces).pos(2) < numCols-1
                if board(myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)+1) == theirNum
                    if board(myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)+2) == 0
                        myPieces(iterPieces).validJumps.DR = [myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)+2];
                        arrayOfJumps(iterPieces*4,3:4) = [myPieces(iterPieces).pos(1)+2,myPieces(iterPieces).pos(2)+2];
                        arrayOfJumps(iterPieces*4,5:6) = [myPieces(iterPieces).pos(1)+1,myPieces(iterPieces).pos(2)+1];
                        canJump = 1;
                    end
                end
            end
            
        end
        
        
        
        
    end

    myPieces(iterPieces).canJump = canJump;

end




end
