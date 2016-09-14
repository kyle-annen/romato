# Zomatastic

A simple api wrapper for Zomato API, all methods coorelate to the API definitions in the Zomato API documentation: https://developers.zomato.com/documentation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zomatastic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zomatastic

## Usage

All api methods accept an options hash if the API call accepts parameters, and directly mirror the API parameters defined by the Zomato API v2.1.

#### Initialization

##### Zomatastic::Zomato.new()

The initialization of the class accetps an options parameter as a hash. Provide the API key here as a hash.

`zomato_instance = Zomatastic::Zomato.new("APIKEY")`

#### Common Methods (as defined by Zomato API)
### Zomatastic::Zomato.get_categories()

Get the categories of venues defined by Zomato, accepts no parameters.

`zomato_instance.get_categories()`

Response: 

```ruby
{"categories"=>
	[
		{"categories"=>{"id"=>1, "name"=>"Delivery"}}, 
		{"categories"=>{"id"=>2, "name"=>"Dine-out"}}, 
		{"categories"=>{"id"=>3, "name"=>"Nightlife"}}, 
		{"categories"=>{"id"=>4, "name"=>"Catching-up"}}, 
		{"categories"=>{"id"=>5, "name"=>"Takeaway"}}, 
		{"categories"=>{"id"=>6, "name"=>"Cafes"}}, 
		{"categories"=>{"id"=>7, "name"=>"Daily Menus"}}, 
		{"categories"=>{"id"=>8, "name"=>"Breakfast"}}, 
		{"categories"=>{"id"=>9, "name"=>"Lunch"}}, 
		{"categories"=>{"id"=>10, "name"=>"Dinner"}}, 
		{"categories"=>{"id"=>11, "name"=>"Pubs & Bars"}}, 
		{"categories"=>{"id"=>12, "name"=>"Premium Delivery"}}, 
		{"categories"=>{"id"=>13, "name"=>"Pocket Friendly Delivery"}}, 
		{"categories"=>{"id"=>14, "name"=>"Clubs & Lounges"}}
	]
}
```

Categories will be accessible through the class variable `categories`

`zomato_instance.categories`





## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/zomatastic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

