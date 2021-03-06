module SmartAnswer
  class LandlordImmigrationCheckFlow < Flow
    def define
      name "landlord-immigration-check"
      status :draft
      satisfies_need "102373"

      postcode_question :property? do
        next_node do |response|
          if Calculators::LandlordImmigrationCheckCalculator.valid_postcode(response)
            :main_home?
          else
            :outcome_check_not_needed
          end
        end
      end

      multiple_choice :main_home? do
        option "yes"
        option "no"

        next_node do |response|
          case response
          when "yes"
            :tenant_over_18?
          when "no"
            :property_type?
          end
        end
      end

      multiple_choice :tenant_over_18? do
        option "yes"
        option "no"

        next_node do |response|
          case response
          when "yes"
            :has_uk_passport?
          when "no"
            :outcome_check_not_needed_when_under_18
          end
        end
      end

      multiple_choice :property_type? do
        option "holiday_accommodation"
        option "social_housing"
        option "care_home"
        option "hostel_or_refuge"
        option "mobile_home"
        option "employee_accommodation"
        option "student_accommodation"
        option "7_year_lease_property"

        next_node do |response|
          case response
          when "holiday_accommodation"
            :outcome_check_not_needed_if_holiday_or_under_3_months
          when "social_housing"
            :outcome_check_not_needed
          when "care_home"
            :outcome_check_not_needed_when_care_home
          when "hostel_or_refuge"
            :outcome_check_not_needed_when_hostel_refuge
          when "mobile_home"
            :outcome_check_not_needed_when_mobile_home
          when "employee_accommodation"
            :outcome_check_not_needed_when_employee_home
          when "student_accommodation"
            :outcome_check_may_be_needed_when_student
          when "7_year_lease_property"
            :outcome_check_needed_if_break_clause
          end
        end
      end

      multiple_choice :has_uk_passport? do
        option "yes"
        option "no"

        next_node do |response|
          case response
          when "yes"
            :outcome_can_rent
          when "no"
            :right_to_abode?
          end
        end
      end

      multiple_choice :right_to_abode? do
        option "yes"
        option "no"

        next_node do |response|
          case response
          when "yes"
            :outcome_can_rent
          when "no"
            :has_certificate?
          end
        end
      end

      multiple_choice :has_certificate? do
        option "yes"
        option "no"

        next_node do |response|
          case response
          when "yes"
            :outcome_can_rent
          when "no"
            :tenant_country?
          end
        end
      end

      multiple_choice :tenant_country? do
        option "eu_eea_switzerland"
        option "non_eea_but_with_eu_eea_switzerland_family_member"
        option "somewhere_else"

        next_node do |response|
          case response
          when "eu_eea_switzerland"
            :has_documents?
          when "non_eea_but_with_eu_eea_switzerland_family_member"
            :has_residence_card_or_eu_eea_swiss_family_member?
          when "somewhere_else"
            :has_other_documents?
          end
        end
      end

      multiple_choice :has_documents? do
        option "yes"
        option "no"

        next_node do |response|
          case response
          when "yes"
            :outcome_can_rent
          when "no"
            :has_other_documents?
          end
        end
      end

      multiple_choice :has_other_documents? do
        option "yes"
        option "no"

        next_node do |response|
          case response
          when "yes"
            :outcome_can_rent
          when "no"
            :time_limited_to_remain?
          end
        end
      end

      multiple_choice :has_asylum_card? do
        option "yes"
        option "no"

        next_node do |response|
          case response
          when "yes"
            :outcome_can_rent_for_12_months
          when "no"
            :immigration_application?
          end
        end
      end

      multiple_choice :time_limited_to_remain? do
        option "yes"
        option "no"

        next_node do |response|
          case response
          when "yes"
            :outcome_can_rent_but_check_will_be_needed_again
          when "no"
            :has_residence_card_or_eu_eea_swiss_family_member?
          end
        end
      end

      multiple_choice :immigration_application? do
        option "yes"
        option "no"

        next_node do |response|
          case response
          when "yes"
            :outcome_can_rent_for_12_months
          when "no"
            :outcome_can_not_rent
          end
        end
      end

      multiple_choice :has_residence_card_or_eu_eea_swiss_family_member? do
        option "yes"
        option "no"

        next_node do |response|
          case response
          when "yes"
            :outcome_can_rent
          when "no"
            :has_asylum_card?
          end
        end
      end

      outcome :outcome_can_not_rent
      outcome :outcome_can_rent
      outcome :outcome_can_rent_but_check_will_be_needed_again
      outcome :outcome_can_rent_for_12_months
      outcome :outcome_check_may_be_needed_when_student
      outcome :outcome_check_needed_if_break_clause
      outcome :outcome_check_not_needed
      outcome :outcome_check_not_needed_if_holiday_or_under_3_months
      outcome :outcome_check_not_needed_when_care_home
      outcome :outcome_check_not_needed_when_employee_home
      outcome :outcome_check_not_needed_when_hostel_refuge
      outcome :outcome_check_not_needed_when_mobile_home
      outcome :outcome_check_not_needed_when_under_18
    end
  end
end
