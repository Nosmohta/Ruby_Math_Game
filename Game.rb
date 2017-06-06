

class Game

  attr_reader :player1_name
  attr_reader :player2_name

  def initialize( name1, name2)
    @player1_name = name1
    @player2_name = name2
    @current_turn = 1
    @game_on = 1
  end

  def run_game
    @player1 = Player.new
    @player2 = Player.new

    p "Welcome to the best math game in town!"
    p "Both players start with 3 lives. Good luck!"

    while not MathGame.is_game_over? do
      question = Question.new(@current_turn)
      question.ask_for_nums(MathGame.who_is_asking)
      response = question.prompt_for_answer(MathGame.who_is_anwering)
      correct = question.check_answer?(response)
      if not (correct)
        MathGame.lose_game
      end
      MathGame.switch_turns
      MathGame.display_scores
      if MathGame.is_game_over?
        p "GAME OVER. Thank you for Playing the Math Game!"
      end
    end
  end

  def who_is_asking
    (@current_turn == 1) ? @player1_name : @player2_name
  end

  def who_is_anwering
    (@current_turn == 1) ? @player2_name : @player1_name
  end

  def lose_game
    losing_player = (@current_turn == 1) ? @player2 : @player1
    losing_player.lose_a_point
  end

  def switch_turns
    @current_turn = (@current_turn == 1) ? 0 : 1
  end

  def display_scores
    player1_score = @player1.get_score
    player2_score = @player2.get_score
    p "Remaining points: #{@player1_name} =>  #{player1_score} |||| #{@player2_name} =>  #{player2_score}"

  end

  def is_game_over?
    #check game on Status
    player1_score = @player1.get_score
    player2_score = @player2.get_score
    ((player1_score <= 0 )|| (player2_score <= 0)) ? @game_on = 0 : @game_on = 1
    @game_on == 0
  end

end