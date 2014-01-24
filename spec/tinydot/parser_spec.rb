require "spec_helper"

describe Tinydot::Parser do
  let(:fixtures_path) { Pathname.new("spec/fixtures") }

  it "parses a series of unidirectional edges" do
    tinydot = fixtures_path.join("unidirectional_edges.tinydot").read
    dot = Tinydot::Parser.parse(tinydot)
    expect(dot).to eq fixtures_path.join("unidirectional_edges.dot").read
  end

  it "parses a bidirectional edge" do
    tinydot = fixtures_path.join("bidirectional_edge.tinydot").read
    dot = Tinydot::Parser.parse(tinydot)
    expect(dot).to eq fixtures_path.join("bidirectional_edge.dot").read
  end

  it "parses attributes of digraph" do
    tinydot = fixtures_path.join("digraph_attributes.tinydot").read
    dot = Tinydot::Parser.parse(tinydot)
    expect(dot).to eq fixtures_path.join("digraph_attributes.dot").read
  end

  it "parses attributes of all nodes" do
    tinydot = fixtures_path.join("all_nodes_attributes.tinydot").read
    dot = Tinydot::Parser.parse(tinydot)
    expect(dot).to eq fixtures_path.join("all_nodes_attributes.dot").read
  end

  it "parses attributes of each node" do
    tinydot = fixtures_path.join("node_attributes.tinydot").read
    dot = Tinydot::Parser.parse(tinydot)
    expect(dot).to eq fixtures_path.join("node_attributes.dot").read
  end
end
