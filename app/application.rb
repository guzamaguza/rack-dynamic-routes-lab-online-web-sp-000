class Application

  #@@items = ["Apples","Carrots","Pears"]

  def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items/)
        Item.each do |item|
          if item == env
          resp.write "#{item}\n"
          else
            resp.status = 404
            resp.write = "Path Not Found"
          end
        end
      resp.finish
  end

end
