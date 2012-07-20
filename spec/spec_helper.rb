$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require 'rocket_shorts'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

RSpec.configure do |c|
end
