require 'webhook'

describe WebHook do
  describe '#initialize' do
    it 'should return a valid event data at initialization' do
      expect(subject.event.status).to eq 200
    end
  end
end
