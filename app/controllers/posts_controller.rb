class PostsController < ApplicationController
    before_action :authenticate_user!, only: :new
    before_action :set_post, only: [:show, :destroy]

    def index
        @posts = Post.all
    end

    def show
        @posts = Post.all

        @next_post = @post.next
        @prev_post = @post.prev
    end

    def new
     @post = current_user.posts.build
    end


    def create
      @post = current_user.posts.build(post_params)

      if @post.save


      redirect_to posts_path
    else
        render 'new'
    end

    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private
    def set_post
        @post = Post.find(params[:id])
    end


    def post_params
        params.require(:post).permit(:content, :answer)
    end

    # def edit
    #     @post = Post.find(params[:id])
    # end

end
