FROM ruby:2.6

LABEL maintainer="pablorodriguez.ar@gamil.com"

RUN apt-get update; \
  apt-get install -y curl gnupg; \
  curl -sL https://deb.nodesource.com/setup_14.x | bash -; \
  apt-get install -y nodejs build-essential libpq-dev; \
  rm -rf /var/lib/apt/lists/*

# Ensure latest packages for Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
  tee /etc/apt/sources.list.d/yarn.list

# Install packages
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends yarn
WORKDIR /usr/src/app

COPY Gemfile* /usr/src/app/
RUN bundle install

COPY . /usr/src/app/

CMD ["bin/rails", "s", "-b","0.0.0.0"]