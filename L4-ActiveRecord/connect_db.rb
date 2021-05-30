require "active_record"

def connect_db!
  ActiveRecord::Base.establish_connection(
    host: "localhost",
    adapter: "postgresql",
    database: "saas_db",
    user: "postgres",
    password: "123456789",
  )
end
