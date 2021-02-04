module Findable
  module ClassMethods
    def find_by_slug(slug)
      instance_name = Slugifiable::ClassMethods::deslugify(slug)
      self.find_by(name: "#{instance_name}")
    end
  end
end