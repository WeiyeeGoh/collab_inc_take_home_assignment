require_relative "../find_discrepancy.rb"

RSpec.describe "Test Output Value is Correct" do

  it 'Call find_discrepancy with no discrepancy' do
    f1 = "csv_files/test1_f1.csv"
    f2 = "csv_files/test1_f2.csv"

    expect(find_discrepancy(f1,f2)).to be == []
  end

  it 'Call find_discrepancy with a discrepancy in Channel Name' do
    f1 = "csv_files/test2_f1.csv"
    f2 = "csv_files/test2_f2.csv"

    expect(find_discrepancy(f1,f2)).to be == ["test_1@gmail.com"]
  end

  it 'Call find_discrepancy with discrepancy in Subscriber Count' do
    f1 = "csv_files/test3_f1.csv"
    f2 = "csv_files/test3_f2.csv"

    expect(find_discrepancy(f1,f2)).to be == ["test_3@gmail.com"]
  end

end
