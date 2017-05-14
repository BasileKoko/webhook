### Github-Slack Webhook

This repository contains solution to build a customized webhook to link
Github and Slack in order to handle pull request and merge actions.

Task:
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
This hook should be added to the server where the repository is hosted.
It should run when change occurs on the defined repository.
I am still looking into how to implement this step.

To ensure that the script works as I expect,
I create a separate file called webhook.rb and a test file webhook_spec.rb to test it.
```

### Setup
```
This setup is for webhook.rb and webhook_spec.rb

$ git clone https://github.com/BasileKoko/webhook.git
$ cd webhook
$ bundle install
$ touch .env
edit .env and add your github token.
Example: export TOKEN=xxx
```
[Create Github Token]("https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/")

### To run program

```
$ ruby lib/webhook.rb
```

### To run test
```
rspec
```
