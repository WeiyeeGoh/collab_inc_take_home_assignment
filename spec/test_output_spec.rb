require_relative "../find_discrepancy.rb"

RSpec.describe "Test Simple Output Value is Correct" do

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

  it 'Call find_discrepancy with same Subscriber Count but formatted differently' do
    f1 = "csv_files/test4_f1.csv"
    f2 = "csv_files/test4_f2.csv"

    expect(find_discrepancy(f1,f2)).to be == []
  end 

end

RSpec.describe "Test Simple Output Value is Correct over Multiple Entries" do

  it 'Call find_discrepancy with no discrepancy' do
    f1 = "csv_files/test5_f1.csv"
    f2 = "csv_files/test5_f2.csv"

    expect(find_discrepancy(f1,f2)).to be == []
  end

  it 'Call find_discrepancy with no discrepancy' do
    f1 = "csv_files/test6_f1.csv"
    f2 = "csv_files/test6_f2.csv"

    expect(find_discrepancy(f1,f2)).to be == ["test_1@gmail.com", "test_3@gmail.com", "test_5@gmail.com", "test_8@gmail.com", "test_10@gmail.com"]
  end

end



RSpec.describe "Test Output Value is Correct Given Concern Argument" do

  it 'Call find_discrepancy with subscriber_count' do
    f1 = "csv_files/test7_f1.csv"
    f2 = "csv_files/test7_f2.csv"

    expect(find_discrepancy(f1,f2,"subscriber_count")).to be == ["test_1@gmail.com", "test_3@gmail.com", "test_5@gmail.com", "test_7@gmail.com", "test_9@gmail.com"]
  end

  it 'Call find_discrepancy with channel_ownership' do
    f1 = "csv_files/test7_f1.csv"
    f2 = "csv_files/test7_f2.csv"

    expect(find_discrepancy(f1,f2,"channel_ownership")).to be == ["test_1@gmail.com", "test_2@gmail.com", "test_5@gmail.com", "test_7@gmail.com", "test_9@gmail.com", "test_10@gmail.com"]
  end

  it 'Call find_discrepancy with no concern argument' do
    f1 = "csv_files/test7_f1.csv"
    f2 = "csv_files/test7_f2.csv"

    expect(find_discrepancy(f1,f2)).to be == ["test_1@gmail.com", "test_2@gmail.com", "test_3@gmail.com", "test_5@gmail.com", "test_7@gmail.com", "test_9@gmail.com", "test_10@gmail.com"]
  end

end
