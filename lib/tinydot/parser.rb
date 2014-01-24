module Tinydot
  class Parser
    def self.parse(content)
      parser = Parser.new
      graph = parser.instance_eval(content)
      graph.to_dot
    end

    def digraph(title, attrs = {}, &block)
      digraph = Digraph.new(title, attrs)
      digraph.instance_eval(&block)
      digraph
    end
  end
end
