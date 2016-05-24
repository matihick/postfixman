module Postfixman
  class Domain
    attr_accessor :id, :name, :from, :recipients, :enabled

    def initialize(attributes={})
      attributes.each do |k,v|
        self.send("#{k}=", v) if self.respond_to?(k)
      end
    end
  end
end
