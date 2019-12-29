FROM ruby:alpine

ENV APP_HOME /app
ENV HOME $APP_HOME
ENV RACK_ENV production
ENV BUNDLE_PATH $APP_HOME/vendor/bundle
ENV USER nobody
ENV GROUP nobody

RUN apk add --update --no-cache build-base linux-headers

RUN mkdir $APP_HOME && chown $USER:$GROUP $APP_HOME

WORKDIR $APP_HOME

COPY --chown=$USER:$GROUP Gemfile $APP_HOME/Gemfile
COPY --chown=$USER:$GROUP Gemfile.lock $APP_HOME/Gemfile.lock

RUN gem update bundler --no-document
RUN bundle config set deployment 'true' && bundle install

COPY --chown=$USER:$GROUP . $APP_HOME

USER $USER

EXPOSE 3000

ENTRYPOINT [ \
  "bundle", "exec", "unicorn", "-c", "config/unicorn.rb", "-E", "$RACK_ENV" \
]
