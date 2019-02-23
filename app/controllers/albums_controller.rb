class AlbumsController < ApplicationController
#Delete this before action after the completion of album functionality
    skip_before_action :authenticate_user!

    def index
        @albums = Album.all
    end

    def new
        @album = Album.new
    end

    def create
        @album = Album.new(album_params)
        @album.user = current_user
        if @album.save
            flash[:success] = "Successfully Created you Album: #{@album.title}"
            redirect_to album_path(@album)
        else
            render "new"
        end
    end

    def edit
        @album = Album.find(params[:id])
    end

    def update
        @album = Album.find(params[:id])
        if @album.update(album_params)
            flash[:success] = "Album was successfully updated"
            redirect_to album_path(@album)
        else
            render 'edit'
        end
    end

    def show
        @album = Album.find(params[:id])
    end
    
    def destroy
        @album = Album.find(params[:id])
        @album.destroy
        flash[:danger] = "Album was Successfully Deleted"
        redirect_to albums_path
    end

    private
    def album_params
        params.require(:album).permit(:title, :description, :visible)
    end
end