require 'json'

api_path = '/1.1/media/upload.json?media_category=TWEET_IMAGE'
uploaded_images = []
media_ids = ''

4.times do
  filename = Random.rand(1909)
  ext = filename > 129 ? 'jpg' : 'png'
  uploaded_images << "#{filename}.#{ext}"
end

uploaded_images.uniq.each do |image|
  filepath = "https://raw.githubusercontent.com/dokimyj/twt_photo_repo/main/photos/#{image}"
  system("curl -o #{image} #{filepath}")
  json_result = `twurl -X POST -H upload.twitter.com '#{api_path}' -f #{image} -F media`
  media_id = JSON.parse(json_result)['media_id']
  media_id = "#{media_id}," if !media_id.to_s.empty?
  media_ids << media_id
end

system("twurl -d 'media_ids=#{media_ids}' -d 'status=#水瀬いのり' /1.1/statuses/update.json")
