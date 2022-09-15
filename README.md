## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Tests](#test)

## General info
This project is simple rails app that accepts gps waypoints throug API request and show the vehicles most recent location on google map.
	
## Technologies
Project is created with:
* Ruby: ruby 3.0.0p0
* Ruby on Rails: 7.0.4
* Redis server version: Redis server v=5.0.7 sha=00000000:0 malloc=jemalloc-5.2.1 bits=64 build=66bd629f924ac924
	
## Setup
To run this project, open your terminal and go to project root and run the
following commands:

```sh
bundle install
rails db:create
rails db:migrate
rails server
```

Open other terminal and make sure your redis server is running to run 
sidekiq with the following command:

```sh
sidekiq
```

And now you are ready to make the first POST request with the following format:

```
{
  "latitude": 43.978508518956005,
  "longitude": 15.383371119693324,
  "sent_at": "2022-09-15 13:53:00",
  "vehicle_identifier": "RVZ-076"
}
```

You can see the locations at "\show" endpoint in your browser

### Seed

If you want to start with random data, you can run the following command: 

```sh
rails db:seed
```

## Tests

The project is currently using Rspec to run tests, and you can run them with
the following command:

```sh
bundle exec rspec
```
