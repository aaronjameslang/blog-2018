vendor:
	bundle install

build: vendor
	bundle exec jekyll build

serve: vendor
	bundle exec jekyll serve --draft --future

draft: vendor
	bundle exec jekyll draft

publish: vendor
	bundle exec jekyll publish

venv/bin/aws:
	virtualenv venv
	. venv/bin/activate && pip install awscli

deploy: build venv/bin/aws
	. venv/bin/activate && aws s3 sync _site s3://aaronjameslang.com/blog
