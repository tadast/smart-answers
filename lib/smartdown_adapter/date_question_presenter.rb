module SmartdownAdapter
  class DateQuestionPresenter < SmartdownAdapter::QuestionPresenter
    #TODO: range should be specified in smartdown and taken from there
    #these are only defaults
    #in the future we will want to specify in smartdown start/end etc,,,
    def defaulted_day?
      false
    end

    def defaulted_month?
      false
    end

    def defaulted_year?
      false
    end

    def default
      nil
    end

    def start_date
      Date.new(@smartdown_question.start_year)
    end

    def end_date
      Date.new(@smartdown_question.end_year)
    end

    def to_response(input)
      date = ::Date.parse(input)
      {
        day: date.day,
        month: date.month,
        year: date.year
      }
    rescue
      nil
    end
  end
end
