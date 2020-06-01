#bundle exec rake db:migrate
rails db:create
rails db:migrate
rails db:seed
cp -rf /tmp/public/* /cocktailApp/public/
mkdir -p tmp/sockets
bundle exec puma -C config/puma.rb