# Kisi Webhook

This is a simple app that allows you to generate webhook handlers for
[Kisi](http://getkisi.com/), to deliver email messages based on
various Kisi events.

## Demo

[Heroku App](https://kisi-webhook.herokuapp.com/)

## Requirements

- Ruby 2.4.2
- PostgreSQL 10.1

## Development

```
bundle install
rails db:setup
rails server
```

## Nice to have/improve

- the mailer should use background jobs for delivery to avoid timeouts on webhook processing
- it should be possible to return to an existing webhook definition, and update it
- allow more sophisticated conditions
- displaying recorded events in a webhook

## Copyright

Copyright © 2017 Kuba Kuźma. See LICENSE for details.
