module Admins
	class ArticlesController < ApplicationController
  
    def index
      @articles = Article.all
    end
  
	end
end
