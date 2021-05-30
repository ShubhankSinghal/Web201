require "aes"

source_file_encrypt = ARGV[0]
source_file_decrypt = ARGV[1]
password = AES.key

encrypted = AES.encrypt(File.read(source_file_encrypt), password)

target_file = "#{source_file_encrypt}.enc"
File.open(target_file, "wb") { |f| f.write(encrypted) }
puts "File encrypted to #{target_file} with password #{password}"

decrypted = AES.decrypt(File.read(source_file_decrypt), password)

target_file = "#{source_file_decrypt}1.txt"
File.open(target_file, "wb") { |f| f.write(decrypted) }
puts "File decrypted to #{target_file} with password #{password}"
