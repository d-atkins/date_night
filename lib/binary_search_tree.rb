require './lib/node'

class BinarySearchTree
  attr_reader :root
  def initialize
  end

  def insert(score, title)
    node = Node.new(score, title)
    current_node = @root
    depth = 0
    if !@root
      @root = node
    else
      depth += 1
      loop do
        if node.score > current_node.score
          if current_node.right_child
            current_node = current_node.right_child
            depth += 1
          else
            current_node.set_right(node)
            break
          end
        elsif node.score < current_node.score
          if current_node.left_child
            current_node = current_node.left_child
            depth += 1
          else
            current_node.set_left(node)
            break
          end
        else
          break
        end
      end
    end
    return depth
  end

end
