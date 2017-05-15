### Github-Slack Webhook

This repository contains solution to build a customized webhook to link
Github and Slack in order to handle pull request and merge actions.

### Task
```
Recently we have been having trouble with developers not notifying the
rest of the team of Pull Requests that are ready for review. When
developers submit a Pull Request the best time to review it is when it
is fresh in the developer's mind. So we want to be able to facilitate
this happening.

We use GitHub as our primary development platform. We allow remote
working and have an office in New York so we use Slack as our primary
day to day communication. We would like to bring together these two
pieces of technology to solve our Pull Request problem.

We know,  there is already a solution out there for Slack
webhooks. But, we would like you to ignore this exists and address the
solution as you feel fit.
```
### Approach

```
A server-side hook script called post-receive has been created.
This hook will be added to the server where the repository is hosted.
It would run when PullRequestEvent or PushEvent(merge) occurs on the defined repository.

To ensure that notification can be sent,
when the repository has a pull request and when a pull request is merged,
I create two separate files called webhook.rb and webhook_spec.rb to test it.
```
### To do
```
1. Add script to server hosting the repository
2. Improve merge condition for calling method merge_notification.
At the  moment when pull request is merged the event appears as PushEvent. I would like to differentiate the merge PushEvent from a standard PushEvent.
```
### Setup
```
This setup is for webhook.rb and webhook_spec.rb

$ git clone https://github.com/BasileKoko/webhook.git
$ cd webhook
$ bundle install
$ touch .env
edit .env and add your github token.
Example: export ACCESS_TOKEN=xxx
```
[Create Github Token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)

### To run program

```
$ ruby lib/webhook.rb
```

### To run test
```
rspec
```
### Screenshot
![slack notification screenshot](https://github.com/BasileKoko/webhook/blob/master/webhook.png)

### Gems
```ruby
gem 'dotenv'
gem 'faraday'
gem 'rspec'
```
