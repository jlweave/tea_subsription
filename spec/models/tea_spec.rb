require 'rails_helper'

RSpec.describe Tea, type: :model do
  context 'relationship' do
    it { should have_many(:subscriptions) }
    it { should have_many(:customers).through(:subscription) }
  end
end
