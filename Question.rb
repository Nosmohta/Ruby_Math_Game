

class Question

  def initialize(asking_player)
    @num_a = 0
    @num_b = 0
    @answer = nil
    @response = nil
    @asking_player_number = asking_player
  end

  def  ask_for_nums(current_player)
    #set state questions
    p '---------------new question -----------------------'
    p "#{current_player}, please enter your first number"
    p '=>'
    @num_a = $stdin.gets.chomp
    p "#{current_player}, please enter your second number"
    p '=>'
    @num_b = $stdin.gets.chomp
    @answer = @num_a.to_i + @num_b.to_i
  end

  def prompt_for_answer(answering_name)
    p "#{answering_name}, please provide your answer"
    p '=>'
    @response = $stdin.gets.chomp
  end

  def check_answer?(response)
    (response.to_i == @answer) ? (puts "Good Job!") : (puts "Too Bad, better luck next time!")
    response.to_i == @answer
  end

end