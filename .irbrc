require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

begin
  include Rails.application.routes.url_helpers

  default_url_options[:host] = "localhost"
rescue
  nil
end
