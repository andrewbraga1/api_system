require 'test_helper'

class LaboratoryTest < ActiveSupport::TestCase
  def setup
    @laboratory = Laboratory.new(name: laboratories(:falsean))
  end

  context 'associations' do
    should have_many(:exams).through(:laboratory_exams)
  end

  test "valid laboratory" do
    assert @laboratory.valid?
  end

  test "presence of name" do
    @laboratory.name = nil
    assert_not @laboratory.valid?
    assert_not_empty @laboratory.errors[:name]
  end

  test 'invalid without name' do
    @laboratory.name = nil
    refute @laboratory.valid?, 'saved laboratory without a name'
    assert_not_nil @laboratory.errors[:name], 'no validation error for name present'
  end

  test "should not save laboratory without name" do
    @laboratory.name = nil
    assert_not @laboratory.save, "Saved the laboratory without a name"
  end

end
