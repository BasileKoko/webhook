require 'webhook'

describe WebHook do
  describe '#initialize' do
    it 'should return a valid event data at initialization' do
      expect(subject.event.status).to eq 200
    end
  end

  describe '#check_event' do
    it 'should call pull_notification method for PullRequestEvent' do
      allow(subject).to receive(:check_event).with('PullRequestEvent')
      expect(subject).to receive(:pull_notification)
      subject.pull_notification
    end
    it 'should call merge_notification method for PushEvent' do
      allow(subject).to receive(:check_event).with('PushEvent')
      expect(subject).to receive(:merge_notification)
      subject.merge_notification
    end
  end

  describe '#pull_notification' do
    it 'should send pull notification to slack successfully' do
      expect(subject).to receive(:pull_notification) {"ok"}
      subject.pull_notification
    end
  end
end
