# Rubyist

Know gems owned by someone

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

```ruby
rubyist = Rubyist.new 'arthurnn'
```

Interfaces as below

```ruby
irb(main):001:0> Rubyist.instance_methods false
=> [:name, :gems, :total_downloads]
irb(main):002:0> Rubyist::Gem.instance_methods false
=> [:name, :info, :versions, :total_downloads, :homepage_uri, :project_uri]
irb(main):003:0> Rubyist::Gem::Version.instance_methods false
=> [:summary, :number, :downloads, :created_at]
```

