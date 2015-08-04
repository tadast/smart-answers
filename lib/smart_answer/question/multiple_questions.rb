module SmartAnswer
  module Question
    class MultipleQuestions < Base
      attr_reader :permitted_options, :flow, :questions

      def initialize(name, flow, options = {}, &block)
        @permitted_options = []
        @flow = flow
        @questions = []
        super(name, options = {}, &block)
      end

      def multiple_choice(name, options = {}, &block)
        # needs decorating with a presenter
        question = Question::MultipleChoice.new(name, options, &block)
        question = MultipleChoiceQuestionPresenter.new(i18n_prefix, question, @state)
        @questions << question
        question
      end

      def value_question(name, options = {}, &block)
        question = Question::Value.new(name, options, &block)
        question = ValueQuestionPresenter.new(i18n_prefix, question, @state)
        @questions << question
        question
      end

    private

      def i18n_prefix
        "flow.#{flow.name}"
      end
    end
  end
end
