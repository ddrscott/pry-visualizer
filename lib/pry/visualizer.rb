require 'rack'
require 'puma'
require 'tubesock'
require 'rack/handler/puma'

require 'pry/visualizer/version'

require 'pp'
require 'json'

class Pry
  # Manages a websocket server
  class Visualizer
    def initialize

      @commands = []

      Pry.hooks.add_hook(:when_started, :viz_init) do |output, _binding, _pry|
        start_server
      end

      Pry.hooks.add_hook(:before_eval, :viz_before) do |code, _pry|
        @commands << { id: @commands.size, code: code, start: Time.now }
      end

      Pry.hooks.add_hook(:after_eval, :viz_after) do |result, _pry|
        @commands[-1].merge!(
          end:    Time.now,
          result: result
        )
        # send data to websocket
        @sock && begin
          @sock.send_data(JSON.generate({command: @commands[-1]}))
        end
      end
    end

    def start_server
      Thread.new { Rack::Handler::Puma.run(self, Port: ENV['PORT'] || 3000) }
    end

    # Rack App
    def call(env)
      @sock = Tubesock.hijack(env)
      @sock.onclose do
        ActiveRecord::Base.clear_active_connections! if defined? ActiveRecord
      end
      @sock.listen
      [-1, {}, []]
    end
  end
end
Pry::Visualizer.new
