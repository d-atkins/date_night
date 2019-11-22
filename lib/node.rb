class Node
  attr_reader :score, :title, :left_child, :right_child
  def initialize(score, title)
    @score = score
    @title = title
  end

  def set_left(child)
    @left_child = child
  end

  def set_right(child)
    @right_child = child
  end
  
end
