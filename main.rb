require 'json'

$api_path = '/1.1/media/upload.json?media_category=TWEET_IMAGE'
$uploaded_images = ''

repo_json = JSON.parse(`curl -X GET -H "Content-Type:application/vnd.github.v3+json" https://api.github.com/repos/dokimyj/twt_photo_repo/git/trees/main?recursive=1`)
$filepath = []
repo_json['tree'].each do |t|
  $filepath.push(t['path'])
end

def upload_img
  file_index = Random.rand(0..$filepath.length - 1)
  real_path = $filepath[file_index]
  filename = File.basename(real_path)
  url = "https://raw.githubusercontent.com/dokimyj/twt_photo_repo/main/#{real_path}"
  system("curl -o '#{filename}' '#{url}'") if filename.downcase.include?('.jpg') || filename.downcase.include?('.png')
  puts Dir.glob('*')
  json_result = `twurl -X POST -H upload.twitter.com '#{$api_path}' --file '#{filename}' --file-field 'media'`
  media_id = JSON.parse(json_result)['media_id']
  $uploaded_images << "#{media_id},"
end

while $uploaded_images.count(',') < 4 do
  upload_img
end

status = '#水瀬いのり'

if Time.now.month == 12 && Time.now.day >= 1 && Time.now.hour >= 15
  if Time.now.day <= 2 && Time.now.hour < 15
    status.concat(" #水瀬いのり生誕祭#{Time.now.year}") 
    status.concat(" 大好きないのりちゃん！大切な Happy Birthday!") 
    status.concat(" アーティストデビュー#{Time.now.year-2015}周年、 #{Time.now.year-1995}歳のお誕生日おめでとう！") 
    status.concat(" 幸せな一日、素敵な#{Time.now.year-1995}歳の一年を過ごせますように。") 
  end
end

system("twurl -d 'media_ids=#{$uploaded_images}' -d 'status=#{status}' /1.1/statuses/update.json")
