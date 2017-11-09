class PagesController < ApplicationController
  def examples
    render 'examples' and return
  end
  def railstutorial
    render 'rails' and return
  end
  def railsSendScoreTutorial
    render 'rails_send_scores' and return
  end
end
