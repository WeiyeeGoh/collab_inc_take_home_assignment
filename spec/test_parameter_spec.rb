require_relative "../find_discrepancy.rb"

RSpec.describe "Test Parameter Count" do

  it 'Call find_discrepancy with 0 parameters' do
    expect{find_discrepancy}.to raise_error(ArgumentError)
  end

  it 'Call find_discrepancy with 1 parameters' do
    expect{find_discrepancy("test1_f1.csv")}.to raise_error(ArgumentError)
  end

end


RSpec.describe "Test Parameter Type" do 

  it 'Call with one incorrect file input as arg1'  do
    expect{find_discrepancy('1', 'csv_files/test1_f1.csv')}.to raise_error("File does not exist")
  end

  it 'Call with one incorrect file input as arg2'  do
    expect{find_discrepancy('csv_files/test1_f1.csv', '1')}.to raise_error("File does not exist")
  end

  it 'Call with existing files for arg1 and arg2'  do
    expect(find_discrepancy("csv_files/test1_f1.csv", "csv_files/test2_f1.csv")).to be_kind_of(Array)
  end

  it 'Call with different same file names' do 
    expect{find_discrepancy('csv_files/test1_f1.csv', 'csv_files/test1_f1.csv')}.to raise_error("File names are not distinct")
  end

  it 'Call with arg3 as incorrect value' do
    expect{find_discrepancy("csv_files/test1_f1.csv", "csv_files/test2_f1.csv", "incorrect_value")}.to raise_error("Concern parameter must be subscriber_count or channel_ownership")
  end

  it 'Call with arg3 as subscriber_count' do
    expect(find_discrepancy("csv_files/test1_f1.csv", "csv_files/test2_f1.csv", "subscriber_count")).to be_kind_of(Array)
  end

  it 'Call with arg3 as subscriber_count' do
    expect(find_discrepancy("csv_files/test1_f1.csv", "csv_files/test2_f1.csv", "channel_ownership")).to be_kind_of(Array)
  end
  
end