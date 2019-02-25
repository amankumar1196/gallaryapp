class PostsController < ApplicationController

    def new
        @album = Album.find(params[:album_id])
        @post = @album.posts.new
    end

    def create
        @album = Album.find(params[:album_id])
        @post = @album.posts.create(post_params)
        redirect_to album_path(@album)
   
    end

    def destroy
        @album = Album.find(params[:album_id])
        @post = @album.posts.find(params[:id])
        @post.destroy
        redirect_to album_path(@album)
    end

    def show
        @album = Album.find(params[:album_id])
        @post = @album.posts.find(params[:id])
    end
    
    private
        def post_params
            params.require(:post).permit(:title,:file)
        end
end