
## Overview ##

An initial skeleton project for a wise-4 deployment tool.

## requirements: ##

* ruby
* [rvm][rvm] (recommended)

## Setup Will install: ## ##

* [bunlder][bundler]
* [librarian][librarian]

## Setup Steps ##

    cp rvmrc.sample ./.rvmrc
    # optionally edit ./.rvmrc to choose your own rubies / gem files
    srouce ./.rvmrc
    gem install bundler
    bundle install
    bundle exec librarian-chef install

## References ##
---

- [Librarian][librarian]
- [chef][chef]
- [little-chef][little-chef]


[librarian]: https://github.com/applicationsonline/librarian
[chef]: http://wiki.opscode.com/display/chef/Chef+Solo
[little-chef]: https://github.com/tobami/littlechef
[bundler]: http://gembundler.com/