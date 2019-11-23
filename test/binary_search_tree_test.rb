require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_it_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end

  def test_first_insert
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_instance_of Node, tree.root
  end

  def test_node_has_title
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal "Bill & Ted's Excellent Adventure", tree.root.title
  end

  def test_node_has_score
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal 61, tree.root.score
  end

  def test_node_has_no_right_child
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_nil tree.root.right_child
  end

  def test_node_has_no_left_child
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_nil tree.root.left_child
  end

  def test_first_right_child
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(92, "Sharknado 3")

    assert_instance_of Node, tree.root.right_child
  end

  def test_first_left_child
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(92, "Sharknado 3")
    tree.insert(16, "Johnny English")

    assert_instance_of Node, tree.root.left_child
  end

  #test include?
  def test_include
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(92, "Sharknado 3")
    tree.insert(16, "Johnny English")

    assert_equal true, tree.include?(16)
  end

  def test_does_not_include
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(92, "Sharknado 3")
    tree.insert(16, "Johnny English")
    assert_equal false, tree.include?(17)
  end
  #test depth_of
  #test max
  #test min

end
