module Rackbl
  class PagesController

    def method_missing(m, *args, &block)  
      if File.exists?("pages/#{m}.html.erb")
        render "pages/#{m}.html.erb"
      else
        false
      end
    end

    def render(file)
      template = ERB.new File.read(file)
      res = template.result(get_binding)
      res
    end

    def get_binding
      binding
    end

  end
end