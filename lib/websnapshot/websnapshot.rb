#!/usr/bin/ruby
# vim: set ts=2 sts=2 sw=2 tw=0 ff=unix expandtab :

require 'gtk2'
require 'webkit'  # https://github.com/danlucraft/rbwebkitgtk

class WebSnapshot
  def take(url, options = {})
    w = Gtk::Window.new
    w.signal_connect('destroy') do |*args|
      Gtk.main_quit
    end

    v = Gtk::WebKit::WebView.new
    v.open(url)

    v.signal_connect('load-finished') do |instance, *signal_related_args|
      options[:max_width] ||= 960
      options[:max_height] ||= 640
      options[:output_filename] ||= 'screenshot.png'
      options[:output_format] ||= 'png'

      save_viewport(instance.parent_window, options)
      Gtk.main_quit
    end

    w.add(v)
    w.show_all

    Gtk.main
  end

  private

  def save_viewport(gdk_window, options)
    win = gdk_window
    win.raise
    win.focus(0)
    win.resize(options[:max_width], options[:max_height])
    win.freeze_updates
    x, y, w, h = win.geometry
    pixbuf = Gdk::Pixbuf.from_drawable(nil, win, 0, 0, [options[:max_width], w].min, [options[:max_height], h].min)
    pixbuf.save(options[:output_filename], options[:output_format])
  end

end

