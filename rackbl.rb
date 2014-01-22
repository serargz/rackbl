class Rackbl
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Testing Rackbl response"]]
  end
end
