module Tinydot
  class Node
    attr_reader :name, :edges

    def initialize(name)
      @name = name
      @edges = []
    end

    def >>(other)
      @edges << Edge.new(self, other)
      other
    end

    def <=>(other)
      @edges << Edge.new(self, other, dir: "both")
      other
    end
  end
end
