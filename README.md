
# WISE-CHEF #

## Overview ##

 This project aims to be a [WISE][WISE] deployment tool. It helps developers setup a WISE4 portal, in order to test their WISE4 steps It will eventually merge with or replace the [wise4-vagrant][wise4-vagrant] project.

It uses Librian to install and import chef cookbooks into ./cookbooks. Currently it uses the [wise-cookbooks][wise-cookbooks] repo.

## requirements: ##

* ruby
* [rvm][rvm] (recommended)

## Setup Will install: ##

* [bunlder][bundler]
* [librarian][librarian]


## Setup and deploy steps ##

    cp rvmrc.sample ./.rvmrc
    # optionally edit ./.rvmrc to choose your own rubies / gem files
    srouce ./.rvmrc
    gem install bundler
    bundle install
    bundle exec librarian-chef install
    cp config/credentials.config.sample config/credentials.config
    edit config/credentials.config
    # optionally move some pem files into config/keys
    bundle exec thor cloud new

## TODO ##

* simplify
* consider using [knife-solo][knife-solo]

---

## References ##

- [wise-cookbooks][wise-cookbooks]
- [wise4-vagrant][wise4-vagrant]
- [Librarian][librarian]
- [chef][chef]
- [little-chef][little-chef]
- [knife-solo][knife-solo]
- [nice stack exchange article](http://stackoverflow.com/questions/9689336/how-to-install-chef-solo)
- [Wise Developers git repository][WISE Github]

[wise-cookbooks]: https://github.com/concord-consortium/wise-cookbooks
[wise4-vagrant]: https://github.com/concord-consortium/wise4-vagrant/tree/wise4-ec2
[wise-chef-test]: https://github.com/concord-consortium/wise-chef-test
[wise-cloud]: https://github.com/concord-consortium/wise-cloud

[librarian]: https://github.com/applicationsonline/librarian

[plugins-page]: http://wiki.opscodecom/display/chef/Community+Plugins
[knife-ec2]: https://github.com/opscode/knife-ec2
[knife-solo]: https://github.com/matschaffer/knife-solo
[knife-hatch]: https://github.com/xdissent/chef-hatch-repo

[WISE Github]: https://github.com/WISE-Community
[WISE]: http://wise.berkeley.edu/

[librarian]: https://github.com/applicationsonline/librarian
[chef]: http://wiki.opscode.com/display/chef/Chef+Solo
[little-chef]: https://github.com/tobami/littlechef
[bundler]: http://gembundler.com/
[knife-solo]: https://github.com/matschaffer/knife-solo
[chef-installer]: http://www.opscode.com/chef/install/
[chef-install-shell]: http://opscode.com/chef/install.sh
[rvm]: https://rvm.io/
[WISE Github]: https://github.com/WISE-Community
[WISE]: http://wise.berkeley.edu/
