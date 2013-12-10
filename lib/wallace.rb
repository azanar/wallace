#require 'newrelic_rpm'
require 'stringio'

require 'pp'

require 'active_support/string_inquirer'
require 'active_support/core_ext'


module Wallace

  class << self
    def logger
      return @logger if @logger

      @logger = Logger.new(STDOUT)
      @logger.formatter = proc { |severity, datetime, progname, msg| 
        "[#{datetime}, #{severity}] #{msg}\n"
      }
      @logger
    end

    def logger=(logger)
      @logger = logger
    end

    def env
      @_env ||= ActiveSupport::StringInquirer.new(ENV["SUMMARIZER_ENV"] || ENV["RAILS_ENV"] || "development")
    end

    def env=(environment)
      @_env = ActiveSupport::StringInquirer.new(environment)
    end

    def root
      @root ||= Dir.pwd
    end

    def root=
      @root = root
    end
  end
end

