require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  context 'ApplicationHelper::sum' do
    should 'equal "40&nbsp;000.69" when sum is 40_000.69' do
      assert_equal '40&nbsp;000.69', sum(40_000.69)
    end

    should 'equal "0.00" when sum is -0.001' do
      assert_equal '0.00', sum(-0.001)
    end

    should 'equal "-0.01" when sum is "-0.01"' do
      assert_equal '-0.01', sum(-0.01)
    end
  end
end
