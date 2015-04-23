require 'smartdown/model/answer/money'

module SmartdownPlugins
  module StudentFinanceCalculatorSmartdown
    def self.maintenance_grant_amount(household_income)
      # 2015-16 rates are the same as 2014-15:
      # max of £3,387 for income up to £25,000 then,
      # £1 less than max for each whole £5.28 above £25000 up to £42,611
      # min grant is £50 for income = £42,620
      # no grant for  income above £42,620
      if household_income <= 25000
        Smartdown::Model::Answer::Money.new('3387')
      else
        if household_income > 42620
          Smartdown::Model::Answer::Money.new('0')
        else
          Smartdown::Model::Answer::Money.new(3387 - ((household_income - 25000) / 5.28).floor)
        end
      end
    end

    def self.maintenance_loan_amount(start_date, study_location, household_income)
      if household_income <= 42875
        # reduce maintenance loan by £0.5 for each £1 of maintenance grant
        Smartdown::Model::Answer::Money.new ( max_maintenance_loan_amount(start_date, study_location) - (maintenance_grant_amount(household_income).value / 2.0).floor)
      else
        # reduce maintenance loan by £1 for each full £9.90 of income above £42875 until loan reaches 65% of max, when no further reduction applies
        min_loan_amount = (0.65 * max_maintenance_loan_amount(start_date, study_location).value).floor # to match the reference table
        reduced_loan_amount = max_maintenance_loan_amount(start_date, study_location) - ((household_income - 42875) / 9.59).floor
        if reduced_loan_amount > min_loan_amount
          Smartdown::Model::Answer::Money.new (reduced_loan_amount)
        else
          Smartdown::Model::Answer::Money.new (min_loan_amount)
        end
      end
    end
    
    def self.max_maintainence_loan_amounts
      {
        "2014-2015" => {
          "at-home" => 4418,
          "away-outside-london" => 5555,
          "away-in-london" => 7751
        },
        "2015-2016" => {
          "at-home" => 4565,
          "away-outside-london" => 5740,
          "away-in-london" => 8009
        }
      }
    end
    
    def self.max_maintenance_loan_amount(start_date, study_location)
      Smartdown::Model::Answer::Money.new(max_maintainence_loan_amounts.fetch(start_date.value).fetch(study_location.value).to_s)
    end
    
    def self.eu_full_time?(course_type)
      course_type == 'eu-full-time'
    end
    
    def self.eu_part_time?(course_type)
      course_type == 'eu-part-time'
    end
    
    def self.no_additional_benefits?(additional_qualifying_circumstances, course_studied)
      additional_qualifying_circumstances.value.include?('no') && (course_studied.value == 'none-of-the-above')
    end
    
    def self.children_under_17?(additional_qualifying_circumstances)
      additional_qualifying_circumstances.value.include?('children-under-17')
    end

    def self.dependent_adult?(additional_qualifying_circumstances)
      additional_qualifying_circumstances.value.include?('dependant-adult')
    end

    def self.has_disability?(additional_qualifying_circumstances)
      additional_qualifying_circumstances.value.include?('has-disability')
    end

    def self.low_income?(additional_qualifying_circumstances)
      additional_qualifying_circumstances.value.include?('low-income')
    end
    
    def self.studying_teacher_training?(course_studied)
      course_studied.value == 'teacher-training'
    end
    
    def self.studying_dental_medical_healthcare?(course_studied)
      course_studied.value == 'dental-medical-healthcare'
    end
    
    def self.studying_social_work?(course_studied)
      course_studied.value == 'social-work'
    end
    
    def self.course_starts_in_2014_2015?(start_date)
      start_date == '2014-2015'
    end
    
    def self.course_starts_in_2015_2016?(start_date)
      start_date == '2015-2016'
    end
  end
end
