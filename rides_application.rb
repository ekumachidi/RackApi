class RidesApplication
  def call(env)
    if env["PATH_INFO"] == ""
      [200, {}, [Database.users.to_s]]
    elsif env["PATH_INFO"] =~ %r{/\d+}
      id = env["PATH_INFO"].split("/").last.to_i
      [200, {}, [Database.users[id].to_s]]
    else
      [404, {}, ["Oops....There's Nothing here"]]
    end    
  end
end
