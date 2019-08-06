require 'byebug'

class PolyTreeNode
  attr_reader :value, :parent
  attr_accessor :children

  def initialize(val)
    @parent = nil
    @children = []
    @value = val
  end

  def parent=(node)
    self.parent.children.delete(self) if parent != nil 
    @parent = node
    node.children << self if parent != nil && !node.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent = self
  end

  #! self.remove_child(child_node) => nil && !self.children.include?(child_node)
  def remove_child(child_node)
    child_node.parent = nil
    if !children.include?(child_node)                  
      raise 'Error'                                                   
    end
  end

  def inspect
    @value.inspect
  end

  def dfs(target)                                   #! self.dfs("e") => ["b", "c"] => searres = "b".dfs("e") => ["d", "e"] => searresult = "d".dfs("e")
    return self if value == target                      
    searchResult = nil
    
    children.each do |child|
      searchResult = child.dfs(target)
      return searchResult unless searchResult.nil?
    end

    nil
  end

  def bfs(target)
    queue = [self]

    while !queue.empty?
        dequeue = queue.shift
        if dequeue.value == target
            return dequeue
        else
            queue += dequeue.children
        end
    end

    nil
  end
end