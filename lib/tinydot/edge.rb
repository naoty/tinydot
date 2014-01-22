module Tinydot
  class Edge
    def initialize(from, to, attrs = {})
      @from = from
      @to = to
      @attrs = attrs
    end

    def to_dot
      dot = "#{@from.name} -> #{@to.name}"
      dot += " [dir = both]" if @attrs[:dir] == "both"
      dot += ";"
    end
  end
end
