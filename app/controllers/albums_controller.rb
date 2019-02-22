class AlbumsController < ApplicationController
#Delete this before action after the completion of album functionality
    skip_before_action :authenticate_user!

    def new
        @album = Album.new
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            flash[:notice] = "Successfully Created you Album: #{@album.title}"
            redirect_to album_path
        else
            render "new"
        end
    end

    def show
        @album = Album.find(params[:id])
    end
    
    private
    def album_params
        params.require(:album).permit(:title, :description)
    end
end