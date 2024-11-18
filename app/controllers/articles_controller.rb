class ArticlesController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles or /articles.json
  def index
    if user_signed_in?
      @articles = Article.where("private = ? OR user_id = ?", false, current_user.id)
                         .order(created_at: :desc) # Les articles les plus récents en premier
    else
      @articles = Article.where(private: false).order(created_at: :desc)
    end
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
    @photo = @article.photo
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
    @article.build_photo # Prépare l'association pour le formulaire
  end

  # GET /articles/1/edit
  def edit
    @article.build_photo unless @article.photo
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = "Article créé avec succès."
      redirect_to @article
    else
      flash.now[:alert] = "Erreur lors de la création de l'article. Veuillez vérifier vos entrées."
      render :new, status: :unprocessable_entity
    end
  end
  
  

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_path, status: :see_other, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to articles_path, notice: "Non autorisé à modifier cet article" if @article.nil?
    end

    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :private, photo_attributes: [:image])

    end
end
