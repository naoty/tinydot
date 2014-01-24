module Tinydot
  class Node
    attr_reader :name, :edges, :attrs

    def initialize(name, attrs)
      @name = name
      @edges = []
      @attrs = attrs || {}
    end

    def >>(other)
      @edges << Edge.new(self, other)
      other
    end

    def <=>(other)
      @edges << Edge.new(self, other, dir: "both")
      other
    end

    def to_dot
      quoted_attrs = %i(label color fillcolor fontname)
      @attrs.map do |k, v|
        quoted_attrs.include?(k) ? %(#{k} = "#{v}") : %(#{k} = #{v})
      end.join(", ")
    end
  end
end
