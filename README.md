# Hako::EnvProviders::Parameterstore
Provide variables from [AWS Parameter Store](http://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-paramstore.html) to [hako](https://github.com/eagletmt/hako)

[![Coverage Status](https://coveralls.io/repos/github/moaikids/hako-parameterstore/badge.svg)](https://coveralls.io/github/moaikids/hako-parameterstore)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hako-parameterstore'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hako-parameterstore

## Usage

1. Put encrypted value using AWS ParameterStore

```
$ aws ssm put-parameter --name encrypted.some_password  --value veryverysecret --type SecureString
$ aws ssm get-parameter --name encrypted.some_password  --with-decryption
veryverysecret
```

2. Setting hako and run it
```
  env:
    $providers:
      - type: parameterstore
    SOME_PASSWORD: ‘#{encrypted.some_password}'
```

3. A value is set for the ECS environment variable

```
Environment Variables
Key Value
SOME_PASSWORD   veryverysecret
```


