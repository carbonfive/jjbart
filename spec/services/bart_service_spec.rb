RSpec.describe BartService do
	context 'when making a call' do
		before(:each) do
			@service = BartService.new
			@query = {:cmd => 'etd'}
			@response = @service.passthrough('etd', query: @query)
		end

		pending 'attaches api key' do
			#expect(@query[:key]).to be_a(String)
		end

		pending 'contacts bart official api' do
			#expect(@service).to recieve(:get)
		end
	end
end