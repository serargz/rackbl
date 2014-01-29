require 'coderay'

module Rackbl
  module ArticlesHelper
    def code_highlight(text, lang=:ruby)
      CodeRay.scan(text, lang).div(:line_numbers => :table)
    end
  end
end