require 'rails_helper'

RSpec.describe Station, :type => :model do
	context 'when fully populated' do 
		it 'creates a valid station object' do
			subject = create(:station)
			expect(subject.valid?).to be true
			expect(subject.errors).to be_empty
		end
	end
	context 'when partially populated' do
		before(:each) do
			subject = build(:station)	
		end

		it 'returns an error' do
			expect(subject.valid?).to be false
			expect(subject.errors).to_not be_empty
			expect(subject.errors[:name]).to_not be_nil
		end

		it 'fails to save' do
			expect(subject.save).to be false
		end
	end
end

