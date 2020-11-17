require 'json'

api_path = '/1.1/media/upload.json?media_category=TWEET_IMAGE'
uploaded_images = ''

3.times do
  filename = Random.rand(0..1849)
  filename = "#{filename}.jpg"
  filepath = "https://raw.githubusercontent.com/dokimyj/twt_photo_repo/main/photos/jpgs/#{filename}"
  system("curl -o #{filename} #{filepath}")
  json_result = `twurl -X POST -H upload.twitter.com '#{api_path}' -f #{filename} -F media`
  media_id = JSON.parse(json_result)['media_id']
  uploaded_images << "#{media_id},"
end

filename = Random.rand(0..137)
filename = "#{filename}.jpg"
filepath = "https://raw.githubusercontent.com/dokimyj/twt_photo_repo/main/photos/pngs/#{filename}"
system("curl -o #{filename} #{filepath}")
json_result = `twurl -X POST -H upload.twitter.com '#{api_path}' -f #{filename} -F media`
media_id = JSON.parse(json_result)['media_id']
uploaded_images << "#{media_id},"

system("twurl -d 'media_ids=#{uploaded_images}' -d 'status=#水瀬いのり' /1.1/statuses/update.json")
