class Node
  attr_reader :score, :title
  attr_accessor :left_child, :right_child

  def initialize(score, title)
    @score = score
    @title = title
  end

  def set_child(child)
    if child.score < score
      @left_child = child
    elsif child.score > score
      @right_child = child
    end
  end
  
end
