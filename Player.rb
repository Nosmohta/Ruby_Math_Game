
class Player


  def initialize
    @score = 3
  end

  def get_score
    @score
  end

  def lose_a_point
    @score = @score - 1
  end



end