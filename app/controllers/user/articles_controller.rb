class User::ArticlesController < ApplicationController
  
    def index
      @articles = Article.all
    end
  
end
