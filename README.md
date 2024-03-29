
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
    cp dna.json.sample dna.json
    edit dna.json
    # optionally move some pem files into config/keys
    bundle exec thor cloud new

## modifying your setup ##

Edit dna.json to change the version of wise4 to download, or modify any other settings.  In my dna.json I specify a known release of 4.6 to download.

## updating the cookbooks ##

if you want to change the wise4 recipes, checkout the wise-cookbooks repo, and make changes, and push them.  Then run the librarian update command:
    
    bundle exec librarian-chef update

## wish list ##

* Remember the last EC2 host connected to, so that all commands default to dealing with that host. (eg `thor cloud ssh` just works!)
* Add command to clone a running instance to a new instance. (eg `thor cloud clone EC2_ID` builds a copy of a wise instance by running `cloud backup`, `cloud provision`, and `cloud restore` in sequence.)
* Auto-Update the cookbooks by running 'bundle exec librarian-chef update' automatically every 'n' days, or at startup or something. TBD
* Restructure cloud_helper as Thor application, so commands don't need to be prefixed by "Thor", and cloud.thor can be dropped.
* Move cloud_helper into a packaged GEM with binaries.
* Interactive configuration if config files are missing.
* Bash completion for cloud_helper commands in the shell.
* Export ENV variables that relate to current host and WISE setup. (imagine exporting the WISE_RSYNC command)
* Better documentation to encourage adoption and contribution.
* Cache EC2 server information for faster listing / info.
* Interactive menu driven interface (dream big right?)

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
