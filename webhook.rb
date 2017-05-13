require 'json'
require 'faraday'
require 'dotenv'
Dotenv.load

class WebHook

  OWNER = "basilekoko"
  REPO = "ruby_koans"

  def initialize
    @pull_request = Faraday.get("https://api.github.com/repos/#{OWNER}/#{REPO}/pulls?access_token=#{ENV['ACCESS_TOKEN']}")
    @merge_close = Faraday.get("https://api.github.com/repos/#{OWNER}/#{REPO}/pulls?state=closed?access_token=#{ENV['ACCESS_TOKEN']}")
  end

end
