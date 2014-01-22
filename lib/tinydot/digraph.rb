require "erb"

module Tinydot
  class Digraph
    def initialize(name)
      @name = name
      @nodes = []
    end

    def to_dot
      template_path = Tinydot.root_path.join("lib/tinydot/template.dot.erb")
      template = ERB.new(template_path.read, nil, "-")
      template.result(binding)
    end

    def method_missing(name, *args)
      node = @nodes.select { |node| node.name == name }.first
      if node.nil?
        node = Node.new(name)
        @nodes << node
      end
      node
    end
  end
end
