require './lib/node'

class BinarySearchTree
  attr_reader :root
  def initialize
  end

  def take_step(current_node, score)

    if score > current_node.info[:score]
      return current_node.right_child
    elsif score < current_node.info[:score]
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
          if !title.nil?
            parent_node.set_child(node)
            depth += 1
          end
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
      return true if current_node.info[:score] == score
      current_node = take_step(current_node, score)
    end

    return false

  end

  def depth_of(score)
    return insert(score)
  end

  def max

    current_node = @root
    return current_node if @root.nil?

    while (!current_node.right_child.nil?)
      current_node = current_node.right_child
    end

    title = current_node.info[:title]
    score = current_node.info[:score]
    return {title => score}

  end

  def min

    current_node = @root
    return current_node if @root.nil?

    while (!current_node.left_child.nil?)
      current_node = current_node.left_child
    end

    title = current_node.info[:title]
    score = current_node.info[:score]
    return {title => score}

  end

  def sort(current_node = root)
    sorted_list = []
    title = current_node.info[:title]
    score = current_node.info[:score]
    element = {title => score}

    if !(current_node.left_child || current_node.right_child)
      return element
    end

    if current_node.left_child
      sorted_list << sort(current_node.left_child)

    end

    if current_node.right_child
      sorted_list << element
      sorted_list << sort(current_node.right_child)
    end

    return sorted_list.flatten
  end

end
