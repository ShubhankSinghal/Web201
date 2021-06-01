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
def parse_dns(raw)
  raw
    .reject { |line| line.strip == "" }
    .reject { |line| line[0] == "#" }
    .map { |line| line.strip.split(", ") }
    .each_with_object({}) do |record, records|

    # Modify the `records` hash so that it contains necessary details.
    # fetch the data
    type = record[0].to_s
    source = record[1].to_s
    target = record[2].to_s

    # Adding details in the records hash
    records[source] = {}
    records[source][:type] = type
    records[source][:target] = target

    # returning records
    records
  end
end

# Function to find the path
def resolve(dns_records, lookup_chain, domain)

  # Fetched the keys, :A and :CNAME
  record = dns_records[domain]

  # Lookup
  if (!record)
    lookup_chain = ["Error: Record not found for #{domain}"]
  elsif record[:type] == "CNAME"
    lookup_chain << record[:target]
    resolve(dns_records, lookup_chain, record[:target])
  elsif record[:type] == "A"
    lookup_chain << record[:target]
  else
    lookup_chain << "\nInvalid record type for #{domain}"
  end
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
