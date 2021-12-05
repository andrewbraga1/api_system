class Exam < ApplicationRecord
    include Discard::Model
    extend ApplicationHelper

    has_many :laboratory_exams
    has_many :laboratories, :through => :laboratory_exams
  
    validates_presence_of :name
    validates_uniqueness_of :name

    #Scopes
    scope :valid,                      -> { where(discarded_at: nil)}
    scope :active,                      -> { where(status: true)}

    before_save :typo_reference

    def typo_reference
        case self.typo.to_i
        when 1
            self.typo = "clinical analysis"
        when 2
            self.typo = "image"
        else
            self.typo = "clinical analysis"
        end
    end

    def self.search(params)
        params = filter_to_object(self,params)
        query = mount_query(self,params)
        if !params.empty? and query.size > 0
            query
        elsif !params.empty? and query.size < 1
            []
        else
            self.valid
        end
    end
end
