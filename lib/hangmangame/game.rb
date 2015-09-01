require_relative 'display'
require_relative 'model'
require_relative 'helper'

class Game
  include ::Hangman::Helper
  #This is the initialize class
  #it initialize all need instace varible of the class
  def initialize
    @display = Display.new
    @display.introduction
    @model = Model.new
  end

 #Thi method is called by the initialize.
 #it calles the display views callsed
 #show_start_menu after instatiation
  def start_menu
    send_message(@display.show_start_menu)
    menu
  end

 #This Method get the user input as instructed and called
 #the ness method base on what the use as select
  def menu
    option_choice = get_input('')
    case option_choice
      when "1"
        menu_start_game
      when "2"
        load
      when "3"
       menu_instruction
      when "4", "X", "x", "Q", "q", :quit
        @display.conclusion
      else
        menu_invalid_entry
      end
  end

  def menu_start_game
    @status = :game_started
    game_method
  end 

  def menu_instruction
    send_message(@display.instruction)
    start_menu
  end

  def menu_invalid_entry
    send_message "Invalid entry, retry"
    sleep 1
    menu
  end
 
 def game_method
   until @model.game_complete
     select = get_input(@display.game_warning).downcase
     break if this_is_a_control_method(select)
     break if this_is_the_complete_secret(select)
     check_selection(select)
   end
   you_have_exhausted_all_your_chances if @model.chances == 0
 end
 
  def this_is_a_control_method(selection)
   if selection == '*' || selection == '!'
    return @display.conclusion if selection == '!'
    return save if selection == '*'
    true
   end
  end

  def save
    @model.save_game(@display.save_game)
  end
 
  def this_is_the_complete_secret(selection)
     if @model.correct_secrect(selection) == @model.secret
        send_message @display.you_won
        start_menu
     end
  end
  
  def check_selection(selection, saved_game = false)
    this_is_the_right_selection(selection) if @model.secret_match?(selection)
    this_is_the_wrong_selection(selection, saved_game) unless @model.secret_match?(selection)
  end
  
  def this_is_the_right_selection(selection)
    send_message(@display.playing(selection, @model.chances, @model.misses, @model.correct_secrect(selection)))
  end
  
  def this_is_the_wrong_selection(selection, saved_game)
    send_message "its wrong"
    @model.remove_chance unless saved_game
    send_message(@display.playing(selection, @model.chances, @model.misses, @model.correct_secrect(selection)))
  end

  def you_have_exhausted_all_your_chances
    if @model.chances == 0
      @display.gameover
      send_message "hahahahah this is the word: #{@model.secret}"
    end
  end
  
 def load
  send_message(@display.load_successfully)
  @model.load_game
  check_selection(@model.guessed, true)
  game_method
 end
end
