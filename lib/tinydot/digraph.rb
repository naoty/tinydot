require "erb"

module Tinydot
  class Digraph
    def initialize(name, attrs = {})
      @name = name
      @attrs = attrs
      @nodes = []
      @node_attrs = {}
    end

    def node(attrs = {})
      @node_attrs = attrs
    end

    def to_dot
      template_path = Tinydot.root_path.join("lib/tinydot/template.dot.erb")
      template = ERB.new(template_path.read, nil, "-")
      template.result(binding)
    end

    def method_missing(name, *args)
      node = @nodes.select { |node| node.name == name }.first
      if node.nil?
        attrs = {}
        args.each do |arg|
          case arg
          when String then attrs[:label] = arg
          when Hash   then attrs.merge!(arg)
          end
        end

        node = Node.new(name, attrs)
        @nodes << node
      end
      node
    end

    private

    def attrs_to_dot
      quoted_attrs = %i(size label bgcolor fillcolor fontname)
      @attrs.map do |k, v|
        quoted_attrs.include?(k) ? %(#{k} = "#{v}") : %(#{k} = #{v})
      end.join(", ")
    end

    def node_attrs_to_dot
      quoted_attrs = %i(color fillcolor fillcolor fontname)
      @node_attrs.map do |k, v|
        quoted_attrs.include?(k) ? %(#{k} = "#{v}") : %(#{k} = #{v})
      end.join(", ")
    end
  end
end
