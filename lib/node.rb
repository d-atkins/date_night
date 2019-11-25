class Node
  attr_reader :info
  attr_accessor :left_child, :right_child
  #TO DO: refactor score/title into a single hash (one element)

  def initialize(score, title)
    @info = {title: title, score: score}
  end

  def set_child(child)
    if child.info[:score] < info[:score]
      @left_child = child
    elsif child.info[:score] > info[:score]
      @right_child = child
    end
  end

end
