class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_article
    before_action :set_comment, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]
  
    def create
      @comment = @article.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to @article, notice: "Commentaire ajouté avec succès."
      else
        redirect_to @article, alert: "Erreur lors de l'ajout du commentaire."
      end
    end

    def show
      # @article et @comment sont déjà définis par les before_action
    end
  
    def edit
      # Affichage du formulaire d'édition
    end
  
    def update
      if @comment.update(comment_params)
        redirect_to @article, notice: "Commentaire mis à jour."
      else
        render :edit
      end
    end
  
    def destroy
      @comment.destroy
      redirect_to @article, notice: "Commentaire supprimé."
    end
  
    private
  
    def set_article
      @article = Article.find(params[:article_id])
    end
  
    def set_comment
      @comment = @article.comments.find(params[:id])
    end
  
    def authorize_user!
      redirect_to @article, alert: "Action non autorisée." unless @comment.user == current_user
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  