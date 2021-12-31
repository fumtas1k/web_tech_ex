require "pg"

connection = PG::connect(dbname: "goya")
connection.internal_encoding = "utf-8"

begin
  result = connection.exec("SELECT weight, give_for FROM crops;")
  result.each do |record|
    puts "ゴーヤの大きさ: #{record["weight"]} 売った相手: #{record["give_for"]}"
  end
ensure
  connection.finish
end