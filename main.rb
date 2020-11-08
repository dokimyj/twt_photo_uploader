require 'json'

api_path = '/1.1/media/upload.json?media_category=TWEET_IMAGE'
uploaded_images = ''

4.times do
  filename = Random.rand(entire_photos.length - 1)
  ext = filename > 129 ? 'jpg' : 'png'
  filepath = "./photos/#{filename}.#{ext}"
  json_result = `twurl -X POST -H upload.twitter.com '#{api_path}' -f #{filepath} -F media`
  media_id = JSON.parse(json_result)['media_id']
  uploaded_images << "#{media_id},"
end

system("twurl -d 'media_ids=#{uploaded_images}' -d 'status=#水瀬いのり' /1.1/statuses/update.json")
