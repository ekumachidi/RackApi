require 'json'

class UsersApplication
  include ApplicationHelpers

  def call(env)
    request = Rack::Request.new(env)

    response = Rack::Response.new
    response.headers["Content-Type"] = "application/json"
    
    
    case request.path_info 
    when request.post? && ""
      post_a_user(request, response)
    when request.get? && ""
      get_all_users(request, response)
    when %r{/\d+}
      get_a_user(request, response)
    else
      missing(request, response)
    end   

    response.finish
  end

  def get_all_users(request, response)
    respond_with_object(response, Database.users)
  end

  def get_a_user(request, response)
    id = request.path_info.split("/").last.to_i
    user = Database.users[id]
    if user.nil?
      missing(request, response)
    else
      respond_with_object(response, Database.users[id])
    end      
  end
end
