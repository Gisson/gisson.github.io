# Use the official Ruby image as the base image
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set the working directory
WORKDIR /usr/src/app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose the Jekyll server port
EXPOSE 4000

# Serve the Jekyll site
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
