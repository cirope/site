FROM ruby:alpine

ENV APP_HOME /app
ENV HOME $APP_HOME
ENV RACK_ENV production
ENV USER rackapp
ENV GROUP rackapp
ENV UID 1000
ENV GID 1000

RUN apk add --update --no-cache build-base linux-headers

# TODO: remove when ADD supports variables on --chown
RUN addgroup -g $GID -S $USER && \
    adduser -u $UID -D -S -G $USER $GROUP

RUN mkdir $APP_HOME && chown $USER:$GROUP $APP_HOME

WORKDIR $APP_HOME

ADD --chown=rackapp:rackapp Gemfile $APP_HOME/Gemfile
ADD --chown=rackapp:rackapp Gemfile.lock $APP_HOME/Gemfile.lock

RUN gem update bundler --no-document
RUN bundle install --without development test --path vendor/bundle

ADD --chown=rackapp:rackapp . $APP_HOME

USER $USER:$GROUP

EXPOSE 3000

ENTRYPOINT [ \
  "bundle", "exec", "unicorn", "-c", "config/unicorn.rb", "-E", "$RACK_ENV" \
]
