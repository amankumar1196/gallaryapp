class AlbumsController < ApplicationController
#Delete this before action after the completion of album functionality
    skip_before_action :authenticate_user!
    
    def index
        @albums = Album.all
    end

    def new
        @album = Album.new
    end

end