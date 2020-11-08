require 'json'

entire_photos = Dir.glob('./photos/*.png').push(Dir.glob('./photos/*.jpg')).flatten.uniq
system ('cat ~/.twurlrc')
uploaded_images = ''
4.times do
  json_result = `twurl -X POST -H upload.twitter.com '/1.1/media/upload.json?media_category=TWEET_IMAGE' -f #{entire_photos[Random.rand(entire_photos.length - 1)]} -F media`
  media_id = JSON.parse(json_result)['media_id']
  uploaded_images << "#{media_id},"
end

system("twurl -d 'media_ids=#{uploaded_images}' -d 'status=#水瀬いのり' /1.1/statuses/update.json")
