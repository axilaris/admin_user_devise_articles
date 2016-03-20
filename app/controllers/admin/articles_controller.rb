require 'axlsx'

class Admin::ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
  

    def import

    end  


    # import excel
    def import_action
      @data = import_spreadsheet(params[:file])
      
      respond_to do |format|
        format.html 
        format.json { render json: @data }
      end

    end  

    # export excel and allow user to download
    def export      

      p = Axlsx::Package.new
      wb = p.workbook

      wb.add_worksheet(:name => "Basic Worksheet") do |sheet|
        sheet.add_row ["First Column", "Second", "Third"]
        sheet.add_row [1, 2, 3]
        sheet.add_row ['     preserving whitespace']
      end      

      send_data p.to_stream.read, :filename => "export.xlsx"

    end 

    def index      
      @articles = current_admin.articles
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

    # import excel - open excel
    def open_spreadsheet(file)
      case File.extname(file.original_filename)
        when ".xls" then Roo::Excel.new(file.path)
        when ".xlsx" then Roo::Excelx.new(file.path)
        else raise "Unknown file type: #{file.original_filename}"
      end
    end

    # import excel - open excel and read contents
    def import_spreadsheet(file)
      spreadsheet = open_spreadsheet(file)

      header = spreadsheet.row(1)
      data = {x: header, columns: [], keys: []}
      (2..spreadsheet.last_row).each do |i|
        data[:columns] << spreadsheet.row(i)
        data[:keys] << spreadsheet.row(i)[0]
      end
      return data


    end


end
