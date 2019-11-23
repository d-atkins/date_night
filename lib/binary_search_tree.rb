require './lib/node'

class BinarySearchTree
  attr_reader :root
  def initialize
  end

  def traverse(score)
    current_node = @root

    #traverse the tree, return the node whose
    #score is equal to parameter, or the last node found
    #return nil if no nodes found
    loop do
      if current_node.nil?
        return current_node

      elsif score > current_node.score
        if current_node.right_child
          current_node = current_node.right_child
        else
          return current_node
        end

      elsif score < current_node.score
        if current_node.left_child
          current_node = current_node.left_child
        else
          return current_node
        end
      end

    end

  end

  def insert(score, title)
    #create new node -> node = Node.new(score, title)
    #invoke traverse(score) -> store in t_node
        #do nothing if include?(score)
    #set node to root if traverse returns nil
    #set node to t_node left child if score is less
    #set node to t_node right child if score is greater

    if include?(score)
      return
    end

    node = Node.new(score, title)
    parent_node = traverse(score)

    if !parent_node
      @root = node
    elsif node.score > parent_node.score
      parent_node.set_right(node)
    elsif node.score < parent_node.score
      parent_node.set_left(node)
    end

    # node = Node.new(score, title)
    # current_node = @root
    # depth = 0
    # if !@root
    #   @root = node
    # else
    #   depth += 1
    #   loop do
    #     if node.score > current_node.score
    #       if current_node.right_child
    #         current_node = current_node.right_child
    #         depth += 1
    #       else
    #         current_node.set_right(node)
    #         break
    #       end
    #     elsif node.score < current_node.score
    #       if current_node.left_child
    #         current_node = current_node.left_child
    #         depth += 1
    #       else
    #         current_node.set_left(node)
    #         break
    #       end
    #     else
    #       break
    #     end
    #   end
    # end
    # return depth
  end

  def include?(score)
    #invoke traverse on score -> store in t_node
    #return true if t_node.score = score
    #otherwise return false

    node = traverse(score)
    if node.nil? || node.score != score
      false
    elsif node.score == score
      true
    end

    # current_node = @root
    #
    # loop do
    #   if current_node.score == score
    #     return true
    #   else
    #     if score < current_node.score
    #       if current_node.left_child
    #         current_node = current_node.left_child
    #       else
    #         return false
    #       end
    #     elsif score > current_node.score
    #       if current_node.right_child
    #         current_node = current_node.right_child
    #       else
    #         return false
    #       end
    #     end
    #   end
    # end
  end

  def depth_of(score)

  end

end
