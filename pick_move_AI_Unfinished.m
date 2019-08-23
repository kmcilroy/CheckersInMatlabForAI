function [move_chosen] = pick_move_AI_Unfinished(options_F)
% UNFINISHED Currently looking for a way to give give the options of inputs
% to an AI around lines 36

%This function is the meat and bones of our program, it will contain the
%logic to pick a valid move in the board

    %% Scratch work for picking the checkers move

   
    
   %% The ai shit should go here
   [size_options, ~] = size(options_F);
   ai_guess = randi(size_options);
    
    
    %% Output back to function
    move_chosen = options_F(ai_guess,:);

    
end

