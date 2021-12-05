require 'test_helper'

class LaboratoryExamTest < ActiveSupport::TestCase
 
  def setup
    @laboratory_exam = LaboratoryExam.new(exam: exams(:hemograma), laboratory: laboratories(:sartman))
  end

  context 'associations' do
    should belong_to(:laboratory).class_name('Laboratory')
  end

  context 'associations' do
    should belong_to(:exam).class_name('Exam')
  end


  test "presence of laboratory" do
    @laboratory_exam.laboratory = nil 
    assert_not @laboratory_exam.valid?
    assert_not_empty @laboratory_exam.errors[:laboratory]
  end

  test "presence of exam" do
    @laboratory_exam.exam = nil 
    assert_not @laboratory_exam.valid?
    assert_not_empty @laboratory_exam.errors[:exam]
  end


end
