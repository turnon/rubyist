# Rubyist

Just made this to know gems owned by someone, and forget the [gems](https://github.com/rubygems/gems) and [rubygems.org API](http://guides.rubygems.org/rubygems-org-api/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubyist'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubyist

## Usage

```
irb(main):001:0> Rubyist.own('kaminari').include? Rubyist.named('a_matsuda')
=> true
```

Interfaces as below

```
irb(main):002:0> Rubyist.methods false
=> [:named, :own]
irb(main):003:0> Rubyist.instance_methods false
=> [:<=>, :name, :gems, :total_downloads]
irb(main):004:0> Rubyist::Gem.instance_methods false
=> [:<=>, :name, :info, :versions, :total_downloads, :homepage_uri, :project_uri]
irb(main):005:0> Rubyist::Gem::Version.instance_methods false
=> [:summary, :number, :downloads, :created_at]
```

CLI

```
$ rubyist tenderlove
```
