class AlbumsController < ApplicationController
    skip_before_action :authenticate_user!
    before_action :set_album, only: [:show, :edit, :update, :destroy]
    #before_action :require_same_user, only: [:edit, :update, :show, :destroy]
    def index
        @albums = Album.all
    end

    def new
        @album = Album.new
    #    3.times {@album.tags.build}
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
    end

    def update
        if @album.update(album_params)
            flash[:success] = "Album was successfully updated"
            redirect_to album_path(@album)
        else
            render 'edit'
        end
    end

    def show
    end
    
    def destroy
        @album.destroy
        flash[:danger] = "Album was Successfully Deleted"
        redirect_to user_path(current_user)
    end

    private

    def set_album
        @album = Album.find(params[:id])
    end

    def album_params
        params.require(:album).permit(:title, :description, :visible)
    end


end