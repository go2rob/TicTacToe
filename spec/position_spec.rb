RSpec.describe Position do
  it 'should provide x and y coordinate' do
    p = Position.new(2, 3)
    expect(p.x).to eq(2)
    expect(p.y).to eq(3)
  end
end