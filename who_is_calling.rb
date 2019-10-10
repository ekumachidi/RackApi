class WhoIsCalling
  def initialize(app, _opts = {})
    @app = app
  end

  def call(env)
    env['rack.logger'].info caller.join('\n')
    @app.call(env)
  end
end
