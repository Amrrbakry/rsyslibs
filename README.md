[![Build Status](https://travis-ci.org/Amrrbakry/rsyslibs.svg?branch=master)](https://travis-ci.org/Amrrbakry/rsyslibs)
# Rsyslibs

A simple ruby library to determine the required system-level packages for your project dependencies.

## Overview

The Ruby Gem package manager ‘bundler’ and NodeJS ‘npm’ are excellent tools to install
project-specific dependencies.
However, they both share a major flaw, the ability to determine system-level packages required
to build native extensions.

For example, when you want to install a Ruby gem such as ‘nokogiri’, and if you don’t know
upfront, you will be hit with an exception about a missing system library. Only when you check
Nokogiri’s website, you will find out that you need to install ‘zlib1g-dev’ and ‘liblzma-dev’.

**Rsyslibs** collects all gems in your project along with operating system info and sends them to a database-driven RESTful API which looks up and returns the system-level libraries required to install your local gems.

*contribute to the API [here](https://github.com/Amrrbakry/rsyslibs_api).*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rsyslibs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rsyslibs

## Usage

To look up the system-level libraries you need for your project dependencies, simpley run:

```ruby
$ rsyslibs system_dependencies
```


or use:

```ruby
Rsyslibs::Dependencies.system_dependencies
```


To get a formatted human-readable output from the API, run:

```ruby
$ rsyslibs print_friendly_syslibs
```

or

```ruby
Rsyslibs::Dependencies.print_friendly_syslibs
```

To fetch all required system-level libraries and **install them**:

```ruby
$ rsyslibs install_syslibs # MacOS and Linux only
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amrrbakry/rsyslibs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rsyslibs project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/amrrbakry/rsyslibs/blob/master/CODE_OF_CONDUCT.md).
