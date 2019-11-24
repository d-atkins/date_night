require './lib/node'

class BinarySearchTree
  attr_reader :root
  def initialize
  end

  def take_step(current_node, score)

    if score > current_node.score
      return current_node.right_child
    elsif score < current_node.score
      return current_node.left_child
    end

  end

  def insert(score, title=nil)

    node = Node.new(score, title)
    depth = 0

    if @root.nil?
      @root = node
      return depth

    else
      parent_node = @root

      loop do
        next_node = take_step(parent_node, score)
        if (next_node.nil?)
          parent_node.set_child(node) if !title.nil?
          depth += 1
          return depth
        else
          depth += 1
          parent_node = next_node
        end
      end

    end

  end

  def include?(score)

    current_node = @root
    while (!current_node.nil?) do
      return true if current_node.score == score
      current_node = take_step(current_node, score)
    end

    return false

  end

  def depth_of(score)
    return insert(score)
  end

end
