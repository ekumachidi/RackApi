class ValidateContentType
  def initialize(app, _opts = {})
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    return unless headers['Content-Type'] == 'application/json'

    begin
      content = ''
      body.each { |piece| content += piece }
      JSON.parse(content)
      [status, headers, body]
    rescue JSON::ParserError
      new_body = JSON.generate(error: content)
      response = Rack::Response.new([new_body], status, headers)
      response.finish
    end
  end
end
