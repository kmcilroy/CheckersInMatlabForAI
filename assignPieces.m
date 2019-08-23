function [myPieces,theirPieces] = assignPieces(redPieces,bluePieces,turn)
%Assign player pieces for 'red' and 'blue' sides.

if strcmp(turn,'red')
    myNum = 1;
    theirNum = 2;
    myPieces = redPieces;
    theirPieces = bluePieces;
elseif strcmp(turn,'blue')
    myNum = 1;
    theirNum = 2;
    myPieces = bluePieces;
    theirPieces = redPieces;
else
    disp('Another big problem')
end

end

