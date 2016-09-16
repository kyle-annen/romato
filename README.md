![alt tag](http://kyle-annen.github.io/rubylogosmall.png)

# Romato - Zomato API Wrapper for Ruby

A simple api wrapper for Zomato API, all methods coorelate to the API definitions in the Zomato API documentation: https://developers.zomato.com/documentation.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Romato - Zomato API Wrapper for Ruby](#romato---zomato-api-wrapper-for-ruby)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Initialization](#initialization)
        - [Romato::Zomato.new()](#romatozomatonew)
  - [Methods](#methods)
    - [Common Methods (as defined by Zomato API)](#common-methods-as-defined-by-zomato-api)
      - [Romato::Zomato.get_categories()](#romatozomatoget_categories)
      - [Romato::Zomato.get_cities(options)](#romatozomatoget_citiesoptions)
      - [Romato::Zomato.get_collections(options)](#romatozomatoget_collectionsoptions)
      - [Romato::Zomato.get_cuisines()](#romatozomatoget_cuisines)
      - [Romato::Zomato.get_establishments()](#romatozomatoget_establishments)
      - [Romato::Zomato.get_geocode()](#romatozomatoget_geocode)
    - [Location Methods (as defined by Zomato API)](#location-methods-as-defined-by-zomato-api)
      - [Romato::Zomato.get_location_details()](#romatozomatoget_location_details)
      - [Romato::Zomato.get_locations()](#romatozomatoget_locations)
  - [Restaurant Methods (as defined by Zomato API)](#restaurant-methods-as-defined-by-zomato-api)
      - [Romato::Zomato.get_daily_menu()](#romatozomatoget_daily_menu)
      - [Romato::Zomato.get_restaurant()](#romatozomatoget_restaurant)
      - [Romato::Zomato.get_reviews()](#romatozomatoget_reviews)
      - [Romato::Zomato.search()](#romatozomatosearch)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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

```ruby
{
    "cuisines" => [
        [  0] {
            "cuisine" => {
                  "cuisine_id" => 6,
                "cuisine_name" => "Afghani"
            }
        },
        [  1] {
            "cuisine" => {
                  "cuisine_id" => 152,
                "cuisine_name" => "African"
            }
        },
        [  2] {
            "cuisine" => {
                  "cuisine_id" => 1,
                "cuisine_name" => "American"
            }
        },
        ...
```

#### Romato::Zomato.get_establishments()

View API documentation here: https://developers.zomato.com/documentation#!/common/establishments

*Note: Establishments returns categories of establishments, rather than a list of establishments*


Accepts `options` hash with the following values:
* `city_id` query collections by city id


or 

* `lat` query in conjunction with lon
* `lon` query in conjunction with lat


Usage `zomato_instance.get_establishments( { city_id: 279 })`

Access through class variable `establishments`

`zomato_instance.establishments`

```ruby 
{
    "establishments" => [
        [ 0] {
            "establishment" => {
                  "id" => 275,
                "name" => "Pizzeria"
            }
        },
        [ 1] {
            "establishment" => {
                  "id" => 21,
                "name" => "Quick Bites"
            }
        },
        [ 2] {
            "establishment" => {
                  "id" => 281,
                "name" => "Fast Food"
            }
        },
        ...
```


#### Romato::Zomato.get_geocode()

View API documentation here: https://developers.zomato.com/documentation#!/common/geocode

*Note: geocode is used to return the location name of a given lat/lon, including locality name and nearby restaurants. In depth information is provided, examine the response for more details.*


Accepts `options` hash with the following values:

* `lat` query in conjunction with lon
* `lon` query in conjunction with lat


Usage `zomato_instance.get_geocode( { lat: "40.742051", lon: "-74.004821" } )`

Access through class variable `geocode`

`zomato_instance.geocode`

```ruby 
{
              "location" => {
         "entity_type" => "",
           "entity_id" => 0,
               "title" => "Chelsea",
            "latitude" => "40.7445500495",
           "longitude" => "-73.9971540829",
             "city_id" => 280,
           "city_name" => "New York City",
          "country_id" => 216,
        "country_name" => "United States"
    },
            "popularity" => {
             "popularity" => "5.00",
        "nightlife_index" => "4.94",
             "nearby_res" => [
            [0] "16765367",
            [1] "16761344",
            [2] "16767139",
            [3] "16777934",
            [4] "16777961",
            [5] "16777384",
            [6] "16761868",
            [7] "16771928",
            [8] "16760901"
        ],
        ...
```

### Location Methods (as defined by Zomato API)

#### Romato::Zomato.get_location_details()

View API documentation here: https://developers.zomato.com/documentation#!/location/location_details

*Note: The amount of information returned is quite large, examine the response for more detail.*

Accepts `options` hash with the following values:

* `entity_id` the id of the location entity
* `entity_type` the type i.e. city, locality


Usage `zomato_instance.get_location_details( { entity_id: 279, entity_type: "city" } )`

Access through class variable `location_details`

`zomato_instance.location_details`

```ruby 
{
               "popularity" => "4.88",
          "nightlife_index" => "4.84",
               "nearby_res" => [
        [0] "16718075",
        [1] "16718098",
        [2] "16720781",
        [3] "16717315",
        [4] "16720700",
        [5] "16718128",
        [6] "16718982",
        [7] "16718725",
        [8] "16727949"
    ],
             "top_cuisines" => [
        [0] "Cafe",
        [1] "Sandwich",
        [2] "American",
        [3] "Bar Food",
        [4] "Pacific Northwest"
    ],
           "popularity_res" => "100",
            "nightlife_res" => "10",
                  "subzone" => "Downtown",
               "subzone_id" => 113179,
                     "city" => "Seattle",
                 "location" => {
         "entity_type" => "city",
           "entity_id" => "279",
               "title" => "Seattle, Washington State",
            "latitude" => 47.60577,
           "longitude" => -122.329437,
             "city_id" => 279,
           "city_name" => "Seattle",
          "country_id" => 216,
        "country_name" => "United States"
    },
    ...
```
#### Romato::Zomato.get_locations()

View API documentation here: https://developers.zomato.com/documentation#!/location/locations

Accepts `options` hash with the following values:

* `query` use a string to query the location name
* `count` max results to return (optional)

or 

* `lat` query in conjunction with lon
* `lon` query in conjunction with lat
* `count` max results to return (optional)

Usage `zomato_instance.get_locations( { lat: "40.742051", lon: "-74.004821" } )`

Access through class variable `locations`

`zomato_instance.locations`

```ruby 
{
    "location_suggestions" => [
        [0] {
             "entity_type" => "group",
               "entity_id" => 36932,
                   "title" => "Chelsea Market, Chelsea, New York City",
                "latitude" => 40.742051,
               "longitude" => -74.004821,
                 "city_id" => 280,
               "city_name" => "New York City",
              "country_id" => 216,
            "country_name" => "United States"
        }
    ],
                  "status" => "success",
                "has_more" => 0,
               "has_total" => 0
}
```

## Restaurant Methods (as defined by Zomato API)

#### Romato::Zomato.get_daily_menu()

View API documentation here: https://developers.zomato.com/documentation#!/restaurant/restaurant

Accepts `options` hash with the following values:

* `res_id` restaurant id

Usage `zomato_instance.get_daily_menu( { res_id: "16717368" } )`

Access through class variable `daily_menu`

`zomato_instance.daily_menu`

```ruby
{
                       "R" => {
        "res_id" => 16717368
    },
                  "apikey" => "APIKEY",
                      "id" => "16717368",
                    "name" => "Canlis",
                     "url" => "https://www.zomato.com/seattle/canlis-westlake?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
                "location" => {
           "address" => "2576 Aurora Avenue North, WA 98109",
          "locality" => "Westlake",
              "city" => "Seattle",
           "city_id" => 279,
          "latitude" => "47.6429138889",
         "longitude" => "-122.3468250000",
           "zipcode" => "98109",
        "country_id" => 216
    },
                "cuisines" => "Pacific Northwest, Seafood",
    "average_cost_for_two" => 150,
             "price_range" => 4,
                "currency" => "$",
                  "offers" => [],
                   "thumb" => "https://b.zmtcdn.com/data/pictures/8/16717368/840eb8f385b06e0408e6ab9e533533da_featured_v2.jpg",
             "user_rating" => {
        "aggregate_rating" => "3.7",
             "rating_text" => "Good",
            "rating_color" => "9ACD32",
                   "votes" => "1431"
    },
              "photos_url" => "https://www.zomato.com/seattle/canlis-westlake/photos#tabtop?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
                "menu_url" => "https://www.zomato.com/seattle/canlis-westlake/menu#tabtop?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
          "featured_image" => "https://b.zmtcdn.com/data/pictures/8/16717368/840eb8f385b06e0408e6ab9e533533da_featured_v2.jpg",
     "has_online_delivery" => 0,
       "is_delivering_now" => 0,
                "deeplink" => "zomato://r/16717368",
       "has_table_booking" => 0,
              "events_url" => "https://www.zomato.com/seattle/canlis-westlake/events#tabtop?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1"
}
```

#### Romato::Zomato.get_restaurant()

View API documentation here: https://developers.zomato.com/documentation#!/restaurant/restaurant_0

Accepts `options` hash with the following values:

* `res_id` restaurant id

Usage `zomato_instance.get_restaurant( { res_id: "16717368" } )`

Access through class variable `restaurant`

`zomato_instance.restaurant`

```ruby
{
                       "R" => {
        "res_id" => 16717368
    },
                  "apikey" => "APIKEY",
                      "id" => "16717368",
                    "name" => "Canlis",
                     "url" => "https://www.zomato.com/seattle/canlis-westlake?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
                "location" => {
           "address" => "2576 Aurora Avenue North, WA 98109",
          "locality" => "Westlake",
              "city" => "Seattle",
           "city_id" => 279,
          "latitude" => "47.6429138889",
         "longitude" => "-122.3468250000",
           "zipcode" => "98109",
        "country_id" => 216
    },
                "cuisines" => "Pacific Northwest, Seafood",
    "average_cost_for_two" => 150,
             "price_range" => 4,
                "currency" => "$",
                  "offers" => [],
                   "thumb" => "https://b.zmtcdn.com/data/pictures/8/16717368/840eb8f385b06e0408e6ab9e533533da_featured_v2.jpg",
             "user_rating" => {
        "aggregate_rating" => "3.7",
             "rating_text" => "Good",
            "rating_color" => "9ACD32",
                   "votes" => "1431"
    },
              "photos_url" => "https://www.zomato.com/seattle/canlis-westlake/photos#tabtop?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
                "menu_url" => "https://www.zomato.com/seattle/canlis-westlake/menu#tabtop?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
          "featured_image" => "https://b.zmtcdn.com/data/pictures/8/16717368/840eb8f385b06e0408e6ab9e533533da_featured_v2.jpg",
     "has_online_delivery" => 0,
       "is_delivering_now" => 0,
                "deeplink" => "zomato://r/16717368",
       "has_table_booking" => 0,
              "events_url" => "https://www.zomato.com/seattle/canlis-westlake/events#tabtop?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1"
}
```

#### Romato::Zomato.get_reviews()

View API documentation here: https://developers.zomato.com/documentation#!/restaurant/reviews

Accepts `options` hash with the following values:

* `res_id` restaurant id
* `start` which review to begin query
* `count` max number of results

Usage `zomato_instance.get_reviews( { res_id: "16717368" } )`

Access through class variable `reviews`

`zomato_instance.reviews`

```ruby
{
                              "reviews_count" => 58,
                              "reviews_start" => 0,
                              "reviews_shown" => 5,
                               "user_reviews" => [
        [0] {
            "review" => {
                              "rating" => 4.5,
                         "review_text" => "Canlis July 28, 2016  Seattle, Washington  Generation Owner Brian Canlis Executive Chef Brady Williams Executive Sous Chef Baruch Ellsworth Wine & Spirits Director Nelson Daquip Sommelier & Vice Director Jackson Rohrbaugh  Accolades:  -4 Stars, Seattle Times -Relais & Chateaux -Wine Spectator Grand Award -James Beard Outstanding Wine Service Nomination -James Beard Outstanding Service Nomination -James Beard Best Chef Northwest Nomination -Highest Overall Rating, Zagat -Top 50 Restaurants in Ame...",
                                  "id" => "27856458",
                        "rating_color" => "3F7E00",
                "review_time_friendly" => "one month ago",
                         "rating_text" => "Loved it!",
                           "timestamp" => 1470513585,
                               "likes" => 0,
                                "user" => {
                                "name" => "Lee Pitofsky",
                       "zomato_handle" => "Lpit8",
                        "foodie_level" => "Super Foodie",
                    "foodie_level_num" => 8,
                        "foodie_color" => "f58552",
                         "profile_url" => "https://www.zomato.com/Lpit8?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
                       "profile_image" => "https://b.zmtcdn.com/data/user_profile_pictures/249/d795854560c55d98e622b91881695249.jpg?fit=around%7C100%3A100&crop=100%3A100%3B%2A%2C%2A",
                    "profile_deeplink" => "zomato://u/23178569"
                },
                      "comments_count" => 0
            }
        },
        ...
```

#### Romato::Zomato.search()

View API documentation here: https://developers.zomato.com/documentation#!/restaurant/search

*Note: To use the search method it is highly recommended to read the documentation and will require some exploration.*

Accepts `options` hash with the following values:

* `entity_id`
* `entity_type`
* `q`
* `start`
* `count`
* `lat`
* `lon`
* `radius`
* `cuisines`
* `establishment_type`
* `collection_id`
* `category`
* `sort`
* `order`

Usage `zomato_instance.get_search( { entity_id: "279", cuisines: "997" } )`

Access through class variable `search`

`zomato_instance.search`

```ruby
{
  "results_found": 1232547,
  "results_start": 0,
  "results_shown": 20,
  "restaurants": [
    {
      "restaurant": {
        "R": {
          "res_id": 50474
        },
        "apikey": "APIKEY",
        "id": "50474",
        "name": "Empire Restaurant",
        "url": "https://www.zomato.com/bangalore/empire-restaurant-koramangala-5th-block?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
        "location": {
          "address": "103, Industrial Area, 5th Block, Near Jyothi Nivas College, Koramangala 5th Block, Bangalore",
          "locality": "Koramangala 5th Block",
          "city": "Bangalore",
          "city_id": 4,
          "latitude": "12.9348880271",
          "longitude": "77.6160025969",
          ...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyle-annen/romato. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

