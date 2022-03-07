FROM ruby:3.1.1

MAINTAINER cismael

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
#COPY Gemfile ./

RUN rm Gemfile.lock && bundle install --full-index
RUN #rm Gemfile.lock && gem install bundler:1.17.3 && bundle install --full-index
#RUN rm Gemfile.lock && gem install rails && gem install bundler:1.17.3 && bundle install --full-index
#RUN rm Gemfile.lock && bundle _1.17.3_ install --full-index

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]