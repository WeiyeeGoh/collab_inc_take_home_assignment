require "csv"


def compare_channel_name(name1, name2)

  # Every channel name has a unique id at of 22 at the end
  unique_id_length = 22

  # Get last 22 chars of channel 1's name
  if (name1.length() >= unique_id_length)
    name1_trail = name1[(name1.length()-unique_id_length)..-1]
  else
    raise Exception.new "Channel Name is not Valid"
  end

  # Get last 22 chars of channel 2's name
  if (name2.length() >= unique_id_length)
    name2_trail = name2[(name2.length()-unique_id_length)..-1]
  else
    raise Exception.new "Channel Name is not Valid"
  end

  return name1_trail == name2_trail
end

def compare_subscriber_count(count1, count2) 
  count1_int = count1.delete(',').to_i
  count2_int = count2.delete(',').to_i

  return count1_int == count2_int
end


def find_discrepancy(file1, file2, concern = nil)
  

  # Check arg1 is an existing file
  if (File.exist?(file1))
    f1 = CSV.read(file1)
  else
    raise Exception.new "File does not exist"
  end

  # Check arg2 is an existing file
  if (File.exist?(file2))
    f2 = CSV.read(file2)
  else
    raise Exception.new "File does not exist"
  end

  if (file1 == file2) 
    raise Exception.new "File names are not distinct"
  end

  # Check arg3 is subscriber_count or channel_ownership
  handle_subscriber_count = true
  handle_channel_ownership = true
  if (concern != nil)
    if (concern == "subscriber_count")
      handle_channel_ownership = false
    elsif (concern == "channel_ownership")
      handle_subscriber_count = false
    else
      raise Exception.new "Concern parameter must be subscriber_count or channel_ownership"
    end
  end

  discrepancy = Array.new
  for i in 1..(f1.length()-1)
    
    account1 = f1[i]
    account2 = f2[i]

    # Check Channel Name is the same (add if isn't)
    if (handle_channel_ownership and not compare_channel_name(account1[1], account2[1])) 
      discrepancy.push(account1[0])
      next
    end

    # Check Subscriber Count is the same (add if isn't)
    if (handle_subscriber_count and not compare_subscriber_count(account1[2], account2[2])) 
      discrepancy.push(account1[0])
      next
    end
  end

  return discrepancy
end

