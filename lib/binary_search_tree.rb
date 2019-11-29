require './lib/node'

class BinarySearchTree
  attr_reader :root

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
          elsif parent_node.info[:score] != score
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

    while (!current_node.nil?)
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
      sorted_list << element if !current_node.right_child
    end

    if current_node.right_child
      sorted_list << element
      sorted_list << sort(current_node.right_child)
    end

    return sorted_list.flatten

  end

  def load

    file = File.open("movies.txt")
    file_data = file.readlines.map(&:chomp)
    file.close

    file_data.each do |line|
      split_line = line.split(%r{,\s*})
      insert(split_line[0].to_i, split_line[1])
    end

  end

  def nodes_at_depth(depth, current_node = @root)

    is_leaf = !(current_node.left_child || current_node.right_child)
    depth_reached = (depth_of(current_node.info[:score]) == depth)
    depth_nodes = []

    if depth_reached || is_leaf
      return [current_node] if depth_reached

    else

      if current_node.left_child
        depth_nodes << nodes_at_depth(depth, current_node.left_child)
      end

      if current_node.right_child
        depth_nodes << nodes_at_depth(depth, current_node.right_child)
      end

    end

    return depth_nodes.flatten

  end

  def health(depth)

    depth_nodes = nodes_at_depth(depth)
    tree_count = sort.count
    health_array = []

    depth_nodes.each do |node|
      a = node.info[:score]
      b = sort(node).count
      c = ((b.to_f / tree_count) * 100).floor
      health_array << [a, b, c]
    end

    return health_array

  end

  def leaf_nodes(current_node = @root)

    leaves = []

    if !(current_node.left_child || current_node.right_child)
      return current_node
    end

    if current_node.left_child
      leaves << leaf_nodes(current_node.left_child)
    end

    if current_node.right_child
      leaves << leaf_nodes(current_node.right_child)
    end

    return leaves.flatten

  end

  def leaves
    return leaf_nodes.count
  end

  def height
    height = 0
    leaf_nodes.each do |leaf|
      depth = depth_of(leaf.info[:score])
      height = depth if depth > height
    end
    return height
  end

end
