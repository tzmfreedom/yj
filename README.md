# Yj

Rails JSON View Builder with YAML and ERB.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yj'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yj

## Usage

You write view file with extension `xxx.json.yj`
```yaml
string_property: <%= @string %>
integer_property: 123
array_property:
<% @items.each do |item| -%>
- <%= item %>
<% end -%>
object_property:
  single_partial: <%= r.(partial: 'api/record', locals: { record: { name: 123, code: 100 } })%>
  collection_partial: <%= r.(partial: 'api/record', collection: @records, as: :record) %>
```

This response is following
```javascript
{
  "string_property": "string",
  "integer_property": 123,
  "array": [
    1,
    2,
    3,
    4,
    5
  ],
  "object_property": {
    "single_partial": {
      "a": 123,
      "b": 100
    },
    "collection_partial": [
      {
        "a": 123,
        "b": 234
      },
      # ...
    ]
  }
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tzmfreedom/yj.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
