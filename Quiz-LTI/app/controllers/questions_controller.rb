class QuestionsController < ApplicationController
  before_action :authenticate_user
  after_action :allow_iframe, only: [:show, :result]
  @@count=0
  @@result=0
  @@falseCount=0
  def self.count
    @@count
  end
  def self.result
    @@result
  end
  def index
    @questions = Question.all
  end
  def new
    @question = Question.new
  end
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end
  def show
    @question = Question.find(params[:id])
  end
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end
  def submitQuestion
    @question = Question.find(params[:question][:id])
    if(params[:question][:option]==@question.correct)
      @@count = @@count + 1
    else
      @@falseCount = @@falseCount + 1
    end
    if Question.exists?(params[:question][:id].to_i+1)
      @question = Question.find(params[:question][:id].to_i+1)
      redirect_to @question
    else
      if session[:isLTI]
        @@result = @@count.to_f/(@@count+@@falseCount)
        @@count = 0
        @@falseCount = 0
        redirect_to(:controller => "lti", :action => "submitscore", :result => @@result)
      else
        @@result = @@count
        @@count = 0
        @@falseCount = 0
        redirect_to(:action => "result")
      end
    end
  end
  def result
  end
  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
  private
  def question_params
    params.require(:question).permit(:title, :option1, :option2, :option3, :option4, :correct)
  end
end
