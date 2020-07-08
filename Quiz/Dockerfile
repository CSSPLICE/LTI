FROM ruby:2.4.1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./

EXPOSE 3000

CMD ["bash", "install.sh"]
