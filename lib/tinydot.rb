require "tinydot/command"
require "tinydot/parser"
require "tinydot/digraph"
require "tinydot/node"
require "tinydot/edge"

require "pathname"

module Tinydot
  def self.root_path
    Pathname.new("..").expand_path(File.dirname(__FILE__))
  end
end
