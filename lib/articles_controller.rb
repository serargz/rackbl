module Rackbl

  class ArticlesController
    def initialize(title = "", body = "")
      @title = title
      @body = body
    end

    def get_binding
      binding
    end
  end
  
end