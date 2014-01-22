module Tinydot
  class Parser
    def self.parse(content)
      parser = Parser.new
      graph = parser.instance_eval(content)
      graph.to_dot
    end

    def digraph(title, &block)
      digraph = Digraph.new(title)
      digraph.instance_eval(&block)
      digraph
    end
  end
end
