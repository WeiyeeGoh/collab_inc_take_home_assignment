require_relative "../find_discrepancy.rb"

RSpec.describe "Test Parameter Count" do

  it 'Call find_discrepancy with 0 parameters' do
    expect{find_discrepancy}.to raise_error(ArgumentError)
  end

  it 'Call find_discrepancy with 1 parameters' do
    expect{find_discrepancy(1)}.to raise_error(ArgumentError)
  end
end
