require_relative '00_tree_node.rb'
require 'byebug'

class KnightPathFinder
  attr_reader :move_tree, :considered_positions, :root_node

  def initialize(startPos)
    @root_node = PolyTreeNode.new(startPos)
    @considered_positions = [startPos]
    @move_tree = build_move_tree
  end

  def build_move_tree
    queue = [@root_node]

    while !queue.empty?
      dequeue = queue.shift
      
      new_move_positions(dequeue.value).each do |child|
        child_node = PolyTreeNode.new(child)
        dequeue.add_child(child_node)
        queue << child_node
      end
    end
  end

  def self.valid_moves(pos)
    possible_moves = [[2,1], [1,2], [2, -1], [-1, 2], [-1, -2], [-2, -1], [1, -2], [-2, 1]]
    possible_end_positions = possible_moves.map { |move| [(pos.first + move.first), (pos.last + move.last)] }
    possible_end_positions.select { |move| move.first.between?(0, 7) && move.last.between?(0, 7) }
  end

  def new_move_positions(pos)
    next_possible_moves = KnightPathFinder.valid_moves(pos)
    next_moves = next_possible_moves.select { |move| !@considered_positions.include?(move) }
    @considered_positions += next_moves
    next_moves
  end

  def find_path(end_pos)
    end_node = @root_node.bfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    path = [end_node]

    while !path.first.parent.nil?
      path.unshift(path.first.parent)
    end

    path
  end

  def inspect
    { 'value' => @value, 'parent_value' => @parent.value }.inspect
  end
end

# move_tree = [0, 0] ==> [7, 7]
# find_path([3, 4]), will search move tree until it finds that position. it will trace all the back 0,0 using the parents method. looping until node.parent == nil