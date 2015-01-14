describe ArrivalsHelper do
	before(:each) do
		@object = double('Object')
  		@object.extend(ArrivalsHelper)
  		xml = '<?xml version="1.0" encoding="utf-8" ?> 
<root>
  <uri><![CDATA[ http://api.bart.gov/api/etd.aspx?cmd=etd&orig=RICH ]]></uri>
  <date>03/30/2011</date> 
  <time>02:43:27 PM PDT</time> 
  <station>
    <name>Richmond</name> 
    <abbr>RICH</abbr> 
    <etd>
      <destination>Fremont</destination> 
      <abbreviation>FRMT</abbreviation> 
      <estimate>
        <minutes>5</minutes> 
        <platform>2</platform> 
        <direction>South</direction> 
        <length>6</length> 
        <color>ORANGE</color> 
        <hexcolor>#ff9933</hexcolor> 
        <bikeflag>1</bikeflag> 
      </estimate>
      <estimate>
        <minutes>20</minutes> 
        <platform>2</platform> 
        <direction>South</direction> 
        <length>6</length> 
        <color>ORANGE</color> 
        <hexcolor>#ff9933</hexcolor> 
        <bikeflag>1</bikeflag> 
      </estimate>
    </etd>
    <etd>
      <destination>Millbrae</destination> 
      <abbreviation>MLBR</abbreviation> 
      <estimate>
        <minutes>Leaving</minutes> 
        <platform>2</platform> 
        <direction>South</direction> 
        <length>10</length> 
        <color>RED</color> 
        <hexcolor>#ff0000</hexcolor> 
        <bikeflag>1</bikeflag> 
      </estimate>
    </etd>
  </station>
  <message /> 
</root>'
			@parsed = Crack::XML.parse(xml)
	end


	context 'process_arrivals' do
		before(:each) do
			@arrivals = @object.process_arrivals(@parsed['root'])
		end

		it 'returns a list of 3 arrival objects' do
			expect(@arrivals.count).to be(3)
			expect(@arrivals[0]).to be_an(Arrival)
		end

		it 'sorts arrivals list by soonest arrival in minutes' do
			expect(@arrivals[0].minutes).to be < @arrivals[1].minutes 
		end

		it 'replaces destination reference with valid station object' do
			destination = @arrivals[0].destination
			expect(destination).to be_a(Station)
			expect(destination.valid?).to be true
		end
	end
end