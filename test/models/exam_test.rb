require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  
  def setup
    @exam = Exam.new(name: exams(:ressonancia))
  end

  context 'associations' do
    should have_many(:laboratories).through(:laboratory_exams)
  end

  test "valid exam" do
    assert @exam.valid?
  end

  test "presence of name" do
    @exam.name = nil
    assert_not @exam.valid?
    assert_not_nil @exam.errors[:name]
  end

  test 'invalid without name' do
    @exam.name = nil
    refute @exam.valid?, 'saved exam without a name'
    assert_not_nil @exam.errors[:name], 'no validation error for name present'
  end

  test "should not save exam without name" do
    @exam.name = nil
    assert_not @exam.save, "Saved the exam without a name"
  end

end
