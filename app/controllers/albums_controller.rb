class AlbumsController < ApplicationController

	def new
		@album = current_user.albums.new
		@photo = @album.photos.new
		@tag = @photo.tags.build
	end

	def create
		debugger
		@album =current_user.albums.new(album_params)
		#@album.photos.first.tags.first[:id]=Tag.where(name: @album.photos.first.tags.first.name).first.id
		if
			@album.save
			redirect_to @album
		else
			render 'new'
		end
	end

	def show
		@album=Album.find(params[:id])
	end

	def destroy
  		@album = Album.find(params[:id])
  		@album.destroy

  		redirect_to albums_path
	end

	def update
  		@album = Album.find(params[:id])

  		if @album.update(album_params)
    		redirect_to @album
  		else
   			render 'edit'
  		end
	end

	def edit
  		@album = Album.find(params[:id])
	end

	def index
		@albums=current_user.albums.all
	end

	private
	def album_params
		params.require(:album).permit(:name,:description,photos_attributes: [:name,:avatar,tags_attributes: [:name]])
	end

end