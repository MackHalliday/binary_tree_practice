
class BinarySearchTree
  attr_reader :head_node
  def initialize(score, title)
    @head_node = nil
  end

  def insert(score, title)
    new_node = Node.new(score, title)
    if @head_node.nil?
      @head_node = new_node
      0
    else
      placement(@head_node, new_node, 1)
    end
  end

  def placement(parent_node, new_node, depth)
    if new_node.score > parent_node.score
      if parent_node.right.nil?
        parent_node.right = new_node
        depth
      else
        depth += 1
        placement(parent_node.right, new_node, depth)
      end
    else
      if parent_node.left.nil?
        parent_node.left = new_node
        depth
      else
        depth += 1
        placement(parent_node.left, new_node, depth)
      end
    end
  end

  def include?(score)
    if @head_node.score == score
      true
    else
      search_tree(@head_node, score)
    end
  end

  def search_tree(node, score)
  
    if score > node.score

      if !node.right.nil && node.left.score == score
        true
      elsif
        search_tree(node.left, score)
      else
        false
      end
    else
      if !node.right.nil? && node.right.score == score
        true
      elsif
        search_tree(node.right, score)
      else
        false
      end
    end
  end
end
