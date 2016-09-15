<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Romato - Zomato API Wrapper for Ruby](#zomatastic---zomato-api-wrapper-for-ruby)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Initialization](#initialization)
        - [Romato::Zomato.new()](#zomatasticzomatonew)
  - [Methods](#methods)
    - [Common Methods (as defined by Zomato API)](#common-methods-as-defined-by-zomato-api)
      - [Romato::Zomato.get_categories()](#zomatasticzomatoget_categories)
      - [Romato::Zomato.get_cities(options)](#zomatasticzomatoget_citiesoptions)
      - [Zomastic::Zomato.get_collections(options)](#zomasticzomatoget_collectionsoptions)
  - [Development](#development)
  - [Contributing](#contributing)
  - [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Romato - Zomato API Wrapper for Ruby

A simple api wrapper for Zomato API, all methods coorelate to the API definitions in the Zomato API documentation: https://developers.zomato.com/documentation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'romato'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install romato

## Usage

All api methods accept an options hash if the API call accepts parameters, and directly mirror the API parameters defined by the Zomato API v2.1.

## Initialization
___

##### Romato::Zomato.new()

The initialization of the class accetps an options parameter as a hash. Provide the API key here as a hash.

`zomato_instance = Romato::Zomato.new("APIKEY")`

## Methods

### Common Methods (as defined by Zomato API)
___
#### Romato::Zomato.get_categories()

Get the categories of venues defined by Zomato, accepts no parameters.

`zomato_instance.get_categories()`

Response: 

```ruby
{
	"categories"=>
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

#### Romato::Zomato.get_cities(options)

View API documentation here: https://developers.zomato.com/documentation#!/common/cities

Accepts `options` hash with the following values:
* `q` query by city name
* `count` max results to return (optional)

or

* `lat` query in conjunction with lon
* `lon` query in conjunction with lat
* `count` max results to return (optional)

or

* `city_ids` comma seperated city ids string
* `count` max results to return (optional)

Example Options Hash `{ q: "seattle", count: 30 }`

Usage `zomato_instance.get_cities( {q: "seattle", count: 30} )`

Access through class variable `cities`

`zomato_instance.cities`

```ruby 
{
	"location_suggestions"=>
	[
		{
			"id"=>279, 
			"name"=>"Seattle, WA", 
			"country_id"=>216, 
			"country_name"=>"United States", 
			"discovery_enabled"=>1, 
			"has_new_ad_format"=>0, 
			"is_state"=>0, 
			"state_id"=>115, 
			"state_name"=>"Washington State", 
			"state_code"=>"WA"}
	], 
	"status"=>"success", 
	"has_more"=>0, 
	"has_total"=>0
} 
```

#### Romato::Zomato.get_collections(options)

View API documentation here: https://developers.zomato.com/documentation#!/common/collections

Accepts `options` hash with the following values:
* `city_id` query collections by city id
* `count` max results (optional)

or 

* `lat` query in conjunction with lon
* `lon` query in conjunction with lat
* `count` max results (optional)

Usage `zomato_instance.get_collections( { city_id: 279, count: 1000 })`

Access through class variable `collections`

`zomato_instance.collections`

```ruby
{
     "collections" => [
        [ 0] {
            "collection" => {
                "collection_id" => 1,
                    "res_count" => 30,
                    "image_url" => "https://b.zmtcdn.com/data/collections/e140962ec7eecbb851155fe0bb0cd28c_1463395649.jpg",
                          "url" => "https://www.zomato.com/moscow-id/top-restaurants?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
                        "title" => "Trending this Week",
                  "description" => "The most popular restaurants in town this week",
                    "share_url" => "http://www.zoma.to/c-279/1"
            }
        },
        [ 1] {
            "collection" => {
                "collection_id" => 29,
                    "res_count" => 31,
                    "image_url" => "https://b.zmtcdn.com/data/collections/4661c54a624d8a055119af2d0ccde724_1463399059.jpg",
                          "url" => "https://www.zomato.com/moscow-id/best-new-restaurants?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
                        "title" => "Newly Opened",
                  "description" => "The best new places in town",
                    "share_url" => "http://www.zoma.to/c-279/29"
            }
        },
        ........
```

#### Romato::Zomato.get_cuisines()

View API documentation here: https://developers.zomato.com/documentation#!/common/cuisines

Accepts `options` hash with the following values:
* `city_id` query collections by city id


or 

* `lat` query in conjunction with lon
* `lon` query in conjunction with lat


Usage `zomato_instance.get_cuisines( { city_id: 279 })`

Access through class variable `cuisines`

`zomato_instance.cuisines`







## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyle-annen/zomatastic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

