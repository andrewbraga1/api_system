class Laboratory < ApplicationRecord
    include Discard::Model
    extend ApplicationHelper
    has_many :laboratory_exams
    has_many :exams, :through => :laboratory_exams
  
    validates_presence_of :name
    validates_uniqueness_of :name

    #Scopes
    scope :valid,                      -> { where(discarded_at: nil)}
    scope :active,                      -> { where(status: true)}

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

    def self.search_by_exam(exam)
        query = mount_query(Exam,{"name" => exam})
        
        query = Laboratory.valid.joins(:laboratory_exams).where(laboratory_exams:{exam_id:query.map(&:id)})
        if exam and query.size > 0
            query
        elsif exam || query.size < 1
            []
        else
            self.valid
        end
    end

    after_discard do
        self.status = false
        self.save
    end
    
    after_undiscard do
        self.status = true
        self.save
    end

end
