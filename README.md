# RocketShorts

This is an extension or set of overrides that sit on top of [RocketPants](https://github.com/filtersquad/rocket_pants). This is not an elegant extension by any means, but rather a set of modules that leverage the RocketPants load order to monkey-patch functionality.

## Why RocketShorts over RocketPants?

There are a few differentiators: (neither is the 'right way', its personal preference)

**Note** Support for points 3 and 4 are planned, but not included in the current gem.

1. Version control is done through the `Accept` HTTP Header instead of a `:version` parameter.
2. Support for a default version. Making HTTP testing possible for a single version.
3. Pagination should use the `link` HTTP Header and not the content body.
4. Clean up the payload body to avoid nesting under a `response` JSON key.

## Installation

Add this line to your application's Gemfile:

    gem 'rocket_shorts'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rocket_shorts

## Usage

Remove `rocket_pants` from your Gemfile and replace with `rocket_shorts`.

Add a `config/inititalizers/rocket_shorts.rb` and specify what header format
your API should look for.

```ruby
# config/initializers/rocket_shorts.rb
require 'rocket_shorts'

RocketShorts.header_format = /application\/vnd\.yourcompany\.v/
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
