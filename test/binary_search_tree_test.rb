require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'
require './lib/node'

class BinarySearchTreeTest < Minitest::Test
  def setup
    @tree = BinarySearchTree.new
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_it_exists
    assert_instance_of BinarySearchTree, @tree
  end

  def test_insert_returns_correct_depth
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 1, tree.insert(92, "Sharknado 3")
    assert_equal 2, tree.insert(50, "Hannibal Buress: Animal Furnace")

  end

  def test_root_is_node
    assert_instance_of Node, @tree.root
  end

  def test_node_has_title
    assert_equal "Bill & Ted's Excellent Adventure", @tree.root.info[:title]
  end

  def test_node_has_score
    assert_equal 61, @tree.root.info[:score]
  end

  def test_node_has_no_right_child
    assert_nil @tree.root.right_child.right_child
  end

  def test_node_has_no_left_child
    assert_nil @tree.root.right_child.left_child
  end

  def test_first_right_child
    assert_instance_of Node, @tree.root.right_child
    assert_equal "Sharknado 3", @tree.root.right_child.info[:title]
    assert_equal 92, @tree.root.right_child.info[:score]
  end

  def test_first_left_child
    assert_instance_of Node, @tree.root.left_child
    assert_equal "Johnny English", @tree.root.left_child.info[:title]
    assert_equal 16, @tree.root.left_child.info[:score]
  end

  def test_include
    assert_equal true, @tree.include?(16)
  end

  def test_does_not_include
    assert_equal false, @tree.include?(17)
  end

  def test_depth_of
    assert_equal 1, @tree.depth_of(92)
    assert_equal 2, @tree.depth_of(50)
  end


  # def test_max
  #   expected = #rewrite
  #   assert_equal expected, #rewrite
  # end

  #test min

end
