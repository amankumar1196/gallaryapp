class TagsController < ApplicationController 
    
    def index
        @tags = Tag.all
    end

    def new
        @tag = Tag.new
    end
    
    def create
        @tag =Tag.new(tag_params)
        if @tag.save
            flash[:success] = "Category was successfully created"
            redirect_to tag_path(@tag)
        else
            render 'new'
        end
    end
    
    def edit
        @tag = Tag.find(params[:id])
    end
    
    def update
        @tag = Tag.find(params[:id])
        if @tag.update(tag_params) 
            flash[:success] = "Category name was successfully updated"
            redirect_to tag_path(@tag)
        else
            render 'edit'
        end
    end

    def destroy 
        @tag = Tag.find(params[:id])
        @tag.destroy
        redirect_to tags_path
    end

    def show
        @tag = Tag.find(params[:id])
        @tag_albums = @tag.albums
    end
    
    private
        def tag_params
            params.require(:tag).permit(:name, album_ids: [])
        end

end

