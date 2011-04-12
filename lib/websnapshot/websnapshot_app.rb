#!/usr/bin/ruby
# vim: set ts=2 sts=2 sw=2 tw=0 ff=unix expandtab :

require 'websnapshot.rb'


class WebSnapshotApp
  def usage
    puts 'please specify an url'
    return 1
  end

  def run
    (usage && exit) if ARGV[0].nil?

    ws = WebSnapshot.new
    ws.take(ARGV[0])
  end
end


if __FILE__ == $0
  app = WebSnapshotApp.new
  app.run
end

