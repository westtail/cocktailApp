# dockerfile 
# 開発rubyバージョン指定
FROM ruby:2.5.1

# 必要なパッケージのインストール（基本的に必要になってくるものだと思うので削らないこと）
# build-essential ビルドツール  libpq-dev はPostgreSQLの略語  node.jsはjavascript用のランタイム
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs \
    fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatspi2.0-0 libgtk-3-0 libnspr4 libnss3 libx11-xcb1 libxss1 libxtst6 xdg-utils \
    unzip zip

# rspecのテストでエラーが出るので修正  chome関連をインストール
# エラーとして　chromeのバージョンとchromedriverのバージョンが違うとエラーが出ることがある
#なので`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`で最新バージョンを指定
RUN curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN curl -O https://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip

# 作業ディレクトリの作成、設定
RUN mkdir /cocktailApp

##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
# ENV 環境変数の定義
ENV APP_ROOT /cocktailApp

# WORKDIR 作業ディレクトリの指定 WORKDIR  /develop だと $pwd 結果 develop/
WORKDIR $APP_ROOT

#rails コンソールで日本語を使えるようにする
ENV LANG C.UTF-8

# ホストのGemfileとGemfile.lockをコンテナにコピー
# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . $APP_ROOT

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets

RUN mkdir -p /tmp/public && \
    cp -rf /cocktailApp/public/* /tmp/public