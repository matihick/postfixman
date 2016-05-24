module Postfixman
  class SenderBcc
    attr_accessor :id, :from, :to, :enabled

    def initialize(attributes={})
      attributes.each do |k,v|
        self.send("#{k}=", v) if self.respond_to?(k)
      end
    end
  end
end
