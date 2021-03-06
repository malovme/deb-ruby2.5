# frozen_string_literal: false
# $Id: test_scanfio.rb 67754 2019-08-26 14:18:58Z usa $
#
# scanf for Ruby
#
# Ad hoc tests of IO#scanf (needs to be expanded)


require "scanf"

class TestScanfIO < Test::Unit::TestCase
  def test_io
    fh = File.new(File.join(File.dirname(__FILE__), "data.txt"), "r")
    assert_equal(0, fh.pos)
    assert_equal(["this", "is"], fh.scanf("%s%s"))
    assert_equal([33, "little"], fh.scanf("%da fun%s"))
  ensure
    fh.close
  end

  def test_pipe_scanf
    r, w = IO.pipe
    w.write('a')
    w.close
    assert_equal([], r.scanf('a'))
  end
end

