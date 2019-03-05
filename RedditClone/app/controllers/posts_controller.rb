class PostsController < ApplicationController
    before_action :ensure_login
    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id 
        @post.sub_id = params[:sub_id]
        if @post.save
            redirect_to sub_url(@post.sub_id)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
         @post = current_user.posts.find(params[:id])
         if @post.update_attributes(post_params)
             redirect_to sub_url(@post.sub_id)
         else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
         end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to sub_url(@post.sub_id)
    end 
    private
    def post_params
        params.require(:post).permit(:title,:url,:content,:sub_id)
    end
end
