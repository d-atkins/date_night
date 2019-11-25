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

  def test_empty_tree_has_nil_root
    tree = BinarySearchTree.new
    assert_nil tree.root
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

  def test_root_has_no_children
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_nil tree.root.right_child
    assert_nil tree.root.left_child
  end

  def test_child_has_no_children
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    assert_nil tree.root.left_child.right_child
    assert_nil tree.root.left_child.left_child
  end

  def test_children_of_root_are_nodes
    assert_instance_of Node, @tree.root.left_child
    assert_instance_of Node, @tree.root.right_child
  end

  def test_children_of_root
    expected = {title: "Johnny English", score: 16}
    assert_equal expected, @tree.root.left_child.info

    expected = {title: "Sharknado 3", score: 92}
    assert_equal expected, @tree.root.right_child.info
  end

  def test_include
    assert_equal true, @tree.include?(16)
    assert_equal false, @tree.include?(17)
  end

  def test_depth_of
    assert_equal 1, @tree.depth_of(92)
    assert_equal 2, @tree.depth_of(50)
  end


  def test_max
    expected = {"Sharknado 3" => 92}
    assert_equal expected, @tree.max
  end

  def test_min
    expected = {"Johnny English"=>16}
    assert_equal expected, @tree.min
  end

  def test_sort
    expected = [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]

    assert_equal expected, @tree.sort
  end

end
