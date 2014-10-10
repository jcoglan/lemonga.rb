module Lemongrab
  cattr_accessor :dungeon
  self.dungeon = {}

  module Dungeon
    def dungeon!
      raise Punishment, self
    end
  end

  class Punishment < StandardError
    include ActionView::Helpers::DateHelper

    attr_reader :duration

    def initialize(duration)
      @duration = duration
    end

    def message
      time_ago_in_words(@duration.from_now).upcase + " DUNGEON\n"
    end
  end

  [Numeric, ActiveSupport::Duration].each do |klass|
    klass.module_eval { include Dungeon }
  end

  ActionController::Base.module_eval do
    def self.unacceptable!(&block)
      define_method(:who_did_the_thing?, &block)
    end

    before_filter :clean_this_place_up

    rescue_from Punishment do |error|
      release_time = error.duration.from_now
      Lemongrab.dungeon.store(who_did_the_thing?, [error.duration, release_time])
      render(text: error.message, status: 406)
    end

  private

    def who_did_the_thing?
      request.remote_ip
    end

    def clean_this_place_up
      duration, release_time = Lemongrab.dungeon.delete(who_did_the_thing?)
      return true if release_time.nil? or Time.now >= release_time
      duration.dungeon!
    end
  end
end
