#bundle exec rake db:migrate
#データベース作成
rails db:create
#データベース作成 マイグレード
rails db:migrate
#データベース作成 データ追加
rails db:seed
# その他のコマンド
cp -rf /tmp/public/* /cocktailApp/public/
mkdir -p tmp/sockets
bundle exec puma -C config/puma.rb