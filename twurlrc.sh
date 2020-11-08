#! /bin/bash

echo '---' > ~/.twurlrc
echo 'profiles:' >> ~/.twurlrc
echo '  dokimuki:' >> ~/.twurlrc
echo "    $API_KEY:" >> ~/.twurlrc
echo '      username: dokimuki' >> ~/.twurlrc
echo "      consumer_key: $API_KEY" >> ~/.twurlrc
echo "      consumer_secret: $API_SECRET" >> ~/.twurlrc
echo "      token: $ACCESS_TOKEN" >> ~/.twurlrc
echo "      secret: $ACCESS_SECRET" >> ~/.twurlrc
echo 'configuration:' >> ~/.twurlrc
echo '  default_profile:' >> ~/.twurlrc
echo '  - dokimuki' >> ~/.twurlrc
echo "  - $API_KEY" >> ~/.twurlrc