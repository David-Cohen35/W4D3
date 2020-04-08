# Phase V: Piece#valid_moves

# You will want a method on Piece that filters out the #moves of a Piece that would leave the player in check. A good approach is to write a Piece#move_into_check?(end_pos) method that will:

# Duplicate the Board and perform the move
# Look to see if the player is in check after the move (Board#in_check?)
# To do this, you'll have to write a Board#dup method. Your #dup method should duplicate not only the Board, but the pieces on the Board. Be aware: Ruby's #dup method does not call dup on the instance variables, so you may need to write your own Board#dup method that will dup the individual pieces as well.

# A note on deep duping your board

# As we saw when we recreated #dup using recursion, Ruby's native #dup method does not make a deep copy. This means that nested arrays and any arrays stored in instance variables will not be copied by the normal dup method:

# # Example: if piece position is stored as an array
# queen = Queen.new([0, 1])
# queen_copy = queen.dup

# # shouldn't modify original queen
# queen_copy.position[0] = "CHANGED"
# # but it does
# queen.position # => ["CHANGED", 1]
# Caution on duping pieces

# If your piece holds a reference to the original board, you will need to update this reference to the new duped board. Failure to do so will cause your duped board to generate incorrect moves!

# An alternative to duping?

# Another way to write #valid_moves would be to make the move on the original board, see if the player is in check, and then "undo" the move. However, this would require that Board have a method to undo moves.

# Once you write your Board#dup method, it'll be very straightforward to write Piece#valid_moves without complicated do/undo logic.

# It will likely help at this point to put some debug information into your Display class. Set a boolean variable on initialize of your Display for whether or not to show your debug info (you want to be able to easily turn this off). If that flag is set to true, then output some debug info, such as the selected piece's available moves, whether your opponent is in check, and so on.

# Test each piece's #valid moves! In pry load 'board.rb' and create a Board instance. Grab an instance of each type of piece (ie. from its position on the board) and check that calling #valid_moves returns what we expect. When you are satisfied it works call a TA over for a code review!

# Further Board improvements

# Modify your Board#move_piece method so that it only allows you to make valid moves. Because Board#move_piece needs to call Piece#valid_moves, #valid_moves must not call Board#move_piece. But #valid_moves needs to make a move on the duped board to see if a player is left in check. For this reason, write a method Board#move_piece!(start_pos, end_pos) which makes a move without checking if it is valid.

# Board#move_piece should raise an exception if it would leave you in check.

