class PagesController < ApplicationController
  def examples
    render 'examples' and return
  end
  def railstutorial
    render 'rails' and return
  end
end
