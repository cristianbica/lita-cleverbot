# lita-cleverbot

[![Build Status](https://travis-ci.org/cristianbica/lita-cleverbot.png?branch=master)](https://travis-ci.org/cristianbica/lita-cleverbot)
[![Coverage Status](https://coveralls.io/repos/github/cristianbica/lita-cleverbot/badge.svg?branch=master)](https://coveralls.io/github/cristianbica/lita-cleverbot?branch=master)

This Lita handler will send unhadled messages directed to Lita to Cleverbot and reply with clever messages.

## Installation

Add lita-cleverbot to your Lita instance's Gemfile:

``` ruby
gem "lita-cleverbot"
```

## Configuration

Get your Keys from [Cleverbot](https://cleverbot.io) and add them to your configuration:

``` ruby
Lita.configure do |config|
  config.handlers.cleverbot.api_user = 'API_USER'
  config.handlers.cleverbot.api_key = 'API_KEY'
end
```


## Contributing

1. Fork it ( https://github.com/cristianbica/lita-cleverbot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
