# Best Music

_Best Music_ is a CLI app that returns Pitchfork.com's "Best New Albums" in realtime. It allows easy browsability by genre and score and provides a brief album description and link to the full review online.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'best_music'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install best_music

You can also clone or download the repo from GitHub: https://github.com/cyantis/best_music

Once you've installed/cloned/downloaded the Gem, run `bin/setup` to install dependencies.

## Usage

To launch _Best Music_, simply run `bin/best-music`. The app returns live data from more than a dozen webpages, so it may take a few seconds to launch. Thanks for your patience!

Once _Best Music_ has loaded, you will have access to this week's "Best New Album" along with a number of options for browsing the past 12 weeks' worth of "Best New Albums." You can:

1. Browse through a list of previous albums by typing `list`.
2. Explore albums by genre. Just type `genre`.
3. Type `score` to check out the highest scoring albums.

If at any point you need a refresher on your options, simply type `help` to access a list of instructions.

Once you've finished exploring, type `exit` to quit the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cyantis/best_music.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
