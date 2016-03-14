class ArticlesController < ApplicationController

  def index
    @articles = Admin.all
  end

end

