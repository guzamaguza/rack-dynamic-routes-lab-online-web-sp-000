class Application

  @@items = []

  def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items\/.+/)
        requested_item = req.path.split("/items/").last
        detected_item = @@items.detect{|item| item.name = requested_item}
        if detected_item
          resp.write item.price
        else
          resp.status = 400
          resp.write = "Item Not Found"
        end
      else
        resp.status = 404
        resp.write = "Path Not Found"
      end
      resp.finish
  end

end
