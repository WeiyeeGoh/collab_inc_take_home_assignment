require "csv"

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

  


  result = []
  return result
end

