require 'json'

api_path = '/1.1/media/upload.json?media_category=TWEET_IMAGE'
uploaded_images = ''

def upload_img(max_num, ext)
  filename = Random.rand(0..max_num)
  filename = "#{filename}.#{ext}"
  filepath = "https://raw.githubusercontent.com/dokimyj/twt_photo_repo/main/photos/#{ext}s/#{filename}"
  system("curl -o #{filename} #{filepath}")
  json_result = `twurl -X POST -H upload.twitter.com '#{api_path}' -f #{filename} -F media`
  media_id = JSON.parse(json_result)['media_id']
  uploaded_images << "#{media_id},"
end

3.times do
  upload_img(1849, 'jpg')
end

if Time.now.hour == 10 || Time.now.hour == 22
  upload_img(137, 'png')
else
  upload_img(1849, 'jpg')
end

system("twurl -d 'media_ids=#{uploaded_images}' -d 'status=#水瀬いのり' /1.1/statuses/update.json")
