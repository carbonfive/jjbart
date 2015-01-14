class Arrival 
attr_accessor :destination, 
				:minutes, 
				:length, 
				:direction,
				:platform

def initialize(estimateHash, destination)
		@minutes = estimateHash['minutes'].to_i
		@direction = estimateHash['direction']
	 	@length = estimateHash['length']
	 	@platform = estimateHash['platform']
	 	@destination = destination
end

end