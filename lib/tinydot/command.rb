require "thor"

module Tinydot
  class Command < Thor
    desc "convert <source>", "Convert tinydot file into graph image"
    def convert(source)
      source_path = Pathname.new(source)
      unless %w(.tinydot .tdot).include?(source_path.extname)
        abort "source must be *.tinydot or *.tdot"
      end

      target_name = source_path.to_s.gsub(/\.(tinydot|tdot)$/) { "" }
      target_dot_path = Pathname.new("#{target_name}.dot")
      target_image_path = Pathname.new("#{target_name}.png")
      File.open(source, "rb") do |file|
        tinydot = file.read
        dot = Parser.parse(tinydot)
        target_dot_path.open("wb") { |file| file.write(dot) }
        system %(dot -Tpng -o #{target_image_path.to_s} #{target_dot_path.to_s})
        target_dot_path.delete
      end
    end
  end
end
