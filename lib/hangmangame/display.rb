class Display
  def initialize
  end

  def introduction
    <<-EOS
    \t\t <<< WELCOME TO HANGMAN GAME >>>>
    \t\t+++++++++++++++++++++++++++++++++
    \t\t <<< Press any key to continue >>>
    EOS
  end

  def  show_start_menu
     one = "1. New Game"
     two = "2. Load Save Game"
     three = "3. How to play"
     four = "4. About this Game"
     quit = "X. Quit."
     start_views(one, two, three, four, quit)
  end

  def start_views(one, two, three, four, quit)
    <<-EOS
      \t\t <<< MENU SELECT YOUR OPTIONS >>>>\n
      \t\t+++++++++++++++++++++++++++++++++\n
      \t\t #{one}    #{two}   #{three}\n
      \t\t #{four}   #{quit}\n
      Please enter select an option (1-4): 
    EOS
  end

  def game_warning
    "\t\t << Try to guess what i have in mind otherwise i will hang you >>"
  end

  def load_successfully
    <<-EOS
    \t\t <<< Game was successfully loaded you can continue >>>
    EOS
  end  

def instruction
    <<-EOS
          \t\t ===================================================
          \t\t     The word to guess is represented by a row of dashes, representing each letter of the word.
          \t\t     Words you cannot use include proper nouns such as names, places, and brands.
          \t\t     If the guessing player suggests a letter which occurs in the word, the other player writes it in all its correct positions.
          \t\t     If the suggested letter or number does not occur in the word,
          \t\t     the other player draws one element of a hanged man stick figure as a tally mark. The game is over when:
          \t\t     An example game in progress; the answer is Wikipedia.
          \t\t    The guessing player completes the word, or guesses the whole word correctly
          \t\t    The other player completes the diagram:
          \t\t====================================================
      EOS
end

def playing(select, chances, misses, game_data)
  <<-EOS
      Please choose a letter
      Word: #{game_data}
      Guess: #{select}
      Misses: #{misses}
      chances: #{chances}
    EOS
end

def gameover
  <<-EOS
  \t\t <<< GAME OVER >>>>
  \t\t+++++++++++++++++++++++++++++++++
  EOS
  conclusion
end

def save_game
  <<-EOS
  \t\t <<< Enter The Name Of Your Game >>>>
  Note Previouse game will be override
  \t\t+++++++++++++++++++++++++++++++++
  EOS
end

def you_won
 <<-EOS
  \t\t <<< You are a brainiac >>>>
  \t\t You won. you are free to go
  \t\t+++++++++++++++++++++++++++++++++
  EOS
end  

 def conclusion
   <<-EOS
   \t\t <<< Goodbye >>>>
   \t\t+++++++++++++++++++++++++++++++++
   EOS
 end
end
