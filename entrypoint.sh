#!/bin/sh -l

REVIEW_TEMPLATE_CONFIG_FILE="articles/config.yml"

if [ -z "${INPUT_CONFIG_FILE}" ]; then
    INPUT_CONFIG_FILE="config.yml"
fi

if [ -e $INPUT_CONFIG_FILE ]; then
    echo "use bundler"
    bundle install && bundle exec rake clean pdf && \
    ruby /copy_build_file.rb $INPUT_CONFIG_FILE && \
    echo "done."
else
    if [ -e $REVIEW_TEMPLATE_CONFIG_FILE ]; then
        echo "use npm"
        echo "bundle install" && \
        bundle install && \
        echo "npm install" && \
	npm install && \
        echo "npm run pdf --force" && \
	npm run pdf --force && \
        ruby /copy_build_file.rb $REVIEW_TEMPLATE_CONFIG_FILE && \
        echo "done."
    fi
fi
