# ベースとなるイメージの指定（rubyのバージョン3.0.3を指定）
FROM ruby:3.2.2
 
# ビルド時に実行するコマンドの指定
# インストール可能なパッケージの一覧の更新
RUN apt-get update -qq
# パッケージのインストール（nodejs、postgresql-client、npmを指定）
 
# 作業ディレクトリの指定
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
