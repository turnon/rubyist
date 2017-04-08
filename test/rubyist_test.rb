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

  def test_rubyist_eq
    a_matsuda_1 = Rubyist.new 'a_matsuda'
    a_matsuda_2 = Rubyist.new 'a_matsuda'
    assert a_matsuda_1 == a_matsuda_2
  end

  def test_own
    a_matsuda = Rubyist.new 'a_matsuda'
    rubyists = Rubyist.own 'kaminari'
    assert_includes rubyists, a_matsuda
  end

end
