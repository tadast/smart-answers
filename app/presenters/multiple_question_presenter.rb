class MultipleQuestionPresenter < NodePresenter
  # def response_label(value)
  #   value
  # end

  # def partial_template_name
  #   "#{@node.class.name.demodulize.underscore}_question"
  # end

  def multiple_responses?
    true
  end

  def questions
    @node.questions
  end
end
