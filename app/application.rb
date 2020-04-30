class Application

  #@@items = ["Apples","Carrots","Pears"]

  def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items/)
        Item.each do |item|
          if item == env
          resp.write "#{item}\n"
          end
        end
      else
        resp.status = 404
        resp.write = "Path Not Found"
      end
      resp.finish
  end

end
