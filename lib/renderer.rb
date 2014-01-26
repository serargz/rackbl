require 'erb'

module Rackbl
  class Renderer

    def initialize(content)
      @content = content
    end

    def render
      layout_file = "templates/default/layout.html.erb"
      layout = ERB.new File.read(layout_file)

      output = layout.result(binding)
    end
  end
end