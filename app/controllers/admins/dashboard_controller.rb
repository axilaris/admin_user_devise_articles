module Admins
class DashboardController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    # @articles = Article.all
  end


 
end
end
