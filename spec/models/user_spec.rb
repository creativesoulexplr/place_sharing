require 'rails_helper'
require 'spec_helper'



RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:display_name)}
  it { is_expected.to validate_length_of(:password)}
end

RSpec.describe User, type: :model do
	it "has valid fields" do
		 user = User.create(email: "abc@test.com", display_name: "Display Name", password: "dsdsadsadad")
		expect(user).to be_valid
	end
end
