close all;
clear; clc;
%% Game Parameters
numRows = 8;
numCols = 8;
numPieces = 12; %per side

%% Initialize Board
board = generateBoard(numRows,numCols,numPieces);


%% Initialize Pieces
[redPieces,bluePieces] = initializePieces(board,'red',numRows,numCols,numPieces);



%% Game
gameOver = 0;
turn = 'red';

gameStats.staleMate = 0;
must_select = [];
while gameOver == 0
    %% Update board
    board = updateBoard(redPieces,bluePieces,numRows,numCols);
    ifJump=0;
    
    %% Print board (DISABLED FOR SPEED)
    printBoard(redPieces,bluePieces,numRows,numCols,'Y');
    %disp(strcat(turn,', begin your turn.'))
    %% Assign myPieces and theirPieces
    [myPieces,theirPieces] = assignPieces(redPieces,bluePieces,turn);
    
    %% Generate valid moves with 'findValidMoves'    
    [myPieces,arrayOfMoves,arrayOfJumps] = findValidMoves(board,myPieces,numRows,numCols,turn);
    
  
    %% Check for Stalemate
    if sum(arrayOfMoves(:,3)) == 0
        endGame(gameStats,1);
    end
    
    %% If jump possible
    num_move = sum(arrayOfMoves(:,3)~=0);
    num_jump = sum(arrayOfJumps(:,3)~=0);
    
    if num_move ~=0
        options_F = arrayOfMoves(arrayOfMoves(:,3)~=0,:);
    end
    
    if num_jump ~=0
        options_F = arrayOfJumps(arrayOfJumps(:,3)~=0,1:6);
        ifJump=1;
    end
    
    
    % compares the must select option (if the previous move was a double
    % jump) to the current options and removes all other options that are
    % not this double jump option
%     if ~isempty(must_select)
%         index = (options_F(:,1:2) == must_select);
%         
%         for index_length = 1:length(index)
%             chosen_double = index(index_length,index);
%         end
%         
%         options_F = options_F(options_F(:,1:2)== must_select)';
%     end
%     
    
    %% DECIDING THE MOVE BLOCK [AI selects which move to use]
        %human edits go back here.
    
    [move_chosen] = pick_move_AI_Unfinished(options_F);
    
    pieceRowIn = move_chosen(1);
    pieceColIn = move_chosen(2);
    moveRowIn = move_chosen(3);
    moveColIn = move_chosen(4);
 
        
    row_del = [];
    col_del = [];
    if max(length(move_chosen)) == 6
        row_del = move_chosen(5);
        col_del = move_chosen(6);
    end
    
    %% Make Move
    for iterPieces = 1:numel(myPieces)
        if myPieces(iterPieces).pos == [pieceRowIn pieceColIn]
            myPieces(iterPieces).pos = [moveRowIn moveColIn];
            clc;
        end
    end
   %% 
    %if I jumped, delete their piece
    if ifJump == 1 
        for iterPieces = 1:numel(theirPieces)
            for iter = 1:size(arrayOfJumps,1)
                if theirPieces(iterPieces).pos(1) == row_del && ...
                        theirPieces(iterPieces).pos(2) == col_del
                    
                    indexToDel = iterPieces;
                    %disp('Got him')
                end
            end
        end
        theirPieces(indexToDel) = [];
        
    end
    
    
    %% Reassign myPieces and theirPieces
    if strcmp(turn,'red')
        redPieces = myPieces;
        bluePieces = theirPieces;
    elseif strcmp(turn,'blue')
        bluePieces = myPieces;
        redPieces = theirPieces;
    end
    
    
    
    %% check if can jump again [incomplete]
    board = updateBoard(redPieces,bluePieces,numRows,numCols);
    %[move_chosen,jump_coord] = pick_move_AI_Unfinished(board,myPieces,numRows,numCols,turn);
    %%%saved position [moveRowIn moveColIn]
    
    if ifJump == 1 
        %disp('You must jump again')
        must_select = [moveRowIn, moveColIn];
        
        continue;
        
    elseif ifJump == 0
        must_select = [];
    end
    
    
    
    %% check I am a king
    for iterPieces = 1:numel(myPieces)
        if strcmp('red',turn) && myPieces(iterPieces).pos(1) == numRows
            myPieces(iterPieces).king = 'Y';
            redPieces = myPieces;
            bluePieces = theirPieces;
        elseif strcmp('blue',turn) && myPieces(iterPieces).pos(1) == 1
            myPieces(iterPieces).king = 'Y';
            bluePieces = myPieces;
            redPieces = theirPieces;
        end
    end

    %% Check if I won
    if numel(theirPieces) == 0
        board = updateBoard(redPieces,bluePieces,numRows,numCols);
        printBoard(redPieces,bluePieces,numRows,numCols,'Y');
        gameOver = 1;
        disp(strcat('Congratulations-',turn,'-you have won!!!'));
    end
    
    %% Change turns / Update redPieces and bluePieces
    if strcmp(turn,'red')
        turn = 'blue';
    elseif strcmp(turn,'blue')
        turn = 'red';
    end
    
    must_select= [];
    %**********FOR TEST ONLY*********
    %     gameOver = 1;
    
end




