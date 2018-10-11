require 'pry'

class Application
@@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/) #if is is a good path:
      #binding.pry
      user_item = req.path.split("/items/").last #set item to figs
      if user_item = @@items.find{|i| i == user_item}
        resp.write  "#{user_item.name}, #{user_item.price}"
        res.status = 200
#      if @@items.include?(item)

        #@@items.collect {|i| resp.write "#{i.price}"}
        
      else #if not in the array, give error message
        resp.write "Item not found"
        resp.status = 400
      end
    else #else, the route is bad and return 404
      resp.write "Route not found" #else it is not a
      resp.status = 404
    end
    resp.finish
  end


  #def item_info(item)
    #if @@items.include?(item)
      #item_price = req.path.split("/items/").last
      #item = @@items.find {|i| i.price == item.price}
      #resp.write item.price
      #res.status = 200
    #elsif #if not in the array, give error message
      #resp.write "Item not found"
      #resp.status = 400
    #end
      #resp.finish
  #end

end
