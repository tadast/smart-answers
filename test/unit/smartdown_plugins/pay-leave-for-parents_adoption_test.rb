require 'test_helper'
require 'smartdown_plugins/pay-leave-for-parents-adoption/render_time'

module SmartdownPlugins

  class PayLeaveForParentsAdoptionTest < ActiveSupport::TestCase
    due_date = Smartdown::Model::Answer::Date.new("2015-1-1")

    context "due date in 2013-2014 range" do
      date = Smartdown::Model::Answer::Date.new("2014-1-1")

      should "be in 2013-2014 range" do
        assert_equal true, SmartdownPlugins::PayLeaveForParentsAdoption.in_2013_2014_fin_year?(date)
      end

      should "return £ 109 for lower_earnings_amount" do
        assert_equal 109, SmartdownPlugins::PayLeaveForParentsAdoption.lower_earnings_amount(date)
      end

      should "rate_of_smp_33_weeks returns 90% of the given weekly salary when it is less than £136.78" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_smp_33_weeks(salary_1, date)
      end

      should "rate_of_smp_33_weeks returns 136.78 when 90% of the given weekly salary is higher than £136.78" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 136.78, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_smp_33_weeks(salary_1, date)
      end

      should "rate_of_maternity_allowance returns 136.78 when 90% of the given weekly salary is higher than £136.78" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 136.78, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_maternity_allowance(salary_1, date)
      end

      should "rate_of_maternity_allowance returns 90% of the given weekly salary when it is less than £136.78" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_maternity_allowance(salary_1, date)
      end

      should "rate_of_paternity_pay returns 136.78 when 90% of the given weekly salary is higher than £136.78" do
        salary_2 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 136.78, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_paternity_pay(salary_2, date)
      end

      should "rate_of_paternity_pay returns 90% of the given weekly salary when it is less than £136.78" do
        salary_2 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_paternity_pay(salary_2, date)
      end

      should "rate_of_shpp returns 136.78 when 90% of the given weekly salary is higher than £136.78" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 136.78, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_shpp(salary_1, date)
      end

      should "rate_of_shpp returns 90% of the given weekly salary when it is less than £136.78" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_shpp(salary_1, date)
      end
    end

    context "due date in 2014-2015 range" do
      date = Smartdown::Model::Answer::Date.new("2015-1-1")

      should "be in 2013-2014 range" do
        assert_equal true, SmartdownPlugins::PayLeaveForParentsAdoption.in_2014_2015_fin_year?(date)
      end

      should "return £ 111 for lower_earnings_amount" do
        assert_equal 111, SmartdownPlugins::PayLeaveForParentsAdoption.lower_earnings_amount(date)
      end

      should "rate_of_smp_33_weeks returns 90% of the given weekly salary when it is less than £138.18" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_smp_33_weeks(salary_1, date)
      end

      should "rate_of_smp_33_weeks returns 138.18 when 90% of the given weekly salary is higher than £138.18" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 138.18, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_smp_33_weeks(salary_1, date)
      end

      should "rate_of_maternity_allowance returns 139.58 when 90% of the given weekly salary is higher than £138.18" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 138.18, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_maternity_allowance(salary_1, date)
      end

      should "rate_of_maternity_allowance returns 90% of the given weekly salary when it is less than £138.18" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_maternity_allowance(salary_1, date)
      end

      should "rate_of_paternity_pay returns 138.18 when 90% of the given weekly salary is higher than £138.18" do
        salary_2 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 138.18, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_paternity_pay(salary_2, date)
      end

      should "rate_of_paternity_pay returns 90% of the given weekly salary when it is less than £138.18" do
        salary_2 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_paternity_pay(salary_2, date)
      end

      should "rate_of_shpp returns 138.18 when 90% of the given weekly salary is higher than £138.18" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 138.18, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_shpp(salary_1, date)
      end

      should "rate_of_shpp returns 90% of the given weekly salary when it is less than £138.18" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_shpp(salary_1, date)
      end
    end

    context "due date in 2015-2016 range" do
      date = Smartdown::Model::Answer::Date.new("2016-1-1")

      should "be in 2015-2016 range" do
        assert_equal true, SmartdownPlugins::PayLeaveForParentsAdoption.in_2015_2016_fin_year?(date)
      end

      should "return £ 112 for lower_earnings_amount" do
        assert_equal 112, SmartdownPlugins::PayLeaveForParentsAdoption.lower_earnings_amount(date)
      end

      should "rate_of_smp_33_weeks returns 90% of the given weekly salary when it is less than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_smp_33_weeks(salary_1, date)
      end

      should "rate_of_smp_33_weeks returns 139.58 when 90% of the given weekly salary is higher than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 139.58, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_smp_33_weeks(salary_1, date)
      end

      should "rate_of_maternity_allowance returns 139.58 when 90% of the given weekly salary is higher than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 139.58, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_maternity_allowance(salary_1, date)
      end

      should "rate_of_maternity_allowance returns 90% of the given weekly salary when it is less than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_maternity_allowance(salary_1, date)
      end

      should "rate_of_paternity_pay returns 139.58 when 90% of the given weekly salary is higher than £139.58" do
        salary_2 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 139.58, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_paternity_pay(salary_2, date)
      end

      should "rate_of_paternity_pay returns 90% of the given weekly salary when it is less than £139.58" do
        salary_2 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_paternity_pay(salary_2, date)
      end

      should "rate_of_shpp returns 139.58 when 90% of the given weekly salary is higher than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 139.58, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_shpp(salary_1, date)
      end

      should "rate_of_shpp returns 90% of the given weekly salary when it is less than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_shpp(salary_1, date)
      end
    end

    context "due date outside all ranges" do
      date = Smartdown::Model::Answer::Date.new("2022-1-1")

      should "return the latest_pat_leave known lower_earnings_amount" do
        assert_equal 112, SmartdownPlugins::PayLeaveForParentsAdoption.lower_earnings_amount(date)
      end

      should "rate_of_smp_33_weeks returns 90% of the given weekly salary when it is less than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_smp_33_weeks(salary_1, date)
      end

      should "rate_of_smp_33_weeks returns 139.58 when 90% of the given weekly salary is higher than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 139.58, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_smp_33_weeks(salary_1, date)
      end

      should "rate_of_maternity_allowance returns 139.58 when 90% of the given weekly salary is higher than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 139.58, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_maternity_allowance(salary_1, date)
      end

      should "rate_of_maternity_allowance returns 90% of the given weekly salary when it is less than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_maternity_allowance(salary_1, date)
      end

      should "rate_of_paternity_pay returns 139.58 when 90% of the given weekly salary is higher than £139.58" do
        salary_2 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 139.58, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_paternity_pay(salary_2, date)
      end

      should "rate_of_paternity_pay returns 90% of the given weekly salary when it is less than £139.58" do
        salary_2 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_paternity_pay(salary_2, date)
      end

      should "rate_of_shpp returns 139.58 when 90% of the given weekly salary is higher than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("200-week")
        assert_equal 139.58, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_shpp(salary_1, date)
      end

      should "rate_of_shpp returns 90% of the given weekly salary when it is less than £139.58" do
        salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
        assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_shpp(salary_1, date)
      end
    end

    test "continuity_start_date" do
      expected = Smartdown::Model::Answer::Date.new("2014-3-29")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.continuity_start_date(due_date)
    end

    test "continuity_end_date" do
      expected = Smartdown::Model::Answer::Date.new("2014-9-14")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.continuity_end_date(due_date)
    end

    test "earnings_employment_start_date" do
      expected = Smartdown::Model::Answer::Date.new("2013-9-22")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.earnings_employment_start_date(due_date)
    end

    test "earnings_employment_end_date" do
      expected = Smartdown::Model::Answer::Date.new("2014-12-27")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.earnings_employment_end_date(due_date)
    end

    test "lower_earnings_start_date" do
      expected = Smartdown::Model::Answer::Date.new("2014-7-26")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.lower_earnings_start_date(due_date)
    end

    test "lower_earnings_end_date" do
      expected = Smartdown::Model::Answer::Date.new("2014-9-20")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.lower_earnings_end_date(due_date)
    end

    test "earliest_start_mat_leave" do
      expected = Smartdown::Model::Answer::Date.new("2014-10-12")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.earliest_start_mat_leave(due_date)
    end

    test "end_of_additional_paternity_leave" do
      expected = Smartdown::Model::Answer::Date.new("2016-1-1")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.end_of_additional_paternity_leave(due_date)
    end

    test "end_of_shared_parental_leave" do
      expected = Smartdown::Model::Answer::Date.new("2016-1-1")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.end_of_shared_parental_leave(due_date)
    end

    test "latest_pat_leave" do
      expected = Smartdown::Model::Answer::Date.new("2015-2-26")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.latest_pat_leave(due_date)
    end

    test "maternity_leave_notice_date" do
      expected = Smartdown::Model::Answer::Date.new("2014-9-20")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.maternity_leave_notice_date(due_date)
    end

    test "paternity_leave_notice_date" do
      expected = Smartdown::Model::Answer::Date.new("2014-9-20")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.paternity_leave_notice_date(due_date)
    end

    test "start_of_additional_paternity_leave" do
      expected = Smartdown::Model::Answer::Date.new("2015-5-21")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.start_of_additional_paternity_leave(due_date)
    end

    test "start_of_maternity_allowance" do
      expected = Smartdown::Model::Answer::Date.new("2014-10-12")
      assert_equal expected, SmartdownPlugins::PayLeaveForParentsAdoption.start_of_maternity_allowance(due_date)
    end

    test "rate_of_smp_6_weeks returns 90% of the given weekly salary" do
      salary_1 = Smartdown::Model::Answer::Salary.new("150-week")
      assert_equal 135.0, SmartdownPlugins::PayLeaveForParentsAdoption.rate_of_smp_6_weeks(salary_1)
    end

  end
end
