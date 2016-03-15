class Admin::ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
  
    def index
      
      @articles = current_admin.articles
      #@articles = Article.all
    end
  

  def new
     @article = Article.new
  end
  

  def create
    @article = Article.new(article_params)

    @article.person_id = current_admin.id
    @article.person_type = "Admin"

    respond_to do |format|
      if @article.save
        format.html { redirect_to [:admin, @article], notice: 'Facility was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end    



  # GET /articles/1
  # GET /articles/1.json
  def show
  end


  # GET /articles/1/edit
  def edit
  end



  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to [:admin, @article], notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end


    def article_params
      params.require(:article).permit(:post, :person_id, :person_type)
    end

end
