require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

class Array
  def jsum
    self.inject(0) { |acc,n| acc = acc + n.to_f; acc }
  end
end

include Rails.application.routes.url_helpers rescue nil

require 'rubygems'
require 'interactive_editor'
