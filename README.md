# Tea Subscription - Take home challenge

## Table of contents
- [Overview](#overview)
- [Setup](#setup)
- [Schema](#schema)
- [Endpoints](#endpoints)
- [Contact](#contact)

## Overview
This is a practice take home challenge to create a Rails API for a Tea Subscription Service.

## Setup
To use this application:

* Clone this repository
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:{create,migrate,seed}`
* Run the test suite with `bundle exec rspec`
* Run your development server with `rails s` to see the app in action.

## Schema

<img width="869" alt="Screen Shot 2022-01-06 at 12 16 20 PM" src="https://user-images.githubusercontent.com/83834410/148438518-91990043-7e21-48b8-98c6-a08aa4c8ce54.png">

## Endpoints

#### Subscribe a customer to a tea subscription

`POST /subscriptions params{title: <TITLE>, price: <PRICE>, tea_id: <TEA_ID>, customer_id: <CUSTOMER_ID>}`

Example JSON response:

```
{
    "data": {
        "id": "2",
        "type": "subscription",
        "attributes": {
            "title": "Kovu's oolong subscription",
            "price": 35.99,
            "status": "Active",
            "customer": {
                "id": 2,
                "first_name": "Kovu",
                "last_name": "The Cat",
                "email": "kovu@test.com",
                "address": "123 st",
                "created_at": "2022-01-07T04:22:47.424Z",
                "updated_at": "2022-01-07T04:22:47.424Z"
            },
            "tea": {
                "id": 1,
                "title": "Oolong",
                "description": "A type of tea",
                "temperature": 180.0,
                "created_at": "2022-01-07T04:22:47.432Z",
                "updated_at": "2022-01-07T04:22:47.432Z",
                "brew_time": 150
            }
        }
    }
}
```

#### Cancel a customer’s tea subscription

`PATCH /subscriptions params{id: <SUBSCRIPTION_ID>}`

Example JSON response:

```
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Rowans oolong subscription",
            "price": 35.99,
            "status": "Cancelled",
            "customer": {
                "id": 1,
                "first_name": "Rowan",
                "last_name": "DeLong",
                "email": "rowan@test.com",
                "address": "123 st",
                "created_at": "2022-01-07T04:22:47.419Z",
                "updated_at": "2022-01-07T04:22:47.419Z"
            },
            "tea": {
                "id": 1,
                "title": "Oolong",
                "description": "A type of tea",
                "temperature": 180.0,
                "created_at": "2022-01-07T04:22:47.432Z",
                "updated_at": "2022-01-07T04:22:47.432Z",
                "brew_time": 150
            }
        }
    }
}
```

#### All of a customer’s subsciptions (active and cancelled)

`GET /subscriptions params{id: <CUSTOMER_ID>}`

Example JSON response:

```
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Rowans oolong subscription",
                "price": 35.99,
                "status": "Cancelled",
                "customer": {
                    "id": 1,
                    "first_name": "Rowan",
                    "last_name": "DeLong",
                    "email": "rowan@test.com",
                    "address": "123 st",
                    "created_at": "2022-01-07T04:22:47.419Z",
                    "updated_at": "2022-01-07T04:22:47.419Z"
                },
                "tea": {
                    "id": 1,
                    "title": "Oolong",
                    "description": "A type of tea",
                    "temperature": 180.0,
                    "created_at": "2022-01-07T04:22:47.432Z",
                    "updated_at": "2022-01-07T04:22:47.432Z",
                    "brew_time": 150
                }
            }
        },
        {
            "id": "3",
            "type": "subscription",
            "attributes": {
                "title": "Rowan's jasmine subscription",
                "price": 35.99,
                "status": "Active",
                "customer": {
                    "id": 1,
                    "first_name": "Rowan",
                    "last_name": "DeLong",
                    "email": "rowan@test.com",
                    "address": "123 st",
                    "created_at": "2022-01-07T04:22:47.419Z",
                    "updated_at": "2022-01-07T04:22:47.419Z"
                },
                "tea": {
                    "id": 2,
                    "title": "Jasmine",
                    "description": "A green tea",
                    "temperature": 160.0,
                    "created_at": "2022-01-07T04:22:47.436Z",
                    "updated_at": "2022-01-07T04:22:47.436Z",
                    "brew_time": 150
                }
            }
        }
    ]
}
```

### Contact

* Rowan DeLong
* rowanwinzer@gmail.com
* [LinkedIn](https://www.linkedin.com/in/rowandelong)

