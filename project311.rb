require 'net/http'

def curl311
  if Time.now.month == 3 && Time.now.day >= 10 && Time.now.hour >= 15
    if Time.now.day <= 11 && Time.now.hour < 15
      puts("3.11 東北大地震 #{Time.now.year - 2011}周年") 
      puts("だらしない自分のコードが東北民の傷を治せますように :pray:") 
      uri = URI('https://search.yahoo.co.jp/search?p=3.11')
      http = Net::HTTP.get(uri)
    end
  end
end

curl311
