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
require 'fog'
require 'fog'

# http://grosser.it/2011/04/09/creating-a-ec2-micro-instance-via-fog/
def connect_to_fog
  $fog = Fog::Compute.new(
    :provider              => 'AWS',
    :region                => 'us-west-2',
    :aws_access_key_id     => ENV['AWS_ACCESS_KEY'],
    :aws_secret_access_key => ENV['AWS_SECRET_KEY']
  )
end

# 'ami-5189a661',
def create_server
  connect_to_fog

  server = $fog.servers.create(
    :key_name           => 'lazyfucker',
    :image_id           => 'ami-6d31055d',
    :flavor_id          => 't2.micro',
    :security_group_ids => %w(sg-5e96463b)
  )

  # wait for it to get online
  server.wait_for { print "."; ready? }

  `echo ssh -i lazyfucker.pem ubuntu@#{server.public_ip_address} | pbcopy` rescue nil

  server
end
