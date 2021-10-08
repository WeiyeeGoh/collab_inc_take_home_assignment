require_relative "../find_discrepancy.rb"

RSpec.describe "Test Parameter Count" do

  it 'Call find_discrepancy with 0 parameters' do
    expect{find_discrepancy}.to raise_error(ArgumentError)
  end

  it 'Call find_discrepancy with 1 parameters' do
    expect{find_discrepancy("testfile.csv")}.to raise_error(ArgumentError)
  end

end


RSpec.describe "Test Parameter Type" do 

  it 'Call with one incorrect file input as arg1'  do
    expect{find_discrepancy('1', 'testfile.csv', 3)}.to raise_error("File does not exist")
  end

  it 'Call with one incorrect file input as arg2'  do
    expect{find_discrepancy('testfile.csv', '1', 3)}.to raise_error("File does not exist")
  end

  it 'Call with existing files for arg1 and arg2'  do
    expect(find_discrepancy("testfile.csv", "testfile.csv", 3)).to be_kind_of(Array)
  end
  
end