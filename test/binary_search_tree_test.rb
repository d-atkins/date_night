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

    @tree2 = BinarySearchTree.new
    @tree2.insert(98, "Animals United")
    @tree2.insert(58, "Armageddon")
    @tree2.insert(36, "Bill & Ted's Bogus Journey")
    @tree2.insert(93, "Bill & Ted's Excellent Adventure")
    @tree2.insert(86, "Charlie's Angels")
    @tree2.insert(38, "Charlie's Country")
    @tree2.insert(69, "Collateral Damage")
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

  def test_load
    tree = BinarySearchTree.new
    tree.load

    assert tree
    assert tree.root
  end

  def test_health
    assert_equal [[98, 7, 100]], @tree2.health(0)
    assert_equal [[58, 6, 85]], @tree2.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], @tree2.health(2)
  end

  def test_leaves
    assert_equal 2, @tree.leaves
    assert_equal 2, @tree2.leaves
  end

  def test_height
    assert_equal 2, @tree.height
    assert_equal 4, @tree2.height
  end

end
