require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  WINDOW_SIZE = [1400, 1400]
  DRIVER = if ENV["DRIVER"]
             ENV["DRIVER"].to_sym
           else
             :headless_chrome
           end
  driven_by :selenium, using: DRIVER, screen_size: WINDOW_SIZE
end

class MobileSystemTestCase <  ApplicationSystemTestCase
  setup do
    visit root_path
    current_window.resize_to(375, 812)
  end

  teardown do
    current_window.resize_to(*ApplicationSystemTestCase::WINDOW_SIZE)
  end
end
