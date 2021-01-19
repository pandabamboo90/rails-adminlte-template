# gets the docker image of ruby 2.7 and lets us build on top of that
FROM ruby:2.7.1-slim

# Installation of dependencies
RUN apt-get update -qq \
  && apt-get install -y \
     # Needed for certain gems
    build-essential \
    # Needed for postgres gem
    libpq-dev \
    # Needed for asset compilation
    nodejs \
    # Needed for SQLite DB
    libsqlite3-dev \
    # Needed for mysql2 gem
    default-libmysqlclient-dev \
    # Install bash completion
    bash-completion \
    # The following are used to trim down the size of the image by removing unneeded data
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

# create a folder /myapp in the docker container and go into that folder
RUN mkdir /myapp
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock from app root directory into the /myapp/ folder in the docker container
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Run bundle install to install gems inside the gemfile
RUN bundle install

# Copy the whole app
COPY . /myapp

# Configure an entry point, so we don't need to specify
# "bundle exec" for each of our commands.
#ENTRYPOINT ["bundle", "exec"]

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
#EXPOSE 8080
#CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8080"]

# Command to run directly from desktop
# docker exec -it yakult-admin_web_1 bash

#yakult-admin-web


aws dynamodb create-table \
    --table-name dynamoid__development_Articles \
    --attribute-definitions AttributeName=title,AttributeType=S AttributeName=content,AttributeType=S \
    --key-schema AttributeName=title,KeyType=HASH AttributeName=content,KeyType=RANGE \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url http://localhost:8000