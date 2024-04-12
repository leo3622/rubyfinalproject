#Tic tac toe game
#Funciton that prints the board to the console
#that takes the board as an argument and prints it
def print_board(board)
    for i in 0..2
        for j in 0..2
            print "|" + board[i][j] + "|"
        end
        puts
    end
end
#Function that takes the board, a position, and a player as arguments
#and updates the board at the given position with the given player
def update_board(board, i, j, player)
    board[i][j] = player
end
#Function that takes the board as an argument and returns true if the board is full
def is_full(board)
    for i in 0..2
        for j in 0..2
            if board[i][j] == " "
                return false
            end
        end
    end
    return true
end
#Function that takes the board as an argument and returns true if the board has a winner
def is_win(board)
    for i in 0..2
        if board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != " "
            return true
        end
        if board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != " "
            return true
        end
    end
    if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != " "
        return true
    end
    if board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != " "
        return true
    end
    return false
end
#function that controls the bot's turn
def bot_turn(board, bot)
    #Loop until the bot makes a valid move
    loop do
        #Generate a random position
        i = rand(3)
        j = rand(3)
        #If the position is empty, update the board and break the loop
        if board[i][j] == " "
            update_board(board, i, j, bot)
            break
        end
    end
end
#run function
def run()
    #Create a 3x3 board with 9 empty spaces
    board = Array.new(3) { Array.new(3, " ") }
    #declare the player and bot
    #player is X and bot is O
    player = "X"
    bot = "O"
    #Print the board
    print_board(board)
    #Loop until the game is over
    while true
        #Player's turn
        puts "Player's turn"
        #Loop until the player makes a valid move
        loop do
            #Get the position from the player
            puts "Enter the row and column (0-2): IE: 0 1"
            i, j = gets.chomp.split.map(&:to_i)
            #If the position is empty, update the board and break the loop
            if board[i][j] == " "
                update_board(board, i, j, player)
                break
            end
        end
        #Print the board
        print_board(board)
        #Check if the player has won
        if is_win(board)
            puts "Player wins!"
            break
        end
        #Check if the board is full
        if is_full(board)
            puts "It's a tie!"
            break
        end
        #Bot's turn
        puts "Bot's turn"
        bot_turn(board, bot)
        #Print the board
        print_board(board)
        #Check if the bot has won
        if is_win(board)
            puts "Bot wins!"
            break
        end
        #Check if the board is full
        if is_full(board)
            puts "It's a tie!"
            break
        end
    end
end
#Run the game
run()