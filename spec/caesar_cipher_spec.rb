require './caesar_cipher'

describe '#caesar_cipher' do
  it 'works with words' do
    expect(caesar_cipher('dog', 1)).to eql('eph')
  end
  it 'works with capitalized letters' do
    expect(caesar_cipher('Dog', 1)).to eql('Eph')
  end
  it 'works with spaces in string' do
    expect(caesar_cipher('hey there', 1)).to eql('ifz uifsf')
  end
  it 'works with a negative shift' do
    expect(caesar_cipher('How are you?', -8)).to eql('Zgo sjw qgm?')
  end
  it 'wraps around alphabet after passing z' do
    expect(caesar_cipher('z', 1)).to eql('a')
  end
end
