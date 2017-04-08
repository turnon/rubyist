require 'rubyist/version'
require 'gems'
require 'time'

class Rubyist
  attr_reader :name
  include Comparable

  def initialize name
    @name = name
  end

  def <=>(other)
    name <=> other.name
  end

  def gems
    return @gems if defined? @gems
    result = Gems.gems(name)
    @gems = (Hash === result ? [] : result.map { |g| Gem.new g })
  end

  def total_downloads
    gems.inject(0) { |sum, g| sum + g.total_downloads }
  end

  class << self
    alias_method :named, :new

    def own gem_name
      Gems.owners(gem_name).
        map { |o| new o['handle'] }
    end
  end

  class Gem
    attr_reader :name, :info, :homepage_uri, :project_uri
    include Comparable

    def initialize hash
      @name, @info, @homepage_uri, @project_uri =
        %w[name info homepage_uri project_uri].map { |k| hash[k] }
    end

    def <=>(other)
      name <=> other.name
    end

    def versions
      @versions ||= Gems.versions(name).map { |v| Version.new v }
    end

    def total_downloads
      versions.inject(0) { |sum, v| sum + v.downloads }
    end

    class Version
      attr_reader :number, :created_at, :downloads, :summary

      def initialize hash
        @number = hash['number']
        @downloads = hash['downloads_count']
        @summary = hash['summary']
        @created_at = Time.xmlschema hash['created_at']
      end
    end
  end
end
