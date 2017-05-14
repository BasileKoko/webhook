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

  def slack_message(webhook_url, channel, username, text)
    payload = {
      :channel  => channel,
      :username => username,
      :text     => text
    }.to_json
    cmd = "curl -X POST --data-urlencode 'payload=#{payload}' #{webhook_url}"
    system(cmd)
  end

end
