require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is not valid without a username' do
    user = User.new(username: nil)
    expect(user).to_not be_valid
  end

  it { should validate_uniqueness_of(:username) }

  it 'should have friends' do
    user = User.reflect_on_association(:friendings)
    expect(user.friends).to eq(:has_many)
  end

end
