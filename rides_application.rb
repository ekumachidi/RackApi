require 'json'

class RidesApplication
  def call(env)
    request = Rack::Request.new(env)
    
    response = Rack::Response.new
    response.headers["Content-Type"] = "application/json"
    
    if env["PATH_INFO"] == ""
      if request.post?
        ride = JSON.parse(request.body.read)
        Database.add_ride(ride)
        response.status = 200
        response.write("Rides saved successfully")
      else
        response.write(JSON.generate(Database.rides))
      end
    elsif env["PATH_INFO"] =~ %r{/\d+}
      id = env["PATH_INFO"].split("/").last.to_i
      response.write(JSON.generate(Database.rides[id]))
    else
      response.status = 404
      response.write("Oops....There's Nothing here")
    end  

    response.finish  
  end
end
