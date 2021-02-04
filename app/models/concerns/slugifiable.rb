module Slugifiable
  attr_accessor :text

  module ClassMethods
    def self.slugify(text)
      downcase_no_space = text.downcase.gsub(/[" "]/, '-')
      downcase_no_space.gsub(/[!@#$%^&*()_'"`~]/, '')
    end

    def self.deslugify(slug)
      remove_dash_add_space = slug.gsub(/[-]/, " ")
      remove_dash_add_space.split.map(&:capitalize).join(" ")
    end
  end
    
  module InstanceMethods
    def slug
      Slugifiable::ClassMethods::slugify(self.name)
    end       
  end

end