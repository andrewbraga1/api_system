class LaboratoryExam < ApplicationRecord
    belongs_to :laboratory
    belongs_to :exam
  end