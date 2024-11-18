class PhotosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]
  
    def index
      @photos = Photo.all
    end
  
    def show
    end
  
    def new
      @photo = current_user.photos.build
    end
  
    def create
      @photo = current_user.photos.build(photo_params)
      if @photo.save
        redirect_to @photo, notice: "Photo téléchargée avec succès."
      else
        render :new
      end
    end
  
    def edit
      # Affichage du formulaire d'édition
    end
  
    def update
      if @photo.update(photo_params)
        redirect_to @photo, notice: "Photo mise à jour."
      else
        render :edit
      end
    end
  
    def destroy
      @photo.destroy
      redirect_to photos_path, notice: "Photo supprimée."
    end
  
    private
  
    def set_photo
      @photo = Photo.find(params[:id])
    end
  
    def authorize_user!
      redirect_to photos_path, alert: "Action non autorisée." unless @photo.user == current_user
    end
  
    def photo_params
      params.require(:photo).permit(:image)
    end
  end
  