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
end
