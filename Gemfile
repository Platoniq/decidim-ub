# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "0.28.2"

gem "decidim", DECIDIM_VERSION
# gem "decidim-conferences", "0.28.1"
# gem "decidim-design", "0.28.1"
# gem "decidim-elections", "0.28.1"
# gem "decidim-initiatives", "0.28.1"
gem "decidim-templates", "0.28.2"

gem "decidim-decidim_awesome", git: "https://github.com/decidim-ice/decidim-module-decidim_awesome", branch: "develop"
gem "decidim-ub"

gem "bootsnap", "~> 1.3"

gem "puma", ">= 6.3.1"

gem "wicked_pdf", "~> 2.1"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "brakeman", "~> 5.4"
  gem "decidim-dev", DECIDIM_VERSION
  gem "mdl"
  gem "net-imap", "~> 0.2.3"
  gem "net-pop", "~> 0.1.1"
  gem "net-smtp", "~> 0.3.1"
end

group :development do
  gem "letter_opener_web", "~> 2.0"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 4.2"

  gem "capistrano", "~> 3.18"
  gem "capistrano-bundler"
  gem "capistrano-passenger"
  gem "capistrano-rails", "~> 1.6"
  gem "capistrano-rails-console"
  gem "capistrano-rbenv"
  gem "capistrano-sidekiq"
end

group :production do
  gem "aws-sdk-s3", require: false
  gem "figaro", "~> 1.2"
  gem "passenger"
  gem "sidekiq"
end
