require 'minitest/autorun'
require 'minitest/pride'
require './lib/tree'
require './lib/node'
require 'pry'

class TreeTest < Minitest::Test

  def setup

    @tree = BinarySearchTree.new(61, "Bill & Ted's Excellent Adventure")
  end

  def test_it_exists
    assert_instance_of BinarySearchTree, @tree
  end

  def test_it_can_insert
    expected_1 = @tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal expected_1, 0

    expected_2 = @tree.insert(16, "Johnny English")
    assert_equal expected_2, 1

    expected_3 = @tree.insert(92, "Sharknado 3")
    assert_equal expected_3, 1

    expected_4 = @tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal expected_4, 2
  end

  def test_it_can_return_true_if_score_included
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert @tree.include?(61)
    assert @tree.include?(16)
    assert @tree.include?(92)
    assert @tree.include?(50)
    refute @tree.include?(72)
    refute @tree.include?(0)

  end
end
