require File.dirname(__FILE__) + '/test_helper.rb'

class TestWebsnapshot < Test::Unit::TestCase

  def setup
  end

  def test_take
    # without options
    Websnapshot.take('http://google.co.jp')
    assert_image('screenshot.png', 960, 640, 'png')

    Websnapshot.take('testpage_128x128.html')
    assert_image('screenshot.png', 128, 128, 'png')

    Websnapshot.take('testpage_1280x720.html')
    assert_image('screenshot.png', 960, 640, 'png')

    # with max_width option
    Websnapshot.take('testpage_960x640.html', :max_width => 320)
    assert_image('screenshot.png', 320, 640, 'png')

    Websnapshot.take('testpage_128x128.html', :max_width => 320)
    assert_image('screenshot.png', 128, 128, 'png')

    Websnapshot.take('testpage_1280x720.html', :max_width => 320)
    assert_image('screenshot.png', 320, 640, 'png')

    # with max_height option
    Websnapshot.take('testpage_960x640.html', :max_height => 240)
    assert_image('screenshot.png', 960, 240, 'png')

    Websnapshot.take('testpage_128x128.html', :max_height => 240)
    assert_image('screenshot.png', 128, 128, 'png')

    Websnapshot.take('testpage_1280x720.html', :max_height => 240)
    assert_image('screenshot.png', 960, 240, 'png')

    # with max_width and max_height options

    # with output_filename option

    # with output_format option
  end

  def assert_image(filename, expected_width, expected_height, expected_image_format)
  end

end
