# frozen_string_literal: true

RSpec.describe ISBN13 do
  it 'has a version number' do
    expect(ISBN13::VERSION).not_to be nil
  end

  it 'calculate check digit' do
    expect(ISBN13.calculate('978014300723')).to eq(4)
    expect(ISBN13.calculate('978005066631')).to eq(9)
    expect(ISBN13.calculate('978019579915')).to eq(6)
    expect(ISBN13.calculate('978032003778')).to eq(8)
  end

  it 'returns code with check digit' do
    expect(ISBN13.complete('978014300723')).to eq('9780143007234')
    expect(ISBN13.complete('978005066631')).to eq('9780050666319')
    expect(ISBN13.complete('978019579915')).to eq('9780195799156')
    expect(ISBN13.complete('978032003778')).to eq('9780320037788')
  end
  
  it 'raise an error if code is invalid' do
    message = "ISBN13 code must be 12 digits long"
    expect { ISBN13.calculate('9780143323222') }.to raise_error(message)
    expect { ISBN13.calculate('978005066') }.to raise_error(message)
    expect { ISBN13.complete('978019') }.to raise_error(message)
    expect { ISBN13.complete('978032123123123') }.to raise_error(message)
  end

end
