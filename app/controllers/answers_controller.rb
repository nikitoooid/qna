class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_question, only: [:new, :create]

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to question_path(@question), notice: 'Your answer successfully created.'
    else
      redirect_to question_path(@question), alert: 'Your answer not created!'
    end
  end

  private
  
  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

end
