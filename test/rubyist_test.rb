require 'test_helper'
require 'pp'

class RubyistTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Rubyist::VERSION
  end

  def test_that_it_does_something_useful
    rbi = Rubyist.new 'a_matsuda'
    rbi.gems.each do |g|
      puts "#{g.name} #{g.total_downloads}"
      g.versions.each do |v|
        puts "  #{v.number} #{v.downloads}"
      end
      puts
    end
  end
end
