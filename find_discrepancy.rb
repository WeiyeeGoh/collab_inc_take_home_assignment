require "csv"


def compare_channel_name(names)

  unique_id_length = 22
  previous_name = nil

  for i in 0..(names.length()-1)
    # Get last 22 chars of channel 1's name
    current_name = names[i]
    if (current_name.length() >= unique_id_length)
      name_trail = current_name[(current_name.length()-unique_id_length)..-1]
      if (previous_name == nil)
        previous_name = name_trail
      else
        if (previous_name != name_trail)
          return false
        end
      end
    else
      raise Exception.new "Channel Name is not Valid"
    end
  end

  return true
end


# Loop through subscriber counts and check that it is the same as the previous value
def compare_subscriber_count(subscriber_counts) 

  previous_count = nil
  for i in 0..(subscriber_counts.length()-1)
    count = subscriber_counts[i].delete(',').to_i
    if (previous_count == nil)
      previous_count = count
    else
      if (previous_count != count)
        return false
      end
    end
  end
  return true
end


def find_discrepancy(files, concern = nil)
  

  if (files.length < 2)
    raise Exception.new "Need at least two files"
  end
  
  # Check file names are unique. Then checks file exists and reads content
  file_content = Array.new
  files.sort()
  prevfile = nil
  for i in 0..(files.length-1)
    if (prevfile != nil and prevfile == files[i]) 
      raise Exception.new "File names are not distinct"
    end

    if (File.exist?(files[i]))
      file_content.push(CSV.read(files[i]))
    else
      raise Exception.new "File does not exist"
    end

    prevfile = files[i]
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
  for i in 1..(file_content[0].length()-1)
    
    channel_name_array = Array.new
    subscriber_count_array = Array.new
    for j in 0..(file_content.length()-1)
      channel_name_array.push(file_content[j][i][1])
      subscriber_count_array.push(file_content[j][i][2])
    end

    # Check Channel Name is the same (add if isn't)
    if (handle_channel_ownership and not compare_channel_name(channel_name_array)) 
      discrepancy.push(file_content[0][i][0])
      next
    end

    # Check Subscriber Count is the same (add if isn't)
    if (handle_subscriber_count and not compare_subscriber_count(subscriber_count_array)) 
      discrepancy.push(file_content[0][i][0])
      next
    end

  end

  return discrepancy
end

