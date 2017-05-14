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

  def pull_notification
    pull_request_url = JSON.parse(@event.body).first['payload']['pull_request']['html_url']
    notify_slack("#{ENV['SLACK_URL']}", '#general', 'pull_request_hook', "A pull request has been made, please access it here:  #{pull_request_url}")
  end

  def merge_notification
    notify_slack("#{ENV['SLACK_URL']}", '#general', 'pull_request_hook', "A pull request has been merged on repository #{@repo}")
  end

end
