# Tinydot

Tiny language alternative to DOT.

## Installation

```sh
$ gem install tinydot
```

[Graphviz](http://www.graphviz.org/) is required to convert files written by tinydot into images.

## Usage

```sh
$ tinydot convert sample.tinydot
```

`tinydot` command converts `*.tinydot` or `*.tdot` into `*.dot` and converts the converted files into graph images using Graphviz.

## Examples

### Nodes, Edges

```rb
digraph "sample" do
  a >> b >> c
  a <=> d
  b <=> d
end
```

is equivalent to

```dot
digraph sample {
  a -> b;
  b -> c;
  a -> d [dir = both];
  b -> d [dir = both];
}
```

and converted into a following graph.

![sample](examples/sample.png "sample")

### Attributes

```rb
digraph "sample2", rankdir: "LR" do
  node shape: "record", style: "filled", fontname: "Osaka", fillcolor: "#ECF0F1"

  a "Label 1"
  b "Label 2"
  c "Label 3", fillcolor: "#27AE60"
  d "Label 4", fillcolor: "#F1C40F"
  e "Label 5", fillcolor: "#E74C3C"

  a <=> b
  a <=> c
  b >> d
  d <=> e
  d >> a
end
```

is equivalent to

```dot
digraph sample2 {
  graph [rankdir = LR];
  node [shape = record, style = filled, fontname = "Osaka", fillcolor = "#ECF0F1"];

  a [label = "Label 1"];
  b [label = "Label 2"];
  c [label = "Label 3", fillcolor = "#27AE60"];
  d [label = "Label 4", fillcolor = "#F1C40F"];
  e [label = "Label 5", fillcolor = "#E74C3C"];

  a -> b [dir = both];
  a -> c [dir = both];
  b -> d;
  d -> e [dir = both];
  d -> a;
}
```

and converted into a following graph.

![sample2](examples/sample2.png "sample2")

