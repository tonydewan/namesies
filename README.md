# Namesies

Naming things is hard. Namesies makes it a little bit easier by searching all the places for you. CLI only, for now. Currently searches:

* Domains (using domai.nr)
* Twitter usernames
* Trademarks (US, live only)
* RubyGems

## Installation

Add this line to your application's Gemfile:

    gem 'namesies'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install namesies

## Usage

Search for a thing at all the things:

    $ namesies search namesies

Only want to search Twitter?

    $ namesies search tonydewan --only twitter

Want to skip trademark seach?

    $ namesies search tonydewan --except trademark

See what services are supported:

    $ namesies services

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
