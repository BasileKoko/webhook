require 'json'
require 'faraday'
require 'dotenv'
Dotenv.load

class WebHook



  def initialize
    @owner = "basilekoko"
    @repo = "ruby_koans"
    @event = Faraday.get("https://api.github.com/repos/#{@owner}/#{@repo}/events?access_token=#{ENV['ACCESS_TOKEN']}")
  end

end
