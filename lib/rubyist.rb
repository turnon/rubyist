require 'rubyist/version'
require 'gems'
require 'time'

class Rubyist
  attr_reader :name

  def initialize name
    @name = name
  end

  def gems
    @gems ||= Gems.gems(name).map { |g| Gem.new g }
  end

  def total_downloads
    gems.inject(0) { |sum, g| sum + g.total_downloads }
  end

  class Gem
    attr_reader :name, :info, :homepage_uri, :project_uri

    def initialize hash
      @name, @info, @homepage_uri, @project_uri =
        %w[name info homepage_uri project_uri].map { |k| hash[k] }
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
