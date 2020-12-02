require 'json'

$api_path = '/1.1/media/upload.json?media_category=TWEET_IMAGE'
$uploaded_images = ''

def upload_img(max_num, ext)
  filename = Random.rand(0..max_num)
  filename = "#{filename}.#{ext}"
  filepath = "https://raw.githubusercontent.com/dokimyj/twt_photo_repo/main/photos/#{ext}s/#{filename}"
  system("curl -o #{filename} #{filepath}")
  json_result = `twurl -X POST -H upload.twitter.com '#{$api_path}' -f #{filename} -F media`
  media_id = JSON.parse(json_result)['media_id']
  $uploaded_images << "#{media_id},"
end

3.times do
  upload_img(1899, 'jpg')
end

sleep 5

if Time.now.hour == 10 || Time.now.hour == 22
  upload_img(141, 'png')
else
  upload_img(1899, 'jpg')
end

status = '#水瀬いのり'

if Time.now.month == 12 && Time.now.day == 2 
  status.concat(" #水瀬いのり生誕祭#{Time.now.year}") 
  status.concat(" 大好きないのりちゃん！大切な Happy Birthday!") 
  status.concat(" アーティストデビュー#{Time.now.year-2015}周年 & #{Time.now.year-1995}歳のお誕生日おめでとう！") 
  status.concat(" 幸せな一日、素敵な#{Time.now.year-1995}歳の一年を過ごせますように。") 
end

system("twurl -d 'media_ids=#{$uploaded_images}' -d 'status=#{status}' /1.1/statuses/update.json")
