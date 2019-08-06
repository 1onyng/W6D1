class KnightPathFinder
  def initialize(pos)
    @move_tree = build_move_tree(pos)
    # kpf = KnightPathFinder.new(pos)
    
  end

  def build_move_tree
    @root_node = PolyTreeNode.new(startPos)
  end

  def self.valid_moves(pos)
    @considered_positions = [startPos]
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves
    @considered_positions << pos if !@considered_positions.include?(pos)
  end
end