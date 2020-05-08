# dockerfile 
# 開発rubyバージョン指定
FROM ruby:2.5.1

# 必要なパッケージのインストール（基本的に必要になってくるものだと思うので削らないこと）
# build-essential ビルドツール  libpq-dev はPostgreSQLの略語  node.jsはjavascript用のランタイム
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs        

# 作業ディレクトリの作成、設定
RUN mkdir /cocktailApp
##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
# ENV 環境変数の定義
# WORKDIR 作業ディレクトリの指定 WORKDIR  /develop だと $pwd 結果 develop/
ENV APP_ROOT /cocktailApp
WORKDIR $APP_ROOT

#rails コンソールで日本語を使えるようにする
ENV LANG C.UTF-8

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
ADD . $APP_ROOT
