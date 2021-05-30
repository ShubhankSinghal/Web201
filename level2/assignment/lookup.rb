def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

# FILL YOUR CODE HERE

# Function to parse zone file data
def parse_dns(data)

  # This hash will store the final data
  parse_data = {}

  # Iterating through each element (or line) of the array (or zone file)
  data.each do |x|

    # Checking for non-empty or non-commented lines
    if x.strip != "" && x[0] != "#"

      # Extracting all the three information from the single line
      temp = x.strip.split(", ")

      # If :A or :CNAME key are not present, add them with a new hash as value
      if parse_data[temp[0].to_s] == nil
        parse_data[temp[0].to_s] = {}
      end

      # Adding data into the parse_data hash
      parse_data[temp[0].to_s][temp[1].to_s] = temp[2].to_s
    end
  end

  # returning parse_data
  return parse_data
end

# Function to find the path
def resolve(records, chain, domain)

  # Fetched the keys, :A and :CNAME
  key = records.keys

  # First check if IP is present, it will act as break condition
  if records[key[0]][domain.to_s] != nil
    return chain << records[key[0]][domain.to_s]

    # Then check if its present in :CNAME, if not, its not available
  elsif records[key[1]][domain.to_s] == nil
    return ["Error: record not found for #{domain}"]

    # Otherwise, call the function again with values updated
  else
    return resolve(records, chain << records[key[1]][domain.to_s], records[key[1]][domain.to_s])
  end
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
