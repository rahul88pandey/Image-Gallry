class PhotosController < ApplicationController
  def new
  	@album = Album.new
  	@album = Album.all
  	@photo = Photo.new
	session[:current_album_id]
  end

  def create
  	@photo = Photo.new(photo_params)

  	if
  		@photo.save
  		redirect_to @photo
  	else
  		render 'new'
  	end
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def destroy
  	@photo = Photo.find(params[:id])
  		@photo.destroy

  		redirect_to photos_path
  end

  def index
  end

  def edit
	@photo = Photo.find(params[:id])
  end

  def update
  	@photo = Photo.find(params[:id])

	if @photo.update(photo_params)
    	redirect_to @photo
  	else
   		render 'edit'
  	end
  end

  private
  def photo_params
  	params.require(:photo).permit(:name,:avatar,:album_id)
  end

end