require 'json'

$api_path = '/1.1/media/upload.json?media_category=TWEET_IMAGE'
$uploaded_images = ''

def upload_img(max_num, ext)
  filename = Random.rand(0..max_num)
  filename = "#{filename}.#{ext}"
  filepath = "https://raw.githubusercontent.com/dokimyj/twt_photo_repo/main/photos/#{ext}s/#{filename}"
  system("curl -o #{filename} #{filepath}")
  puts 'File to Upload:'
  puts filename
  json_result = `twurl -X POST -H upload.twitter.com '#{$api_path}' --file '#{filename}' --file-field 'media'`
  puts json_result
  media_id = JSON.parse(json_result)['media_id']
  puts media_id
  $uploaded_images << "#{media_id},"
end

3.times do
  upload_img(1899, 'jpg')
end

if Time.now.hour == 10 || Time.now.hour == 22
  upload_img(141, 'png')
else
  upload_img(1899, 'jpg')
end

status = '#水瀬いのり'

# if Time.now.month == 12 && Time.now.day == 2 
  status.concat(" #水瀬いのり生誕祭#{Time.now.year}") 
  status.concat(" 大好きないのりちゃん！大切な Happy Birthday!") 
  status.concat(" アーティストデビュー#{Time.now.year-2015}周年 & #{Time.now.year-1995}歳のお誕生日おめでとう！") 
  status.concat(" 幸せな一日、素敵な#{Time.now.year-1995}歳の一年を過ごせますように。") 
# end

puts 'Contents of Tweet'
puts status
puts 'Uploaded_Images to pull'
puts $uploaded_images

command = 'twurl -d \'media_ids='
command.concat($uploaded_images)
command.concat('\' -d \'status=')
command.concat(status)
command.concat('\' /1.1/statuses/update.json')

system(command)
