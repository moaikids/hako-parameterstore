# Hako::EnvProviders::Rcredstash
Provide variables from [rcredstash](https://github.com/adorechic/rcredstash) to [hako](https://github.com/eagletmt/hako)

[![Coverage Status](https://coveralls.io/repos/github/moaikids/hako-rcredstash/badge.svg)](https://coveralls.io/github/moaikids/hako-rcredstash)

[![codebeat badge](https://codebeat.co/badges/404c9088-e104-4f13-b6de-7d0ebe8e5d81)](https://codebeat.co/projects/github-com-moaikids-hako-rcredstash-master)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hako-rcredstash'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hako-rcredstash

## Usage

1. Put encrypted value using rcredstash

```
$ rcredstash put encrypted.some_password 
secret value> veryverysecret
$ rcredstash get encrypted.some_password 
veryverysecret
```

2. Setting hako and run it
```
  env:
    $providers:
      - type: rcredstash
    SOME_PASSWORD: ‘#{encrypted.some_password}'
```

3. A value is set for the ECS environment variable

```
Environment Variables
Key Value
SOME_PASSWORD   veryverysecret
```


