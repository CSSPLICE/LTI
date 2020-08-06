FROM ruby:latest

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./

EXPOSE 3000

CMD ["bash", "install.sh"]
